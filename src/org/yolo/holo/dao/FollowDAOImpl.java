package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Follow;

public class FollowDAOImpl implements FollowDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	public int selectFollowingNum(int no) {

		return session.selectOne("follow.selectFollowingNum", no);

	}// selectFollowingNum end

	public List<Follow> selectFollowingList(int no) {

		return session.selectList("follow.selectFollowingList", no);

	}// selectFollowingList end

	public int selectFollowerNum(int no) {

		return session.selectOne("follow.selectFollowerNum", no);

	}// selectFollowerNum end

	public List<Follow> selectFollowerList(int no) {

		return session.selectList("follow.selectFollowerList", no);

	}// selectFollowerList end

	public int selectFollowingNow(Follow follow) {

		return session.selectOne("follow.selectFollowingNow", follow);

	}// selelctFollowingNow end

	public int selectFollowerNow(Follow follow) {

		return session.selectOne("follow.selectFollowerNow", follow);

	}// selelctFollowerNow end

	public int insert(Follow follow) {

		return session.insert("follow.insert", follow);

	}// selelctFollowerNow end

	public int delete(Follow follow) {

		return session.delete("follow.delete", follow);

	}// selelctFollowerNow end

}// FollowDAOImpl end
