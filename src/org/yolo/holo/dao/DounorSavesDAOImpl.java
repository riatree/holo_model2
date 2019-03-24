package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.DounorSave;

public class DounorSavesDAOImpl implements DounorSavesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	public int selectSpotLike(int no) {

		return session.selectOne("dounorsave.selectSpotLike", no);

	}// selectSpotLike end

	public int selectSpotScrap(int no) {

		return session.selectOne("dounorsave.selectSpotScrap", no);

	}// selectSpotScrap end

	public List<DounorSave> selectProfileScrapTour(int no) {

		return session.selectList("dounorsave.selectProfileScrapTour", no);

	}// selectProfileScrapTour end

	public List<DounorSave> selectProScrapTourList(int no) {

		return session.selectList("dounorsave.selectProScrapTourList", no);

	}// selelctProScrapTourList end

	public List<DounorSave> selectProScrapFoodList(int no) {

		return session.selectList("dounorsave.selectProScrapFoodList", no);

	}// selelctProScrapFoodList end

	// 프로필 스크랩 관광명소 카운트
	public int selectProScrapTourCount(int no) {

		return session.selectOne("dounorsave.selectProScrapTourCount", no);

	}// selelctProScrapTourCount end

	// 프로필 스크랩 음식점 카운트
	public int selectProScrapFoodCount(int no) {

		return session.selectOne("dounorsave.selectProScrapFoodCount", no);

	}// selelctProScrapFoodCount end

	// 프로필 라이크 카운트
	public int selectLikeCount(int no) {

		return session.selectOne("dounorsave.selectLikeCount", no);

	}// selectLikeCount end

}// DounorSavesDAOImpl end
