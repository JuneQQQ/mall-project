package org.june.product.vo.front;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Catalog2Vo {
    private String id;  // 二级分类 id
    private String name; // 二级分类名
    private String catalog1Id;  //一级分类id
    private List<Catalog3Vo> catalog3List;  // 三级子分类


    @NoArgsConstructor
    @AllArgsConstructor
    @Data
    public static class Catalog3Vo {
        private String catalog2Id;
        private String id;
        private String name;
    }
}
