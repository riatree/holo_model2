package org.yolo.holo.vo;

import java.sql.Timestamp;

public class HlogSpot {

	private int no,noDounor,noHLog;
	private String contents;
	private Timestamp regdate;
	
	public HlogSpot() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getNoDounor() {
		return noDounor;
	}

	public void setNoDounor(int noDounor) {
		this.noDounor = noDounor;
	}

	public int getNoHLog() {
		return noHLog;
	}

	public void setNoHLog(int noHLog) {
		this.noHLog = noHLog;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
