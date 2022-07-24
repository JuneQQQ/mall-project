package org.june.authentication;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
class AuthenticationApplicationTests {
    @Autowired
    private StringRedisTemplate redis;
    @Test
    void testTTL(){
        Long haha = redis.getExpire("haha");
        System.out.println(haha);
    }
    @Test
    void testhash() {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        //$2a$10$GT0TjB5YK5Vx77Y.2N7hkuYZtYAjZjMlE6NWGE2Aar/7pk/Rmhf8S
        //$2a$10$cR3lis5HQQsQSSh8/c3L3ujIILXkVYmlw28vLA39xz4mHDN/NBVUi
        String encode = bCryptPasswordEncoder.encode("123456");
        boolean matches = bCryptPasswordEncoder.matches("123456", "$2a$10$GT0TjB5YK5Vx77Y.2N7hkuYZtYAjZjMlE6NWGE2Aar/7pk/Rmhf8S");

        System.out.println(encode + "==>" + matches);
    }

    @Test
    void testJwt() {
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey("ukc8BDbRigUDaY6pZFfWus2jZWLPH9")
                .parseClaimsJws("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJndWxpLXVzZXIiLCJpYXQiOjE2NDY1NjA1NTUsImV4cCI6MTY0NjY0Njk1NSwiaWQiOiI1Iiwibmlja25hbWUiOiLQryJ9.prjVQVYlBL0vSngu1x37LcfBwJ9FjSFl5ouRnafJJxQ");
        Claims claims = claimsJws.getBody();
        System.out.println((String) claims.get("id"));
    }

    @Test
    void contextLoads() {
    }

}
