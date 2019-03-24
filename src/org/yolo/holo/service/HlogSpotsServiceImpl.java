package org.yolo.holo.service;

import org.yolo.holo.dao.HlogSpotsDAO;

public class HlogSpotsServiceImpl implements HlogSpotsService{
	private HlogSpotsDAO hlogSpotsDAO;
	public void setHlogSpotsDAO(HlogSpotsDAO hlogSpotsDAO) {
		this.hlogSpotsDAO = hlogSpotsDAO;
	}
}//HLogSpotsServiceImpl end
