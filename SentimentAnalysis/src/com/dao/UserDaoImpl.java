package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.objects.ChangePasswordRequest;
import com.objects.User;

@Repository
public class UserDaoImpl implements IUserDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		
		String sql="insert into user(user_name,name,password,email_id,phone_no,gender,nationality) values(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,user.getUserName(),user.getName(),user.getPassword(),user.getEmailId(),user.getPhoneNo(),user.getGender(),user.getNationality());
	}
	@Override
	public User validateUser(User user) {
		// TODO Auto-generated method stub
	    String sql = "select * from user where user_name='" + user.getUserName() + "' and password='" + user.getPassword()

	    + "'";

	    List<User> users = jdbcTemplate.query(sql, new UserMapper());

	    return users.size() > 0 ? users.get(0) : null;
	}
	@Override
	public void changePassword(ChangePasswordRequest request) {
		// TODO Auto-generated method stub
		String sql="update user set password=? where user.id=?";
		jdbcTemplate.update(sql, request.getNewPassword(),request.getUserId());
	}
	
}

	
