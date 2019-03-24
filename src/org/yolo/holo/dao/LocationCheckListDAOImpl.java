package org.yolo.holo.dao;

import org.apache.ibatis.session.SqlSession;

public class LocationCheckListDAOImpl implements LocationCheckListDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end
	
}//LocationCheckListDAOImpl end
