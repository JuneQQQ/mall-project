package org.june.search.controller;

import lombok.extern.slf4j.Slf4j;
import org.june.common.to.es.SkuEsModel;
import org.june.common.utils.R;
import org.june.search.service.ProductSaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/search")
@RestController
@Slf4j
public class ElasticSaveController {
    @Autowired
    private ProductSaveService productSaveService;

    @PostMapping("/product")
    public R productUp(@RequestBody List<SkuEsModel> skuEsModelList) {
        productSaveService.productUp(skuEsModelList);
        return R.ok();
    }
}
