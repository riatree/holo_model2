package org.yolo.holo.vo;

import java.sql.Timestamp;

public class Service {

	private int no,noSpot;
	private String name;
	private Timestamp regdate;
	
	public Service() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getNoSpot() {
		return noSpot;
	}

	public void setNoSpot(int noSpot) {
		this.noSpot = noSpot;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
