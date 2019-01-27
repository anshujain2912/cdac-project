package com.objects;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int id;
	private String title;
	private String description;
	private int creatorId;
	private String creatorName;
	private String imageUrl;
	private MultipartFile productImage;
	public String getCreatorName() {
		return creatorName;
	}
	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}
	
	public Product() {
		
	}
	public Product(String title,String description,int creatorId,String imageUrl) {
		this.title=title;
		this.description=description;
		this.creatorId=creatorId;
		this.imageUrl=imageUrl;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", title=" + title + ", description=" + description + ", creatorId=" + creatorId
				+ ", imageUrl=" + imageUrl + "]";
	}
	
	
}
