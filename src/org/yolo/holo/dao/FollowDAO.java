package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.Follow;

public interface FollowDAO {
	
	public int selectFollowingNum(int no);
	public List<Follow> selectFollowingList(int no);
	public int selectFollowerNum(int no);
	public List<Follow> selectFollowerList(int no);
	public int selectFollowingNow(Follow follow);
	public int selectFollowerNow(Follow follow);
	public int insert(Follow follow);
	public int delete(Follow follow);

}//FollowDAO end
