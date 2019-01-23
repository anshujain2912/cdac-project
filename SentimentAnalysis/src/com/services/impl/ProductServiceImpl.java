package com.services.impl;

import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IProductDao;
import com.objects.Product;
import com.services.IProductService;

@Service
public class ProductServiceImpl implements IProductService{
	@Autowired
	private IProductDao productDao;
	
	
	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
//		List<Product> product=productDao.getAllProducts();
//		ListIterator<Product> list=product.listIterator();
//		while(list.hasNext()) {
//			System.out.println(list.next());
//		}
		return productDao.getAllProducts();
	}

	@Override
	public List<Product> searchProduct(String query) {
		// TODO Auto-generated method stub
		return productDao.searchProduct(query);
	}
	
}
