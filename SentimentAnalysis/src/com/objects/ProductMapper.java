package com.objects;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductMapper implements RowMapper<Product>{

	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		Product product=new Product();
		product.setId(rs.getInt("id"));
		product.setTitle(rs.getString("title"));
		product.setDescription(rs.getString("description"));
		product.setImageUrl(rs.getString("image_url"));
		product.setCreatorId(rs.getInt("creator_id"));
		product.setCreatorName(rs.getString("name"));
		return product;
	}

}
