package org.yolo.holo.service;

import org.yolo.holo.dao.PersonnelsDAO;

public class PersonnelsServiceImpl implements PersonnelsService {
	private PersonnelsDAO personnelsDAO;

	public void setPersonnelsDAO(PersonnelsDAO personnelsDAO) {
		this.personnelsDAO = personnelsDAO;
	}// setPersonnelsDAO() end

	@Override
	public int togetherPersonNum(int no) {
		return personnelsDAO.selectDounorPersonnelCount(no);
	}// togetherPersonNum end

}// PersonnelsServiceImpl end
