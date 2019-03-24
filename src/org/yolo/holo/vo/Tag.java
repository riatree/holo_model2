package org.yolo.holo.vo;

import java.sql.Timestamp;
import java.util.List;

public class Tag {
	private int no,tagNo ,noTag, spotNo;
	private String name,type, contentsNO, contentsType, spotName;
	private Timestamp regdate;
	
	private List<Tag> tags;
	
	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	int getNoTag() {
		return noTag;
	}

	void setNoTag(int noTag) {
		this.noTag = noTag;
	}

	int getSpotNo() {
		return spotNo;
	}

	void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}

	String getContentsNO() {
		return contentsNO;
	}

	void setContentsNO(String contentsNO) {
		this.contentsNO = contentsNO;
	}

	String getContentsType() {
		return contentsType;
	}

	void setContentsType(String contentsType) {
		this.contentsType = contentsType;
	}

	String getSpotName() {
		return spotName;
	}

	void setSpotName(String spotName) {
		this.spotName = spotName;
	}

	public Tag() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
