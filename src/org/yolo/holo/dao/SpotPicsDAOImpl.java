package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.SpotPic;

public class SpotPicsDAOImpl implements SpotPicsDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end
	
	
	public List<SpotPic> selectSpotPicList(int no) {

		return session.selectList("spotpic.selectSpotPicList",no);
	}//selectFoodList end
	
	
	
	public int selectPicNum(int no) {
		
		return session.selectOne("spotpic.selectPicNum",no);
	}//selectFoodList end
	
	public int insert(SpotPic spotpic) {
		
		return session.insert("spotpic.insert", spotpic);
	}
}//SpotPicsDAOImpl end
