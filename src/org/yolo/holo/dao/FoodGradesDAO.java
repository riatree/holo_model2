package org.yolo.holo.dao;

import org.yolo.holo.vo.FoodGrade;

public interface FoodGradesDAO {
	
	public double selectFoodHice(int no);

	public FoodGrade selectFoodReview(int no);

	public int insert(FoodGrade foodgrade);

}//FoodGradesDAO end
