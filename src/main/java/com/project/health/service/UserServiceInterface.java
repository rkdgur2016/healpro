package com.project.health.service;

import com.project.health.domain.User;
import com.project.health.essential.WorkDiv;

public interface UserServiceInterface extends WorkDiv<User>{
	
	public int doRegister(User inVO) throws Exception;
}
