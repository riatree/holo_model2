package org.yolo.holo.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Hlog {
	private int no, hice, hit, dounorNo, likeNum, commentNum;
	private String title, open, titlePic, tripStyle, contents, profile, nickname;
	private Date goDate, comeDate;
	private Timestamp regdate;

	public Hlog() {

	}

	public Hlog(String title, Date goDate, Date comeDate, String open, String contents, String titlePic,
			String tripStyle, int hice, int dounorNo, String profile, String nickname) {
		super();
		this.hice = hice;
		this.dounorNo = dounorNo;
		this.title = title;
		this.open = open;
		this.titlePic = titlePic;
		this.tripStyle = tripStyle;
		this.contents = contents;
		this.profile = profile;
		this.nickname = nickname;
		this.goDate = goDate;
		this.comeDate = comeDate;
	}

	public String getPicType() {
		String title = getTitlePic();

		boolean flag = title.contains("#");

		if (flag) {
			title = "background-color : " + title + "";
		} else {
			title = "background-image:url(/img" + title + ")";
		}

		System.out.println("Hlog title : " + title);

		return title;
	}// getPicType() end

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getHice() {
		return hice;
	}

	public void setHice(int hice) {
		this.hice = hice;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getTitlePic() {
		return titlePic;
	}

	public void setTitlePic(String titlePic) {
		this.titlePic = titlePic;
	}

	public String getTripStyle() {
		return tripStyle;
	}

	public void setTripStyle(String tripStyle) {
		this.tripStyle = tripStyle;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getGoDate() {
		return goDate;
	}

	public void setGoDate(Date goDate) {
		this.goDate = goDate;
	}

	public Date getComeDate() {
		return comeDate;
	}

	public void setComeDate(Date comeDate) {
		this.comeDate = comeDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getDounorNo() {
		return dounorNo;
	}

	public void setDounorNo(int dounorNo) {
		this.dounorNo = dounorNo;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
