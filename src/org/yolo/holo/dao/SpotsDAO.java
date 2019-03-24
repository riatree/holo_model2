package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.Location;
import org.yolo.holo.vo.PageVO;
import org.yolo.holo.vo.Spot;

public interface SpotsDAO {

	public List<Spot> selectFoodList(PageVO pagevo);
	public int selectFoodTotal();
	public List<Spot> selectTourList(PageVO pagevo);
	public int selectTourTotal();
	public List<Spot> selectMainTourList();
	public List<Spot> selectMainFoodList();
	public Spot selectSpotOne(int no);
	public List<Spot> selectLocationTourList(int no);
	public List<Spot> selectLocationFoodList(int no);
	public List<Spot> selectSpotList();
	public int insert(Spot spot);
	public int insertFood(Spot spot);
	public List<Spot> selectProTourFounder(int no);
	public List<Spot> selectProFoodFounder(int no);
	public int selectProTourFounderCount(int no);
	public int selectProFoodFounderCount(int no);
	
	// 은서 : together에서 spot 검색
	public List<Spot> selectSearchSpot(String name);
	
}//SpotsDAO end
