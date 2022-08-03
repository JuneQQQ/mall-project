package org.june.product;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.june.product.dao.AttrGroupDao;
import org.june.product.entity.BrandEntity;
import org.june.product.service.BrandService;
import org.june.product.service.CategoryService;
import org.june.product.service.SkuSaleAttrValueService;
import org.june.product.vo.front.SkuItemSaleAttrsVo;
import org.june.product.vo.front.SpuGroupBaseAttrVo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;


@Slf4j
@SpringBootTest
class ProductApplicationTests {
    @Autowired
    BrandService brandService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    StringRedisTemplate redisTemplate;
//    @Autowired
//    RedissonClient redissonClient;

    @Autowired
    AttrGroupDao attrGroupDao;
    @Autowired
    SkuSaleAttrValueService skuSaleAttrValueService;


    @Test
    void testStringBlank(){
        System.out.println(StringUtils.isEmpty(null));
    }

    @Test
    void testList() {
        List<Integer> list1 = new ArrayList<>();
        list1.add(1000);
        list1.add(2000);
        list1.add(3000);
        List<Integer> list2 = new ArrayList<>(list1);
        list2.add(10000);
        list2.add(20000);
        list2.add(30000);
        list2.add(2000);
        list2.add(2000);
        list2.remove(0);
        System.out.println(list1);
        System.out.println(list2);


    }

    @Test
    void testLambda() {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.stream().peek(a -> {
            a += 100;
        });
        System.out.println(list);
//        System.out.println(collect);
    }

    @Test
    void testskuSaleAttrValueService() {
        List<SkuItemSaleAttrsVo> saleAttrsBySpuId = skuSaleAttrValueService.getSaleAttrsBySpuId(4L);
        System.out.println(saleAttrsBySpuId.toString());
    }

    @Test
    void testSkuInfo() {
        List<SpuGroupBaseAttrVo> attrGroupWithAttrsBySpuId = attrGroupDao.getAttrGroupWithAttrsBySpuId(2L, 225L);
        System.out.println(attrGroupWithAttrsBySpuId.toString());
    }

//    @Test
//    void testRedisson() {
//        System.out.println(redissonClient);
//        RLock dd = redissonClient.getLock("dd");
//        dd.lock();
//    }

    @Test
    void testRedisLoad() {
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        ops.set("hello", "world_" + UUID.randomUUID());
        String hello = ops.get("hello");
        System.out.println("保存测试的数据：" + hello);
    }

    @Test
    void contextLoads() {
        BrandEntity brandEntity = new BrandEntity();
        brandEntity.setName("华为");
        brandService.save(brandEntity);
        System.out.println("ok!");
    }

    @Test
    void test1() {
        Long[] catalogPath = categoryService.getCatalogPath(225L);
        log.info("catalogId-225-catalogPath:{}", Arrays.asList(catalogPath));
    }

}
