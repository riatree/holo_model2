package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.PageVO;
import org.yolo.holo.vo.Together;

public class TogethersDAOImpl implements TogethersDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	@Override
	public List<Together> selectTogetherListPage(PageVO pageVO) {
		return session.selectList("together.selectTogetherListPage", pageVO);
	}

	@Override
	public int selectTogetherTotal() {
		return session.selectOne("together.selectTogetherTotal");
	}

	@Override
	public List<Together> selectTogetherListNo(int no) {
		return session.selectList("together.selectTogetherListNo", no);
	}

	@Override
	public int selectPersonnelTotal(int no) {
		return session.selectOne("together.selectPersonnelTotal", no);
	}

	@Override
	public List<Together> selectSpotTogetherList(int no) {
		return session.selectList("together.selectSpotTogetherList", no);
	}

	@Override
	public List<Together> selectProTogetherList(int no) {
		return session.selectList("together.selectProTogetherList", no);
	}

	@Override
	public int selectProTogetherCount(int no) {
		return session.selectOne("together.selectProTogetherCount", no);
	}

	@Override
	public int insert(Together together) {

		return session.insert("together.insert", together);
	}

}// TogethersDAOImpl end
