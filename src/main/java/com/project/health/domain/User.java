package com.project.health.domain;


public class User {
	
	private int userNo;
	private String userId;
	private String userPw;
	private String name;
	private String email;
	private String birth;
	
	
	public User() {
		super();
	}

	public User(String userId, String userPw, String name, String email, String birth) {
		this.userId = userId;
		this.userPw = userPw;
		this.name = name;
		this.email = email;
		this.birth = birth;
	}
	
	public User(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}
	
	public User(int userNo, String userId, String userPw, String name, String email, String birth) {
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.name = name;
		this.email = email;
		this.birth = birth;
	}

	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", name=" + name + ", email="
				+ email + ", birth=" + birth + ", toString()=" + super.toString() + "]";
	}
	
	
}
