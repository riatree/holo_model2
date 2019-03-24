package org.yolo.holo.vo;

import java.sql.Timestamp;
import java.util.List;

public class Spot {

	private int no, price, noLocation, dounorNo, noSpot;
	private double latitude, longitude, hice;
	private String name, address1, address2, contact, openTime, closeTime, contents, type, categoryType, website,
			nickname, profile, picname;
	private Timestamp regdate;

	// 은서
	// 밑에 setter, getter 추가
	// tagList, scrap, like, hicePoint
	// contact1, contact2, contact3
	// openHour, openMin, closeHour, closeMin
	private List<Tag> tagList;
	private List<Tag> tags;
	private int scrap, like;
	private double hicePoint;
	private String contact1, contact2, contact3, openHour, openMin, closeHour, closeMin;

	/// hice 값 반환
	public int getHiceNum() {

		int num = 0;
		double hice = getHice();

		if (hice >= 0.0 && hice < 1.5) {
			num = 1;
		} else if (hice >= 1.5 && hice < 2.5) {
			num = 2;
		} else if (hice >= 2.5 && hice < 3.5) {
			num = 3;
		} else if (hice >= 3.5 && hice < 4.5) {
			num = 4;
		} else if (hice >= 4.5 && hice <= 5.0) {
			num = 5;
		} // if~else end

		return num;
	}// getHiceNum()

	public Spot() {

	}

	
	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public int getNoSpot() {
		return noSpot;
	}

	public void setNoSpot(int noSpot) {
		this.noSpot = noSpot;
	}

	public double getHice() {
		return hice;
	}

	public void setHice(double hice) {
		this.hice = hice;
	}

	public double getHicePoint() {
		return hicePoint;
	}

	public void setHicePoint(double hicePoint) {
		this.hicePoint = hicePoint;
	}

	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getScrap() {
		return scrap;
	}

	public void setScrap(int scrap) {
		this.scrap = scrap;
	}

	public String getPicname() {
		return picname;
	}

	public void setPicname(String picname) {
		this.picname = picname;
	}

	public int getDounorNo() {
		return dounorNo;
	}

	public void setDounorNo(int dounorNo) {
		this.dounorNo = dounorNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNoLocation() {
		return noLocation;
	}

	public void setNoLocation(int noLocation) {
		this.noLocation = noLocation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public String getContact() {
		return contact1 + "-" + contact2 + "-" + contact3;
	}

	public void setContact(String contact1, String contact2, String contact3) {
		this.contact1 = contact1;
		this.contact2 = contact2;
		this.contact3 = contact3;
	}

	public String getOpenTime() {
		return openHour + "시 " + openMin + "분";
	}

	public void setOpenTime(String openHour, String openMin) {
		this.openHour = openHour;
		this.openMin = openMin;
	}

	public String getCloseTime() {
		return closeHour + "시 " + closeMin + "분";
	}

	public void setCloseTime(String closeHour, String closeMin) {
		this.closeHour = closeHour;
		this.closeMin = closeMin;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
