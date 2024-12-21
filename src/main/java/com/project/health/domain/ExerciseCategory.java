package com.project.health.domain;

public class ExerciseCategory {
	
	private int id;
	private String name;
	
	public ExerciseCategory() {
		super();
	}
	
	public ExerciseCategory(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ExerciseCategory [id=" + id + ", name=" + name + ", toString()=" + super.toString() + "]";
	}
	
}
