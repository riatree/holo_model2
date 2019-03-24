package org.yolo.holo.service;

import org.yolo.holo.dao.CheckListDAO;

public class CheckListServiceImpl implements CheckListService{
	
	private CheckListDAO checkListDAO;
	
	public void setCheckListDAO(CheckListDAO checkListDAO) {
		this.checkListDAO = checkListDAO;
	}//setCheckListDAO() end
	
}//CheckListServiceImpl end
