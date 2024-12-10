package com.project.health.domain;

public class Bmi {
	
	private int userNo;
	private double height;
	private double weight;
	private float bmi;
	private String state;
	private String date;
	
	public Bmi() {
		super();
	}

	public Bmi(int userNo, double height, double weight, float bmi, String state, String date) {
		super();
		this.userNo = userNo;
		this.height = height;
		this.weight = weight;
		this.bmi = bmi;
		this.state = state;
		this.date = date;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public float getBmi() {
		return bmi;
	}

	public void setBmi(float bmi) {
		this.bmi = bmi;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Bmi [userNo=" + userNo + ", height=" + height + ", weight=" + weight + ", bmi=" + bmi + ", state="
				+ state + ", date=" + date + ", toString()=" + super.toString() + "]";
	}
	
}
