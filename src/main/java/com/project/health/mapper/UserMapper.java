package com.project.health.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.health.domain.User;
import com.project.health.essential.WorkDiv;

@Mapper
public interface UserMapper extends WorkDiv<User>{
	
	public int doRegister(User inVO) throws Exception;
	
	public User login(User inVO) throws Exception;
	
	public int idCheck(String userId) throws Exception;
	
}
