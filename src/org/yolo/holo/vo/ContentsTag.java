package org.yolo.holo.vo;

import java.sql.Timestamp;

public class ContentsTag {
	private int no,noTag,contentsNo;
	private String contentsType;
	private Timestamp regdate;
	
	public ContentsTag() {
		
	}
	public ContentsTag(int noTag, int contentsNo, String contentsType) {
		super();
		this.noTag = noTag;
		this.contentsNo = contentsNo;
		this.contentsType = contentsType;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getNoTag() {
		return noTag;
	}

	public void setNoTag(int noTag) {
		this.noTag = noTag;
	}

	public int getContentsNo() {
		return contentsNo;
	}

	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}

	public String getContentsType() {
		return contentsType;
	}

	public void setContentsType(String contentsType) {
		this.contentsType = contentsType;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	
}
