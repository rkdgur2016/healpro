package com.project.health.service;

import java.sql.SQLException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.health.domain.User;
import com.project.health.essential.PLog;
import com.project.health.mapper.UserMapper;

@Service("userService")
public class UserService implements UserServiceInterface, PLog{
	
	@Autowired
	UserMapper userMapper;
	
	public UserService() {};
	
	@Override
	public int doRegister(User inVO) throws Exception {
		int flag = 0;
		
		flag = userMapper.doRegister(inVO);
		log.debug("flag : " + flag);		
		
		return flag;
	}

	@Override
	public int idCheck(String userId) throws Exception {
		int flag = 0;
		
		log.debug("1. param : " + userId);	
		flag = userMapper.idCheck(userId);
		log.debug("flag : " + flag);		
		
		return flag;
	}

	@Override
	public User login(User inVO) throws Exception {
		
		log.debug("1. param : " + inVO);
		User outVO = userMapper.login(inVO);
		log.debug("user : " + outVO);
		
		return outVO;
	}

	@Override
	public int updateProfile(User inVO) throws Exception {
		
		log.debug("1. param : " + inVO);
		int outVO = userMapper.updateProfile(inVO);
		log.debug("user : " + outVO);
		
		return outVO;
	}
}
