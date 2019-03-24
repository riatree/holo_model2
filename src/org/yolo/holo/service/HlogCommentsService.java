package org.yolo.holo.service;

import java.util.Map;

import org.yolo.holo.vo.HlogComment;

public interface HlogCommentsService {
	public Map<String, Object> getList(int no, int pageNo);

	public boolean registerComment(HlogComment hlogComment);

	public boolean removeComment(int no);
}// HLogCommentsService end