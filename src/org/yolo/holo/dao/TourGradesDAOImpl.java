package org.yolo.holo.dao;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.TourGrade;

public class TourGradesDAOImpl implements TourGradesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	@Override
	public double selectTourHice(int no) {
		return session.selectOne("tourgrade.selectTourHice",no);
	}

	@Override
	public TourGrade selectTourReview(int no) {
		return session.selectOne("tourgrade.selectTourReview",no);
	}

	@Override
	public int insert(TourGrade tourGrade) {
		return session.insert("tourgrade.insert", tourGrade);
	}
	
}//TourGradesDAOImpl end
