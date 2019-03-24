package org.yolo.holo.service;

import org.yolo.holo.dao.SpotPicsDAO;

public class SpotPicsServiceImpl implements SpotPicsService{
	private SpotPicsDAO spotPicsDAO;
	public void setSpotPicsDAO(SpotPicsDAO spotPicsDAO) {
		this.spotPicsDAO = spotPicsDAO;
	}//setSpotPicsDAO() end
	
}//SpotPicsServiceImpl end
