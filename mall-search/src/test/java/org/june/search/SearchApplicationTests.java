package org.june.search;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.FieldValue;
import co.elastic.clients.elasticsearch._types.SortOptions;
import co.elastic.clients.elasticsearch._types.SortOrder;
import co.elastic.clients.elasticsearch._types.aggregations.Aggregate;
import co.elastic.clients.elasticsearch._types.aggregations.Aggregation;
import co.elastic.clients.elasticsearch._types.aggregations.LongTermsBucket;
import co.elastic.clients.elasticsearch._types.aggregations.StringTermsBucket;
import co.elastic.clients.elasticsearch._types.query_dsl.BoolQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.QueryBuilders;
import co.elastic.clients.elasticsearch._types.query_dsl.RangeQuery;
import co.elastic.clients.elasticsearch.core.BulkResponse;
import co.elastic.clients.elasticsearch.core.SearchRequest;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.core.bulk.BulkResponseItem;
import co.elastic.clients.elasticsearch.core.bulk.IndexOperation;
import co.elastic.clients.elasticsearch.core.search.Highlight;
import co.elastic.clients.elasticsearch.core.search.Hit;
import co.elastic.clients.elasticsearch.core.search.HitsMetadata;
import co.elastic.clients.json.JsonData;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.ElasticsearchTransport;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import lombok.Data;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.june.common.to.es.SkuEsModel;
import org.june.search.constant.EsConstant;
import org.june.search.vo.SearchParam;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@SpringBootTest
@Slf4j
class SearchApplicationTests {
    @Autowired
    private ElasticsearchClient client;

