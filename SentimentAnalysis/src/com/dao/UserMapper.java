package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.objects.User;

public class UserMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		
		User user=new User();
	    user.setUserName(rs.getString("user_name"));

	    user.setPassword(rs.getString("password"));

	    user.setName(rs.getString("name"));

	    user.setNationality(rs.getString("nationality"));

	    user.setEmailId(rs.getString("email_id"));

	    user.setGender(rs.getString("gender"));

	    user.setPhoneNo(rs.getString("phone_no"));


		return user;
	}

	
}
