package com.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IUserDao;
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
	
	
}