    private org.june.search.vo.SearchResponse buildSearchResult(co.elastic.clients.elasticsearch.core.SearchResponse<SkuEsModel> results, SearchParam searchParam) {
        org.june.search.vo.SearchResponse response = new org.june.search.vo.SearchResponse();
        HitsMetadata<SkuEsModel> hitsMetadata = results.hits();
        Map<String, Aggregate> aggregations = results.aggregations();
        // 1.返回所有查询到的商品
        List<Hit<SkuEsModel>> hits = hitsMetadata.hits();
        if (CollectionUtils.isNotEmpty(hits)) {
            List<SkuEsModel> skuEsModelList = new ArrayList<>();
            for (Hit<SkuEsModel> hit : hits) {
                SkuEsModel source = hit.source();
                if (StringUtils.isNotEmpty(searchParam.getKeyword())) {
                    {
                        if (source != null) {
                            source.setSkuTitle(hit.highlight().get("skuTitle").toString().substring(1, hit.highlight().get("skuTitle").toString().length() - 1));
                        }
                    }
                }
                skuEsModelList.add(source);
            }
            response.setProducts(skuEsModelList);
        }
        // 2. 当前商品所市所涉及到的所有属性信息
        Aggregate attr_agg = aggregations.get("attr_agg");
        if (attr_agg != null) {
            List<LongTermsBucket> idAgg = attr_agg.nested().aggregations().get("attr_id_agg").lterms().buckets().array();
            List<org.june.search.vo.SearchResponse.AttrVo> attrVos = new ArrayList<>();
            if (CollectionUtils.isNotEmpty(idAgg)) {
                for (LongTermsBucket longTermsBucket : idAgg) {
                    org.june.search.vo.SearchResponse.AttrVo attrVo = new org.june.search.vo.SearchResponse.AttrVo();
                    attrVo.setAttrId(longTermsBucket.key());
                    attrVo.setAttrName(longTermsBucket.aggregations().get("attr_name_agg").sterms().buckets().array().get(0).key());
                    // 聚合属性值
                    List<StringTermsBucket> attr_value_agg = longTermsBucket.aggregations().get("attr_value_agg").sterms().buckets().array();
                    if (CollectionUtils.isNotEmpty(attr_value_agg)) {
                        ArrayList<String> values = new ArrayList<>();
                        for (StringTermsBucket stringTermsBucket : attr_value_agg) {
                            values.add(stringTermsBucket.key());
                        }
                        attrVo.setAttrValue(values);
                    }
                    attrVos.add(attrVo);
                }
            }
            response.setAttrs(attrVos);
        }

        // 3.当前所有商品所涉及到的的所有品牌信息
        Aggregate brand_agg = aggregations.get("brand_agg");
        if (brand_agg != null) {
            List<org.june.search.vo.SearchResponse.BrandVo> brandVos = new ArrayList<>();
            List<LongTermsBucket> idAgg = brand_agg.lterms().buckets().array();
            if (CollectionUtils.isNotEmpty(idAgg)) {
                for (LongTermsBucket longTermsBucket : idAgg) {
                    org.june.search.vo.SearchResponse.BrandVo brandVo = new org.june.search.vo.SearchResponse.BrandVo();
                    // brand_agg 的key即为 brandId
                    brandVo.setBrandId(longTermsBucket.key());
                    // 从子聚合中找出 品牌名 一个品牌id对应唯一一个品牌名
                    brandVo.setBrandName(longTermsBucket.aggregations().get("brand_name_agg").sterms().buckets().array().get(0).key());
                    // 从子聚合中找出 图片 一个品牌id对应唯一一个图片
                    brandVo.setBrandImg(longTermsBucket.aggregations().get("brand_img_agg").sterms().buckets().array().get(0).key());
                    brandVos.add(brandVo);
                }
            }
            response.setBrands(brandVos);
        }
        // 4.当前所有商品所涉及到的的所有分类信息
        Aggregate catalog_agg = aggregations.get("catalog_agg");
        if (catalog_agg != null) {
            List<org.june.search.vo.SearchResponse.CatalogVo> catalogVos = new ArrayList<>();
            List<LongTermsBucket> idAgg = catalog_agg.lterms().buckets().array();
            if (CollectionUtils.isNotEmpty(idAgg)) {
                for (LongTermsBucket longTermsBucket : idAgg) {
                    org.june.search.vo.SearchResponse.CatalogVo catalogVo = new org.june.search.vo.SearchResponse.CatalogVo();
                    // 设置分类id
                    catalogVo.setCatalogId(longTermsBucket.key());
                    // 从子聚合中找出 分类名
                    // 注意：一个分类id一定对应唯一的分类名，
                    // 因此只需要对 id 的聚合进行遍历
                    catalogVo.setCatalogName(longTermsBucket.aggregations().get("catalog_name_agg").sterms().buckets().array().get(0).key());
                    catalogVos.add(catalogVo);
                }
            }
            response.setCatalogs(catalogVos);
        }

        // 5.分类信息、页码
        long total = hitsMetadata.total() != null ? hitsMetadata.total().value() : 0;
        int totalPages = (int) (total + EsConstant.PRODUCT_PAGE_SIZE - 1) / EsConstant.PRODUCT_PAGE_SIZE;
        response.setTotal(total);
        response.setTotalPage(totalPages);
        response.setPageNum(searchParam.getPageNum());

        return response;
    }

