package com.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ICommentDao;
import com.objects.Comment;
import com.objects.Product;
import com.services.ICommentService;

@Service
public class CommentServiceImpl implements ICommentService{
	
	@Autowired
	private ICommentDao commentDao;
	@Override
	public List<Comment> getAllComments(int productId) {
		// TODO Auto-generated method stub
		return commentDao.getAllComments(productId);
	}
	@Override
	public int addComment(Comment comment) {
		// TODO Auto-generated method stub
		comment.setSentiment("Neutral");
		return commentDao.addComment(comment);
	}

}
