package org.june.search.service.impl;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.BulkResponse;
import co.elastic.clients.elasticsearch.core.bulk.BulkOperation;
import co.elastic.clients.elasticsearch.core.bulk.BulkResponseItem;
import co.elastic.clients.elasticsearch.core.bulk.CreateOperation;
import lombok.extern.slf4j.Slf4j;
import org.june.common.to.es.SkuEsModel;
import org.june.search.constant.EsConstant;
import org.june.search.service.ProductSaveService;
import org.june.search.service.exception.ProductUpException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
@Slf4j
public class ProductSaveServiceImpl implements ProductSaveService {
    @Autowired
    private ElasticsearchClient client;

    /**
     * 该方法由product远程调用商品上架es
     */
    @Override
    public void productUp(List<SkuEsModel> skuEsModelList) {
        List<BulkOperation> list = new ArrayList<>();
        // 指定索引（类比数据库）
        for (SkuEsModel model : skuEsModelList) {
            list.add(new BulkOperation(
                    new CreateOperation.Builder<SkuEsModel>()
                            .index(EsConstant.PRODUCT_INDEX)
                            .id(model.getSkuId().toString())
                            .document(model)
                            .build()));
        }

        // 指定 id 和 source 数据
        try {
            BulkResponse bulkResponse = client.bulk(a -> a.operations(list));
            if (bulkResponse.errors()) {
                for (BulkResponseItem item : bulkResponse.items()) {
                    log.error(item.id() + "号商品上架失败，原因：" + Objects.requireNonNull(item.error()).reason());
                }
                throw new ProductUpException("商品上架异常，详情查看日志");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