    @Test
    void testEsSearch() {
        SearchParam param = new SearchParam();
//        param.setKeyword("Apple");
//        param.setBrandIds(Arrays.asList(1L, 2L, 3L));
//        param.setPageNum(2);
        List<String> attrs = new ArrayList<>();
//        attrs.add("11_7月:9月");
        attrs.add("5_2021");
        param.setAttrs(attrs);
//        param.setSkuPriceRange("1_");
//        param.setHasStock(0);


        SearchRequest.Builder searchRequestBuilder = new SearchRequest.Builder();
        /**
         * 查询开始
         */
        BoolQuery.Builder boolBuilder = QueryBuilders.bool();
        // 检索关键字
        if (StringUtils.isNotBlank(param.getKeyword())) {
            boolBuilder.must(_0 -> _0
                    .match(_1 -> _1.
                            field("skuTitle")
                            .query(FieldValue.of(param.getKeyword()))
                    ));
        }
        // 品类
        if (param.getCatalog3Id() != null) {
            boolBuilder.filter(_0 -> _0
                    .term(_1 -> _1
                            .field("catalogId")
                            .value(FieldValue.of(param.getCatalog3Id()))));
        }
        // 品牌s
        if (CollectionUtils.isNotEmpty(param.getBrandIds())) {
            List<FieldValue> collect = param.getBrandIds().stream().map(a -> FieldValue.of(a)).collect(Collectors.toList());
            boolBuilder.filter(_0 -> _0
                    .terms(_1 -> _1.field("brandId")
                            .terms(_2 -> _2.value(collect))));
        }
        // 库存
        if (param.getHasStock() != null) {
            boolBuilder.filter(_0 -> _0
                    .term(_1 -> _1
                            .field("hasStock")
                            .value(FieldValue.of(param.getHasStock() == 1))));
        }
        // 价格区间
        if (StringUtils.isNotEmpty(param.getSkuPrice())) {
            // 1_500/_500/500_
            String[] s = param.getSkuPrice().split("_");
            RangeQuery.Builder builder = new RangeQuery.Builder();
            builder.field("skuPrice");

            if (s.length == 2) {
                // 区间
                builder.gte(JsonData.of(new BigDecimal("".equals(s[0]) ? "0" : s[0])));
                if (!"".equals(s[1])) builder.lte(JsonData.of(new BigDecimal(s[1])));
            } else if (param.getSkuPrice().startsWith("_")) {
                builder.lte(JsonData.of(s[0]));
                // _500
            } else if (param.getSkuPrice().endsWith("_")) {
                builder.gte(JsonData.of(s[0]));
                // 500_
            }
            boolBuilder.filter(_0 -> _0.range(builder.build()));
        }
        // 属性s
        if (CollectionUtils.isNotEmpty(param.getAttrs())) {
            // attrs=1_5寸:8寸&attrs=2_16G:8G
            for (String attrStr : param.getAttrs()) {
                BoolQuery.Builder boolQuery = QueryBuilders.bool();
                String[] s = attrStr.split("_");
                String attrId = s[0];
                String[] attrValues = s[1].split(":");
                boolQuery.must(_0 -> _0
                        .term(_1 -> _1
                                .field("attrs.attrId")
                                .value(FieldValue.of(attrId))));
                boolQuery.must(_0 -> _0
                        .terms(_1 -> _1
                                .field("attrs.attrValue")
                                .terms(_2 -> _2.value(
                                        Arrays.stream(attrValues).map(
                                                FieldValue::of
                                        ).collect(Collectors.toList())
                                ))));
                boolBuilder.filter(_0 -> _0
                        .nested(QueryBuilders.nested()
                                .path("attrs")
                                .query(a -> a.bool(boolQuery.build())).build()));
            }
        }
        // 关联 boolQuery 与 searchRequest
        searchRequestBuilder.query(a -> a.bool(boolBuilder.build()));

        /**
         * 排序、分页、高亮开始
         */
        // 排序
        if (StringUtils.isNotEmpty(param.getSort())) {
            SortOptions.Builder sortBuilder = new SortOptions.Builder();
            // sort=hostScore_asc/desc 只能单个值
            SortOptions.Builder builder = new SortOptions.Builder();
            String sort = param.getSort();
            String[] s = sort.split("_");
            sortBuilder.field(_0 -> _0.field(s[0])
                    .order(s[1].equalsIgnoreCase("asc") ?
                            SortOrder.Asc : SortOrder.Desc));
            searchRequestBuilder.sort(sortBuilder.build());
        }
        // 分页与限制
        searchRequestBuilder.size(EsConstant.PRODUCT_PAGE_SIZE);
        if (param.getPageNum() != null) {
            // from 从哪一条记录开始   size 5  pageNum 开始页
            searchRequestBuilder.from((param.getPageNum() - 1) * EsConstant.PRODUCT_PAGE_SIZE);
        }
        // 高亮
        if (StringUtils.isNotEmpty(param.getKeyword())) {
            Highlight.Builder builder = new Highlight.Builder();
            builder.fields("skuTitle", a -> a
                    .preTags("<b style='color:red'>")
                    .postTags("</b>")
            );
            searchRequestBuilder.highlight(builder.build());
        }

        /**
         * 聚合开始
         */
        // 品牌聚合
        Map<String, Aggregation> aggs = new HashMap<>();
        aggs.put("brand_agg", Aggregation.of(_0 -> _0
                        .terms(_1 -> _1.field("brandId"))
                        .aggregations("brand_name_agg", _2 -> _2
                                .terms(_3 -> _3.field("brandName").size(10)))
                        .aggregations("brand_img_agg", _3 -> _3
                                .terms(_4 -> _4.field("brandImg").size(10)))
                )
        );
        // 分类聚合
        aggs.put("catalog_agg", Aggregation.of(_0 -> _0
                .terms(_1 -> _1.field("catalogId").size(20))
                .aggregations("catalog_name_agg", _2 -> _2
                        .terms(_3 -> _3.field("catalogName").size(20)))
        ));
        // 属性聚合
        aggs.put("attr_agg", Aggregation.of(_0 -> _0
                .nested(_1 -> _1.path("attrs"))
                .aggregations("attr_id_agg", _2 -> _2
                        .terms(_3 -> _3.field("attrs.attrId").size(10))
                        .aggregations("attr_name_agg", _4 -> _4
                                .terms(_5 -> _5.field("attrs.attrName").size(10)))
                        .aggregations("attr_value_agg", _6 -> _6
                                .terms(_7 -> _7.field("attrs.attrValue").size(10)))
                )));


        try {
            SearchResponse<SkuEsModel> results = client.
                    search(searchRequestBuilder
                                    .index(EsConstant.PRODUCT_INDEX)
                                    .aggregations(aggs)
                                    .build()
                            , SkuEsModel.class);

            org.june.search.vo.SearchResponse response = buildSearchResult(results, param);

            System.out.println();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }


    @Test
    void productUp() {
        List<SkuEsModel> skuEsModelList = new ArrayList<>();
        skuEsModelList.add(new SkuEsModel());
        skuEsModelList.add(new SkuEsModel());
        // 保存到 es
        IndexOperation.Builder<SkuEsModel> indexBuilder = new IndexOperation.Builder<>();
        skuEsModelList.forEach(a -> indexBuilder.index(EsConstant.PRODUCT_INDEX).document(a));
        try {
            BulkResponse bulkResponse = client.bulk(a -> a
                    .operations(indexBuilder.build()._toBulkOperation())
            );
            if (bulkResponse.errors()) {
                for (BulkResponseItem item : bulkResponse.items()) {
                    log.error(item.id() + "号商品上架失败，原因：" + item.error().reason());
                }
                // TODO 这里可以改成返回上架失败的商品ID
            } else {
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    void testEsS() throws IOException {
        BulkResponse bulk = client.bulk(_0 -> _0.operations
                (a -> a.index(b -> b.index("test").document(new User("dd", 15L))))
        );
        System.out.println(bulk);
    }

    @Test
    void testEsQ() throws IOException {
        SearchResponse<Object> results = client
                .search(_0 -> _0.index("products")
                                .query(_1 -> _1.intervals(c -> c.field("name").match(d -> d.query("dd")))
                                ),
                        Object.class
                );
//        System.out.println(JSON.toJSON(results.hits().hits()));
        Map<String, Aggregate> aggregations = results.aggregations();
        System.out.println(aggregations);
        List<Hit<Object>> hits = results.hits().hits();
        for (Hit<Object> hit : hits) {
            Object source = hit.source();
            System.out.println(source);
            System.out.println(JSON.toJSON(hit.source()));
        }
        System.out.println();
    }

    @Test
    void contextLoads() {
        RestClient restClient = RestClient.builder(
                new HttpHost("120.48.78.44", 9200, "http")).build();

        ElasticsearchTransport transport = new RestClientTransport(
                restClient, new JacksonJsonpMapper());

        ElasticsearchClient elasticsearchClient = new ElasticsearchClient(transport);
        System.out.println(elasticsearchClient);
    }

    @Data
    @ToString
    public static class User {
        private String name;
        private Long age;

        public User(String dd, Long i) {
            this.age = i;
            this.name = dd;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public Long getAge() {
            return age;
        }

        public void setAge(Long age) {
            this.age = age;
        }
    }


}
