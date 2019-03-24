package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.PageVO;
import org.yolo.holo.vo.Spot;

public class SpotsDAOImpl implements SpotsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	public List<Spot> selectFoodList(PageVO pagevo) {

		return session.selectList("spot.selectFoodList", pagevo);

	}// selectFoodList end

	public int selectFoodTotal() {

		return session.selectOne("spot.selectFoodTotal");

	}// selectFoodTotal end

	public List<Spot> selectTourList(PageVO pagevo) {

		return session.selectList("spot.selectTourList", pagevo);

	}// selectTourList end

	public int selectTourTotal() {

		return session.selectOne("spot.selectTourTotal");

	}// selectTourTotal end

	public List<Spot> selectMainTourList() {

		return session.selectList("spot.selectMainTourList");

	}// selectMainTourList end

	public List<Spot> selectMainFoodList() {

		return session.selectList("spot.selectMainFoodList");

	}// selectMainFoodList end

	public Spot selectSpotOne(int no) {

		return session.selectOne("spot.selectSpotOne", no);
	}

	public List<Spot> selectLocationTourList(int no) {

		return session.selectList("spot.selectLocationTourList", no);

	} // selectLocationTourList() end

	public List<Spot> selectLocationFoodList(int no) {

		return session.selectList("spot.selectLocationFoodList", no);

	} // selectLocationTourList() end

	public List<Spot> selectSpotList() {

		return session.selectList("spot.selectSpotList");

	} // selectLocationTourList() end

	
	// 관광명소 insert
	public int insert(Spot spot) {

		return session.insert("spot.insertTour", spot);

	} // insert() end

	// 음식점 insert
	public int insertFood(Spot spot) {

		return session.insert("spot.insertFood", spot);

	} // insert() end

	public List<Spot> selectProTourFounder(int no) {

		return session.selectList("spot.selectProTourFounder", no);

	} // selectProTourFounder() end

	public List<Spot> selectProFoodFounder(int no) {

		return session.selectList("spot.selectProFoodFounder", no);

	} // selectProFoodFounder() end

	public int selectProTourFounderCount(int no) {

		return session.selectOne("spot.selectProTourFounderCount", no);

	} // selectProTourFounderCount() end

	public int selectProFoodFounderCount(int no) {

		return session.selectOne("spot.selectProFoodFounderCount", no);

	} // selectProFoodFounderCount() end

	// 은서 : together에서 spot 목록
	@Override
	public List<Spot> selectSearchSpot(String name) {

		return session.selectList("spot.selectSearchSpotInTogether", name);
	}

}// SpotsDAOImpl end
