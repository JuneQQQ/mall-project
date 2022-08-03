package org.june.search.service;

import org.june.search.vo.SearchParam;
import org.june.search.vo.SearchResponse;

public interface SearchService {
    SearchResponse buildSearch(SearchParam searchParam);
}


