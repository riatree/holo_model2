package org.yolo.holo.service;

import org.yolo.holo.dao.FoodGradesDAO;

public class FoodGradesServiceImpl implements FoodGradesService{
	private FoodGradesDAO foodGradesDAO;
	public void setFoodGradesDAO(FoodGradesDAO foodGradesDAO) {
		this.foodGradesDAO = foodGradesDAO;
	}//setFoodGradesDAO() end
	
	
}//FoodGradesServiceImpl end
