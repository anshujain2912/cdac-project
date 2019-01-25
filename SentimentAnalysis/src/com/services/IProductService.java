package com.services;
import java.util.List;

import com.objects.*;

public interface IProductService {
	public List<Product> getAllProducts();
	
	public List<Product> searchProduct(String query);
	
	public void addProduct(Product product);
}
