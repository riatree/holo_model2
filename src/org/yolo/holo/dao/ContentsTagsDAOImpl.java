package org.yolo.holo.dao;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.ContentsTag;

public class ContentsTagsDAOImpl implements ContentsTagsDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end
	
	
	public int insert(ContentsTag contentsTag) {
		return session.insert("contentstag.insert", contentsTag);

	}
	
	
	
}// ContentsTagsDAOImpl end
