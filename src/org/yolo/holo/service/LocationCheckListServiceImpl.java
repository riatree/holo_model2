package org.yolo.holo.service;

import org.yolo.holo.dao.LocationCheckListDAO;

public class LocationCheckListServiceImpl implements LocationCheckListService {
	private LocationCheckListDAO locationCheckListDAO;
	
	public void setLocationCheckListDAO(LocationCheckListDAO locationCheckListDAO) {
		this.locationCheckListDAO = locationCheckListDAO;
	}//setLocationCheckListDAO() end
	
}//LocationCheckListServiceImpl end
