package com.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.objects.Product;

@Repository
public class ProductDaoImpl implements IProductDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
//	private SessionFactory sessionFactory;
//	public void setSessionFactory(SessionFactory sf) {
//		this.sessionFactory=sf;
//	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
//		Session session=sessionFactory.getCurrentSession();
//		List<Product> productList=session.createQuery("from Product").list();
		
		List<Map<String, Object>> res=jdbcTemplate.queryForList("select * from product");
		
		System.out.println(res.toString());
		return null;
	}

	@Override
	public List<Product> searchProduct(String query) {
		// TODO Auto-generated method stub
		return null;
	}

}
