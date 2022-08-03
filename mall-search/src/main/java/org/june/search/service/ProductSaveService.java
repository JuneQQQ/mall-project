package org.june.search.service;

import org.june.common.to.es.SkuEsModel;

import java.util.List;

public interface ProductSaveService {
    void productUp(List<SkuEsModel> skuEsModelList);
}
