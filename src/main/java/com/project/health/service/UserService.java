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
	public int doUpdate(User inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doDelete(User inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doSave(User inVO) throws SQLException {
		return 0;
	}

	@Override
	public User doSelectOne(User inVO) throws SQLException, NullPointerException {
		// TODO Auto-generated method stub
		return null;
	}

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
}
