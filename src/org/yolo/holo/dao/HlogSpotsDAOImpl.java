package org.yolo.holo.dao;

import org.apache.ibatis.session.SqlSession;

public class HlogSpotsDAOImpl implements HlogSpotsDAO {
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}//setSession() end
}//HLogSpotsDAOImpl end
