package com.project.health.domain;

public class ExercisePart {
	
	private int id;
	private String name;
	
	public ExercisePart() {
		super();
	}

	public ExercisePart(int id, String name) {
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
		return "ExercisePart [id=" + id + ", name=" + name + ", toString()=" + super.toString() + "]";
	}

	
}
