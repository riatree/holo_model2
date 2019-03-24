package org.yolo.holo.dao;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Personnel;

public class PersonnelsDAOImpl implements PersonnelsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	@Override
	public int insert(Personnel personnel) {

		return session.insert("personnel.insert", personnel);
	}

	@Override
	public int selectDounorPersonnelCount(int no) {

		return session.selectOne("personnel.selectDounorPersonnelCount", no);
	}// selectDounorPersonnelCount() end

}// PersonnelsDAOImpl end
