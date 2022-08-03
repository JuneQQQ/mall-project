package org.june.search;


import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch._types.query_dsl.QueryBuilders;
import co.elastic.clients.elasticsearch.core.BulkResponse;
import co.elastic.clients.elasticsearch.core.SearchRequest;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import lombok.Data;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
@Slf4j
public class BasicTest {
    @Autowired
    private ElasticsearchClient client;

    @Test
    void testBasicSaveAndQuery() throws IOException {
        BulkResponse bulk = client.bulk(_0 -> _0.operations
                (a -> a.index(b -> b.index("test").document(new SearchApplicationTests.User("dd", 15L))))
        );

        SearchResponse<Object> results = client
                .search(_0 -> _0.index("test")
                                .query(_1 -> _1.intervals(c -> c.field("name").match(d -> d.query("dd")))
                                ),
                        Object.class
                );
        results.hits().hits().forEach(c-> System.out.println(c.source()));
    }

    @Data
    @ToString
    public class User {
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
