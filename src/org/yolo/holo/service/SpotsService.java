package org.yolo.holo.service;

import java.util.List;
import java.util.Map;

import org.yolo.holo.vo.Menu;
import org.yolo.holo.vo.Spot;
import org.yolo.holo.vo.SpotPic;

public interface SpotsService {

	// 은서 : /food 에서 list 뽑기
	public Map<String, Object> getFoodList(int pageNo);

	// 은서 : /tour 에서 list 뽑기
	public Map<String, Object> getTourList(int pageNo);

	// 은서 : food insert
	public boolean insertFood(int dounorNo, Spot spot, String picName, String[] menuName, int[] menuPrice, int king,
			int hice, String[] good, String[] service, String[] theme);

	// 은서 : tour insert
	public boolean insertTour(int dounorNo, Spot spot, String picName, int hice, String[] good, String[] serivce,
			String[] theme);

	// 은서 : together에서 spot search
	public List<Spot> selectSearchSpot(String name);

	public Map<String, Object> getSpotOne(int no);

	public boolean insertMenu(Menu menu, String[] menuName, String[] menuPrice);

	public int FounderTourNum(int no);

	public int FounderFoodNum(int no);

	public Map<String, Object> ProFounder(int no);

}// SpotsService end
