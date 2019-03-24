package org.yolo.holo.vo;

import java.sql.Timestamp;

public class Location {
	private int no,parallax;
	private String name, directTime,goodDate,emergency,voltage,language,money,guidebook,img;
	private Timestamp regdate;
	
	
	public Location() {
		
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getParallax() {
		return parallax;
	}


	public void setParallax(int parallax) {
		this.parallax = parallax;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDirectTime() {
		return directTime;
	}


	public void setDirectTime(String directTime) {
		this.directTime = directTime;
	}


	public String getGoodDate() {
		return goodDate;
	}


	public void setGoodDate(String goodDate) {
		this.goodDate = goodDate;
	}


	public String getEmergency() {
		return emergency;
	}


	public void setEmergency(String emergency) {
		this.emergency = emergency;
	}


	public String getVoltage() {
		return voltage;
	}


	public void setVoltage(String voltage) {
		this.voltage = voltage;
	}


	public String getLanguage() {
		return language;
	}


	public void setLanguage(String language) {
		this.language = language;
	}


	public String getMoney() {
		return money;
	}


	public void setMoney(String money) {
		this.money = money;
	}


	public String getGuidebook() {
		return guidebook;
	}


	public void setGuidebook(String guidebook) {
		this.guidebook = guidebook;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
