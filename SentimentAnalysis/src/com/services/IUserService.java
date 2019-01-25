package com.services;

import com.objects.User;

public interface IUserService {
	public void addUser(User user);
	public User validateUser(User user);
}
