package com.example.mongo.service;

import com.example.mongo.pojo.Comment;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ICommentService {

    List<Comment> findAll();

    Comment insertOne(Comment comment);

    Page<Comment> findCommentByParentId(String parentId, int page, int size);
}
