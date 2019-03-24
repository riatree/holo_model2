package org.yolo.holo.vo;

import java.sql.Timestamp;

public class Menu {

	private int no,price,noSpot, king;
	private String name;
	private Timestamp regdate;
	
	
	public Menu() {
		
	}
	
	public Menu(String name, int price) {
		this.name = name;
		this.price = price;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public int getKing() {
		return king;			
	}

	public void setKing(int king) {
		this.king = king;
	}

	
	
	
	
}
