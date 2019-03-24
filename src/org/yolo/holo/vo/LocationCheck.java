package org.yolo.holo.vo;

import java.sql.Timestamp;

public class LocationCheck {

	private int noLocation,locationCheckNo,noChck;
	private Timestamp regdate;
	
	public LocationCheck() {
		
	}

	public int getNoLocation() {
		return noLocation;
	}

	public void setNoLocation(int noLocation) {
		this.noLocation = noLocation;
	}

	public int getLocationCheckNo() {
		return locationCheckNo;
	}

	public void setLocationCheckNo(int locationCheckNo) {
		this.locationCheckNo = locationCheckNo;
	}

	public int getNoChck() {
		return noChck;
	}

	public void setNoChck(int noChck) {
		this.noChck = noChck;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
