package com.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dao.IUserDao;
import com.objects.ChangePasswordRequest;
import com.objects.User;
import com.services.IUserService;

@Service
public class UserServiceImpl implements IUserService{
	
	@Autowired
	private IUserDao userDao;
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}
	@Override
	public User validateUser(User user) {
		// TODO Auto-generated method stub
		
		return userDao.validateUser(user);
	}
	@Override
	public String changePassword(User user, ChangePasswordRequest request) {
		// TODO Auto-generated method stub
		user.setPassword(request.getOldPassword());
		if(!request.getNewPassword().equals(request.getReNewPassword())) {
			return "Passwords does not match";
		}else if (validateUser(user)==null) {
			return "Invalid password";
		}
		userDao.changePassword(request);
		return "Password changed successfully";
	}
	
	
}
