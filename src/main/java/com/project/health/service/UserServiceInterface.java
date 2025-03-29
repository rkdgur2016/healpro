package com.project.health.service;

import com.project.health.domain.User;
import com.project.health.essential.WorkDiv;

public interface UserServiceInterface {
	
	public int doRegister(User inVO) throws Exception;
	
	public User login(User inVO) throws Exception;
	
	public int idCheck(String userid) throws Exception;
	
	public int updateProfile(User userProfile) throws Exception;
}
