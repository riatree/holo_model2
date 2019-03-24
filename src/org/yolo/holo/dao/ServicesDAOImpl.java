package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Service;

public class ServicesDAOImpl implements ServicesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	public int insert(Service service) {

		return session.insert("service.insert", service);
	} // service() end

	@Override
	public List<Service> selectSpotService(int noSpot) {
		// TODO Auto-generated method stub
		return session.selectList("service.selectSpotService", noSpot);
	}

}// ServicesDAOImpl end
