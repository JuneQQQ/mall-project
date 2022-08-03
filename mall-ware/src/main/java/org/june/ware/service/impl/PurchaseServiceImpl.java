package org.june.ware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.june.common.constant.WareConstant;
import org.june.common.utils.PageUtils;
import org.june.common.utils.Query;
import org.june.ware.dao.PurchaseDao;
import org.june.ware.entity.PurchaseDetailEntity;
import org.june.ware.entity.PurchaseEntity;
import org.june.ware.exception.PurchaseStatusException;
import org.june.ware.service.PurchaseDetailService;
import org.june.ware.service.PurchaseService;
import org.june.ware.service.WareSkuService;
import org.june.ware.vo.MergeVo;
import org.june.ware.vo.PurchaseDoneVo;
import org.june.ware.vo.PurchaseItemDoneVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service("purchaseService")
public class PurchaseServiceImpl extends ServiceImpl<PurchaseDao, PurchaseEntity> implements PurchaseService {
    @Autowired
    private PurchaseDetailService purchaseDetailService;
    @Autowired
    private WareSkuService wareSkuService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PurchaseEntity> page = this.page(
                new Query<PurchaseEntity>().getPage(params),
                new QueryWrapper<PurchaseEntity>()
        );

        return new PageUtils(page);
    }

    /**
     * 查询未领取的采购单
     */
    @Override
    public PageUtils queryPageUnreceived(Map<String, Object> params) {
        QueryWrapper<PurchaseEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("status", 0).or().eq("status", 1);
        IPage<PurchaseEntity> page = this.page(
                new Query<PurchaseEntity>().getPage(params),
                wrapper
        );
        return new PageUtils(page);
    }

    @Override
    @Transactional
    public void merge(MergeVo mergeVo) {
        Long purchaseId = mergeVo.getPurchaseId();
        // 没有采购单就新建一个
        if (purchaseId == null) {
            PurchaseEntity purchaseEntity = new PurchaseEntity();
            purchaseEntity.setStatus(WareConstant.PurchaseStatusEnum.CREATED.getCode());
            purchaseEntity.setCreateTime(new Date());
            purchaseEntity.setUpdateTime(new Date());
            this.save(purchaseEntity);
            purchaseId = purchaseEntity.getId();
        }
        for (Long itemId : mergeVo.getItems()) {
            PurchaseEntity byId = this.getById(itemId);
            if (byId == null || byId.getStatus() == null ||
                    byId.getStatus() != WareConstant.PurchaseStatusEnum.CREATED.getCode()
            ) {
                // 仅允许【新建状态】的采购单进行合并
                throw new PurchaseStatusException("订单状态不允许合并");
            }
        }

        List<Long> items = mergeVo.getItems();
        Long finalPurchaseId = purchaseId;
        List<PurchaseDetailEntity> collect = items.stream().map(i -> {
            PurchaseDetailEntity purchaseDetailEntity = new PurchaseDetailEntity();
            purchaseDetailEntity.setId(i);
            purchaseDetailEntity.setStatus(WareConstant.PurchaseDetailStatusEnum.ASSIGNED.getCode());
            purchaseDetailEntity.setPurchaseId(finalPurchaseId);
            return purchaseDetailEntity;
        }).collect(Collectors.toList());

        purchaseDetailService.updateBatchById(collect);
    }

    /**
     * 更新采购单涉及的采购需求的状态
     * @param ids 采购单s
     */
    @Override
    @Transactional
    public void received(List<Long> ids) {
        //1. 确认采购单状态（新建&已分配）
        List<PurchaseEntity> collect = ids.stream().map(this::getById).
                peek(item -> {
                    // 采购需求状态必须是【新建】||【已分配】 ---target--> 【已领取】
                    if(item.getStatus()!= WareConstant.PurchaseStatusEnum.ASSIGNED.getCode()&&item.getStatus()!=WareConstant.PurchaseStatusEnum.CREATED.getCode())
                        throw new PurchaseStatusException("采购需求状态错误");
                    item.setStatus((WareConstant.PurchaseStatusEnum.RECEIVE.getCode()));
                }).collect(Collectors.toList());
        //2. 改变采购单状态
        this.updateBatchById(collect);
        //3. 改变采购项状态
        collect.forEach(item -> {
            List<PurchaseDetailEntity> list = purchaseDetailService.listDetailByPurchaseId(item.getId());
            List<PurchaseDetailEntity> collect1 = list.stream().map(item1 -> {
                PurchaseDetailEntity detailEntity = new PurchaseDetailEntity();
                detailEntity.setId(item1.getId());
                detailEntity.setStatus(WareConstant.PurchaseDetailStatusEnum.BUYING.getCode());
                return detailEntity;
            }).collect(Collectors.toList());
            purchaseDetailService.updateBatchById(collect1);
        });
    }

    @Override
    @Transactional
    public void done(PurchaseDoneVo doneVo) {
        //1. 改变采购项状态
        boolean flag = true;
        List<PurchaseItemDoneVo> items = doneVo.getItems();
        List<PurchaseDetailEntity> updates = new ArrayList<>();
        for (PurchaseItemDoneVo item : items) {
            PurchaseDetailEntity detail = new PurchaseDetailEntity();
            if (item.getStatus() == WareConstant.PurchaseDetailStatusEnum.ERROR.getCode()) {
                flag = false;
                detail.setStatus(item.getStatus());
            } else {
                detail.setStatus(WareConstant.PurchaseDetailStatusEnum.FINISH.getCode());
                // 采购成功商品入库
                PurchaseDetailEntity byId = purchaseDetailService.getById(item.getItemId());
                wareSkuService.addStock(byId);
            }
            detail.setId(item.getItemId());
            updates.add(detail);
        }
        purchaseDetailService.updateBatchById(updates);

        //2. 改变采购单状态
        PurchaseEntity purchase = new PurchaseEntity();
        purchase.setId(doneVo.getId());
        purchase.setStatus(flag ? WareConstant.PurchaseStatusEnum.FINISH.getCode()
                : WareConstant.PurchaseStatusEnum.ERROR.getCode());
        this.updateById(purchase);
    }

}