package com.example.mongo.service.impl;

import com.example.mongo.dao.CommentRepository;
import com.example.mongo.pojo.Comment;
import com.example.mongo.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements ICommentService {

    @Autowired
    CommentRepository commentRepository;

    @Override
    public List<Comment> findAll() {
        return commentRepository.findAll();
    }

    @Override
    public Comment insertOne(Comment comment) {
        return commentRepository.insert(comment);
    }

    @Override
    public Page<Comment> findCommentByParentId(String parentId, int page, int size) {
        /**
         * page：端上传过来的是页码，此处要的是索引，所以减一
         * */
        return commentRepository.findByParentid(parentId, PageRequest.of(page - 1, size));
    }
}
