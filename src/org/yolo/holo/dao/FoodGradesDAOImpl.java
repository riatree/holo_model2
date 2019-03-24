package org.yolo.holo.dao;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.FoodGrade;

public class FoodGradesDAOImpl implements FoodGradesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end
	

	public double selectFoodHice(int no) {

		return session.selectOne("foodgrade.selectFoodHice", no);
	}// selectFoodList end

	public FoodGrade selectFoodReview(int no) {

		return session.selectOne("foodgrade.selectFoodReview", no);
	}// selectFoodList end

	public int insert(FoodGrade foodgrade) {
		
		return session.insert("foodgrade.insert", foodgrade);
	} // insert() end

}// FoodGradesDAOImpl end
