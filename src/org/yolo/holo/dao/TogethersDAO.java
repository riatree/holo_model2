package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.PageVO;
import org.yolo.holo.vo.Together;

public interface TogethersDAO {
	
	public List<Together> selectTogetherListPage(PageVO pageVO);
	public int selectTogetherTotal();
	public List<Together> selectTogetherListNo(int no);
	public int selectPersonnelTotal(int no);
	public List<Together> selectSpotTogetherList(int no);
	public List<Together> selectProTogetherList(int no);
	public int selectProTogetherCount(int no);
	
	// 은서
	public int insert(Together together);
	
}//TogethersDAO end
