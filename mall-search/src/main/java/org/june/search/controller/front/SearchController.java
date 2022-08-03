package org.june.search.controller.front;

import lombok.extern.slf4j.Slf4j;
import org.june.search.service.SearchService;
import org.june.search.vo.SearchParam;
import org.june.search.vo.SearchResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@Slf4j
public class SearchController {
    @Autowired
    SearchService searchService;

    @RequestMapping("/search.html")
    public String index(SearchParam searchParam, Model model, HttpServletRequest request) {
        searchParam.set_queryString(request.getQueryString());
        SearchResponse response = searchService.buildSearch(searchParam);
        model.addAttribute("result", response);

        return "search";
    }

}
