package com.project.health.domain;


public class User {
	
	private int userNo;
	private String userId;
	private String userPw;
	private String name;
	private String email;
	private String birth;
	private String profile;
	
	public User() {
		super();
	}
	
	public User(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}

	public User(String userId, String userPw, String name, String email, String birth, String profile) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.profile = profile;
	}

	public User(int userNo, String userId, String userPw, String name, String email, String birth, String profile) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.profile = profile;
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

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", name=" + name + ", email="
				+ email + ", birth=" + birth + ", profile=" + profile + ", toString()=" + super.toString() + "]";
	}
	
}
