package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.SpotPic;

public interface SpotPicsDAO {
	
	public List<SpotPic> selectSpotPicList(int no);	
	
	public int selectPicNum(int no);
	
	public int insert(SpotPic spotpic);

}//SpotPicsDAO end
