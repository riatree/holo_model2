package org.yolo.holo.service;

import java.util.Map;

import org.yolo.holo.vo.Hlog;

public interface HlogsService {

	public Map<String, Object> getProHlogList(int pageNo, int no, boolean flag);

	public Map<String, Object> getList(int pageNo);

	public Hlog getHlog(int no, boolean isHit);

	public boolean register(Hlog hlog, String colorCode);
}// HLogsService end
