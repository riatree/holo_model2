package org.yolo.holo.service;

import org.yolo.holo.dao.TourGradesDAO;

public class TourGradesServiceImpl implements TourGradesService {
	private TourGradesDAO tourGradesDAO;
	public void setTourGradesDAO(TourGradesDAO tourGradesDAO) {
		this.tourGradesDAO = tourGradesDAO;
	}//setTourGradesDAO() end
	
}//TourGradesServiceImpl end
