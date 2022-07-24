package org.june.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.june.common.utils.PageUtils;
import org.june.ware.entity.WareInfoEntity;
import org.june.ware.vo.AddressFareVo;

import java.util.Map;

/**
 * 仓库信息
 *
 * @author lishaobo
 * @email 1243134432@qq.com
 * @date 2022-02-06 20:01:11
 */
public interface WareInfoService extends IService<WareInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPageByCondition(Map<String, Object> params);

    AddressFareVo getFare(Long addrId);
}

