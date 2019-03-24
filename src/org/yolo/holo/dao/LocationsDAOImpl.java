package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Location;

public class LocationsDAOImpl implements LocationsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	public Location selectOne(int no) {

		return session.selectOne("location.selectOne", no);
	}// selectOne() end

	public List<Location> selectRegion1() {

		return session.selectList("location.selectRegion1");
	}

	public List<Location> selectRegion2() {

		return session.selectList("location.selectRegion2");
	}

	public List<Location> selectRegion3() {

		return session.selectList("location.selectRegion3");
	}

	public List<Location> selectRegion4() {

		return session.selectList("location.selectRegion4");
	}

	public List<Location> selectRegion5() {

		return session.selectList("location.selectRegion5");
	}

	// 2018-11-30 SPOT 등록 키워드 검색
	public List<Location> selectKeyword(String name) {

		return session.selectList("location.selectKeyword", name);
	}

}// LocationsDAOImpl end