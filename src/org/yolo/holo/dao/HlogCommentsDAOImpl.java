package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.HlogComment;
import org.yolo.holo.vo.PageVO;

public class HlogCommentsDAOImpl implements HlogCommentsDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession() end

	public int selectTotal(int no) {

		return session.selectOne("hlogcomment.selectTotal", no);
	}// selectTotal() end

	public List<HlogComment> selectList(PageVO pageVO) {

		return session.selectList("hlogcomment.selectList", pageVO);
	}// selectList() end

	public int insert(HlogComment hLogComment) {

		return session.insert("hlogcomment.insert", hLogComment);
	}// insert() end

	@Override
	public int delete(int no) {
		return session.delete("hlogcomment.delete", no);
	}// delete() end
}// HLogCommentsDAOImpl end
