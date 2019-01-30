package com.dao;

import com.objects.ChangePasswordRequest;
import com.objects.User;

public interface IUserDao {
	public void addUser(User user);
	public User validateUser(User user);
	public void changePassword(ChangePasswordRequest request);
}
