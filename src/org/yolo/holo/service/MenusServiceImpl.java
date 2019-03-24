package org.yolo.holo.service;

import org.yolo.holo.dao.MenusDAO;

public class MenusServiceImpl implements MenusService {
	private MenusDAO menusDAO;
	public void setMenusDAO(MenusDAO menusDAO) {
		this.menusDAO = menusDAO;
	}//setMenusDAO() end
}//MenusServiceImpl end
