package com.dao;

import java.util.List;

import com.objects.Product;

public interface IProductDao {
	public List<Product> getAllProducts();
	public List<Product> searchProduct(String query);
}
