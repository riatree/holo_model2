package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.HlogComment;
import org.yolo.holo.vo.PageVO;

public interface HlogCommentsDAO {

	public int selectTotal(int no);

	public List<HlogComment> selectList(PageVO pageVO);

	public int insert(HlogComment hLogComment);
	
	public int delete(int no);

}// HLogCommentsDAO end
