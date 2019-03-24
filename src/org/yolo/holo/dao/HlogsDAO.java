package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.Hlog;
import org.yolo.holo.vo.PageVO;

public interface HlogsDAO {

	public int insert(Hlog hLog);

	public Hlog selectOne(int no);

	public List<Hlog> selectList(PageVO pageVO);

	public int selectTotal();

	public int updateHit(int no);

	public List<Hlog> selectProList(PageVO pageVO);

	public int selectMyProHlogCount(int no);

	public List<Hlog> selectMyProList(int no);

	public List<Hlog> selectLocationList();
	
	public int selectProTotal(PageVO pageVO);

}// HLogsDAO end
