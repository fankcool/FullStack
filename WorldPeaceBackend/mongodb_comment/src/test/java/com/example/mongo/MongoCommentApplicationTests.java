package com.example.mongo;

import com.example.mongo.pojo.Comment;
import com.example.mongo.service.ICommentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;

@Slf4j
@SpringBootTest
class MongoCommentApplicationTests {

    @Autowired
    ICommentService iCommentService;

    @Test
    void contextLoads() {
    }

    @Test
    void commentTest() {
//        log.error("*** >>>: " + iCommentService.findAll());

        Page<Comment> pages = iCommentService.findCommentByParentId("fank", 1, 2);
        log.error("*** >>>: " + pages.getTotalPages() + ", " + pages.getContent());
    }
}
