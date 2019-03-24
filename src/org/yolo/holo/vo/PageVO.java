package org.yolo.holo.vo;

public class PageVO {

	private int start, end, noHLog;

	private int no;
	private boolean flag;

	public PageVO() {

	}

	public PageVO(int pageNo, int numPage) {
		end = pageNo * numPage;
		start = end - (numPage - 1);
	}

	public PageVO(int pageNo, int numPage, int no) {

		end = pageNo * numPage;
		start = end - (numPage - 1);
		noHLog = no;
	}

	public PageVO(int pageNo, int numPage, boolean flag, int no) {

		end = pageNo * numPage;
		start = end - (numPage - 1);
		this.flag = flag;
		this.no = no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getNoHLog() {
		return noHLog;
	}

	public void setNoHLog(int noHLog) {
		this.noHLog = noHLog;
	}

} // PageVO end
