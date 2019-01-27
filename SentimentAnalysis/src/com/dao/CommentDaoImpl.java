package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.objects.Comment;
import com.objects.CommentMapper;
import com.objects.Product;

@Repository
public class CommentDaoImpl implements ICommentDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<Comment> getAllComments(int productId) {
		// TODO Auto-generated method stub
		
		String sql="select user.name,comments.* from user,comments where comments.product_id="+productId +" and user.id=comments.user_id order by comments.id desc";
		List<Comment> listAllComments=jdbcTemplate.query(sql, new CommentMapper());
		return listAllComments;
	}
	@Override
	public int addComment(Comment comment) {
		// TODO Auto-generated method stub
		
		String sql="insert into comments(product_id,user_id,comment_text,sentiment) values(?,?,?,?)";
		return jdbcTemplate.update(sql,comment.getProductId(),comment.getUserId(),comment.getCommentText(),comment.getSentiment());
	}

}
