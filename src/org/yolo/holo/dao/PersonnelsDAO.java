package org.yolo.holo.dao;

import org.yolo.holo.vo.Personnel;

public interface PersonnelsDAO {

	public int insert(Personnel personnel);
	
	public int selectDounorPersonnelCount(int no);
	
}//PersonnelsDAO end
