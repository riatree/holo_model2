package org.yolo.holo.service;

import org.yolo.holo.dao.ServicesDAO;

public class ServicesServiceImpl implements ServicesService{
	private ServicesDAO servicesDAO;
	public void setServicesDAO(ServicesDAO servicesDAO) {
		this.servicesDAO = servicesDAO;
	}//setServicesDAO() end
	
}//ServicesServiceImpl end
