package org.yolo.holo.service;

import org.yolo.holo.dao.ContentsTagsDAO;

public class ContentsTagsServiceImpl implements ContentsTagsService{
	private ContentsTagsDAO contentsTagsDAO;
	
	public void setContentsTagsDAO(ContentsTagsDAO contentsTagsDAO) {
		this.contentsTagsDAO = contentsTagsDAO;
	}//setContentsTagsDAO() end
	
}//ContentsTagsServiceImpl end
