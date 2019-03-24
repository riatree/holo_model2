package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.Tag;

public interface TagsDAO {
	public List<Tag> selectTag(int no);
	public List<Tag> selectKeyword(String name);
}//TagsDAO end
