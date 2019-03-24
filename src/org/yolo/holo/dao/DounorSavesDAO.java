package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.DounorSave;

public interface DounorSavesDAO {
	
	public int selectSpotLike(int no);
	public int selectSpotScrap(int no);
	public List<DounorSave> selectProfileScrapTour(int no);
	public List<DounorSave> selectProScrapTourList(int no);
	public List<DounorSave> selectProScrapFoodList(int no);
	public int selectProScrapTourCount(int no);
	public int selectProScrapFoodCount(int no);
	public int selectLikeCount(int no);

}//DounorSavesDAO end
