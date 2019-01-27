package com.objects;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CommentMapper implements RowMapper<Comment>{

	@Override
	public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		
		Comment comment=new Comment();
		comment.setUserName(rs.getString("name"));
		comment.setProductId(rs.getInt("product_id"));
		comment.setUserId(rs.getInt("user_id"));
		comment.setCommentText(rs.getString("comment_text"));
		comment.setSentiment(rs.getString("sentiment"));
		return comment;
	}
	
	
}
