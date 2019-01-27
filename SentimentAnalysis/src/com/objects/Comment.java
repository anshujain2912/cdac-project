package com.objects;

import java.io.Serializable;

public class Comment{
	private int id;
	private int productId;
	private int userId;
	private String userName;
	private String commentText;
	private String sentiment;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public String getSentiment() {
		return sentiment;
	}
	public void setSentiment(String sentiment) {
		this.sentiment = sentiment;
	}
	@Override
	public String toString() {
		return "Comment [productId=" + productId + ", userId=" + userId + ", commentText=" + commentText
				+ ", sentiment=" + sentiment + "]";
	}
	
	
}
