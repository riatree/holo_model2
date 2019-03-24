package org.yolo.holo.service;

import org.yolo.holo.dao.FollowDAO;

public class FollowServieImpl implements FollowService{
	private FollowDAO followDAO;
	public void setFollowDAO(FollowDAO followDAO) {
		this.followDAO = followDAO;
	}//setFollowDAO() end
	
}//FollowServieImpl end
