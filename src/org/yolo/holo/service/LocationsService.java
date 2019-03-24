package org.yolo.holo.service;

import java.util.List;
import java.util.Map;

import org.yolo.holo.vo.Location;

public interface LocationsService {

	public List<Location> getList1();

	public List<Location> getList2();

	public List<Location> getList3();

	public List<Location> getList4();

	public List<Location> getList5();

	public List<Location> getKeyword(String name);
	
	public Map<String, Object> getLocation(int no);

}// LocationsService end
