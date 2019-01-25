package com.dao;

import com.objects.User;

public interface IUserDao {
	public void addUser(User user);
	public User validateUser(User user);
}
