package com.example.mongo.controller;

import com.example.mongo.pojo.Comment;
import com.example.mongo.service.ICommentService;
import com.mongodb.client.result.UpdateResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
public class CommentController {

    @Autowired
    MongoTemplate mongoTemplate;

    @Autowired
    ICommentService iCommentService;

    @GetMapping("findAll")
    public List<Comment> findAll() {
        return iCommentService.findAll();
    }

    @GetMapping("insertOne")
    public Comment insertOne(Comment comment) {
        return iCommentService.insertOne(comment);
    }

    @GetMapping("findByPage")
    public List<Comment> findByPage(String parrentId, int page, int size) {
        Page<Comment> pages = iCommentService.findCommentByParentId(parrentId, page, size);
        log.error("page count: " + pages.getTotalPages());
        return pages.getContent();
    }

    /**
     * 点赞功能本身可以通过id先查询出来当前的值，然后再加一后再保存
     * 但是这样会对DB进行两次操作，在少量数据时无所谓，在大量数据时会存在性能问题
     * 如下是用MongoDB的自增命令$inc
     * */
    @GetMapping("like/{userId}")
    public long incrementLikeNumber(@PathVariable String userId) {

        /**
         * 查询对象
         *
         * org.springframework.data.mongodb.core.query.Query 包下的 Query，查询条件可以累加addCriteria，如下：
         *
         * Query.query(Criteria.where("userid").is(userId)).addCriteria(Criteria.where("nickNname").is(nickNname))
         * */
        Query query = Query.query(Criteria.where("userid").is(userId));

        /**
         * 更新对象
         *
         * update.set(key, value)相当于$set
         * update.inc(key)相当于$inc，默认值是1L
         * update.inc(key, incValue)相当于$inc并设置步进值
         * */
        Update update = new Update();
        update.inc("likenum");
//        update.inc("likenum", 10);

        /**
         * 查询对象
         * 更新对象
         * 集合的名字或者实体类的类型，即"comment"和Comment.class都可以
         * 返回的UpdateResult包括匹配到的值、修改的值、ObjectId
         * */
        UpdateResult updateResult = mongoTemplate.updateFirst(query, update, Comment.class);
        return updateResult.getModifiedCount();
    }

    @GetMapping("hello")
    public String hello() {

        log.info("info - say hello");
        log.warn("warn - say hello");
        log.error("error - say hello");

        return "say hello";
    }
}
