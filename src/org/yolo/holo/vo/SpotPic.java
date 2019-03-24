package org.yolo.holo.vo;

import java.sql.Timestamp;

public class SpotPic {
	private int no,noSpot,noDounor,dounorNo;
	private String picName,type,profile;
	private Timestamp regdate;

	public SpotPic() {
		// TODO Auto-generated constructor stub
	}
	
	public int getDounorNo() {
		return dounorNo;
	}

	public void setDounorNo(int dounorNo) {
		this.dounorNo = dounorNo;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
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

	public int getNoDounor() {
		return noDounor;
	}

	public void setNoDounor(int noDounor) {
		this.noDounor = noDounor;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
