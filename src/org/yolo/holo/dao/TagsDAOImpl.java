package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Tag;

public class TagsDAOImpl implements TagsDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	@Override
	public List<Tag> selectTag(int no) {
		return session.selectList("tag.selectTag",no);
	}//selectTag() end


	@Override
	public List<Tag> selectKeyword(String name) {
		return session.selectList("tag.selectKeyword", name);
	}//selectKeyword() end
	
}//TagsDAOImpl end
