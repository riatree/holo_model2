package org.yolo.holo.vo;

import java.sql.Date;

import java.sql.Timestamp;
import java.util.List;

public class Together {

	private int no, personnel, noSpot, count, spotNo, spotPicNo, noDounor;
	private String meetTime, contents, gender, kakao, picName, spotName, picType, spotType;
	private Timestamp regdate;
	private Date meetDate;

	// 수진
	private List<Tag> tags;
	private List<Review> reviews;
	// 사람수
	private int personnelResult, tagNo;

	public Together() {

	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public int getPersonnelResult() {
		return personnelResult;
	}

	public void setPersonnelResult(int personnelResult) {
		this.personnelResult = personnelResult;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public int getNoSpot() {
		return noSpot;
	}

	public void setNoSpot(int noSpot) {
		this.noSpot = noSpot;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getSpotNo() {
		return spotNo;
	}

	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}

	public int getSpotPicNo() {
		return spotPicNo;
	}

	public void setSpotPicNo(int spotPicNo) {
		this.spotPicNo = spotPicNo;
	}

	public int getNoDounor() {
		return noDounor;
	}

	public void setNoDounor(int noDounor) {
		this.noDounor = noDounor;
	}

	public String getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}

	public String getSpotName() {
		return spotName;
	}

	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}

	public String getPicType() {
		return picType;
	}

	public void setPicType(String picType) {
		this.picType = picType;
	}

	public String getSpotType() {
		return spotType;
	}

	public void setSpotType(String spotType) {
		this.spotType = spotType;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Date getMeetDate() {
		return meetDate;
	}

	public void setMeetDate(Date meetDate) {
		this.meetDate = meetDate;
	}

}
