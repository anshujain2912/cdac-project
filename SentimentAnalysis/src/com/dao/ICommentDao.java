package com.dao;

import java.util.List;

import com.objects.Comment;
import com.objects.Product;

public interface ICommentDao {
	public List<Comment> getAllComments(int productId);
	public int addComment(Comment comment);
}
