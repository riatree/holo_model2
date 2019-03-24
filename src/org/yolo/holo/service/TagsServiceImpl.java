package org.yolo.holo.service;

import java.util.List;

import org.yolo.holo.dao.TagsDAO;
import org.yolo.holo.vo.Tag;

public class TagsServiceImpl implements TagsService{
	private TagsDAO tagsDAO;
	public void setTagsDAO(TagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}//setTagsDAO() end
	
	
	
}//TagsServiceImpl end
