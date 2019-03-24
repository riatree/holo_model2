package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Hlog;
import org.yolo.holo.vo.PageVO;

public class HlogsDAOImpl implements HlogsDAO {
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession() end

	public int insert(Hlog hLog) {

		return session.insert("hlog.insert", hLog);
	}// insert() end

	public Hlog selectOne(int no) {

		return session.selectOne("hlog.selectOne", no);
	}// selectOne() end

	public List<Hlog> selectList(PageVO pageVO) {

		return session.selectList("hlog.selectList", pageVO);
	} // selectList() end

	public int selectTotal() {

		return session.selectOne("hlog.selectTotal");
	}// selectTotal() end

	public int updateHit(int no) {

		return session.insert("hlog.updateHit", no);
	}// updateHit() end

	public List<Hlog> selectProList(PageVO pageVO) {

		return session.selectList("hlog.selectProList", pageVO);
	} // selectProList() end

	public int selectMyProHlogCount(int no) {

		return session.selectOne("hlog.selectMyProHlogCount", no);
	} // selectMyProHlogCount() end

	public List<Hlog> selectMyProList(int no) {

		return session.selectList("hlog.selectMyProList", no);
	} // selectMyProList() end

	public List<Hlog> selectLocationList() {

		return session.selectList("hlog.selectLocationList");
	} // selectList() end

	@Override
	public int selectProTotal(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectOne("hlog.selectProTotal", pageVO);
	}

}// HLogsDAOImpl end
