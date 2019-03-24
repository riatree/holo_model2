package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.Service;

public interface ServicesDAO {

	public int insert(Service service);

	public List<Service> selectSpotService(int noSpot);

}// ServicesDAO end
