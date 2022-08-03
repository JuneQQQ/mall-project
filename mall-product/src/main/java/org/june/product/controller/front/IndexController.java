package org.june.product.controller.front;

import lombok.extern.slf4j.Slf4j;
import org.june.product.entity.CategoryEntity;
import org.june.product.service.CategoryService;
import org.june.product.vo.front.Catalog2Vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class IndexController {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("/hello")
    @ResponseBody
    public String hello() {
        return "hello";
    }


    @GetMapping({"/", "/index.html"})
    public String indexPage(Model model) {
        List<CategoryEntity> categories = categoryService.getLevelOneCategories();
        model.addAttribute("categories", categories);
        return "index";
    }

    @ResponseBody
    @GetMapping("/index/json/catalog.json")
    public Map<String, List<Catalog2Vo>> getCatalogJson() {
        return categoryService.getCatalogJson();
    }

}



