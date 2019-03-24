package org.yolo.holo.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.yolo.holo.dao.LocationsDAO;
import org.yolo.holo.dao.SpotsDAO;
import org.yolo.holo.vo.Location;
import org.yolo.holo.vo.Spot;

public class LocationsServiceImpl implements LocationsService {
	private LocationsDAO locationsDAO;
	private SpotsDAO spotsDAO;

	public void setLocationsDAO(LocationsDAO locationsDAO) {
		this.locationsDAO = locationsDAO;
	}// setLocationsDAO() end

	public void setSpotsDAO(SpotsDAO spotsDAO) {
		this.spotsDAO = spotsDAO;
	}// setSpotsDAO() end

	@Override
	public List<Location> getList1() {
		// TODO Auto-generated method stub
		return locationsDAO.selectRegion1();
	}

	@Override
	public List<Location> getList2() {
		// TODO Auto-generated method stub
		return locationsDAO.selectRegion2();
	}

	@Override
	public List<Location> getList3() {
		// TODO Auto-generated method stub
		return locationsDAO.selectRegion3();
	}

	@Override
	public List<Location> getList4() {
		// TODO Auto-generated method stub
		return locationsDAO.selectRegion4();
	}

	@Override
	public List<Location> getList5() {
		// TODO Auto-generated method stub
		return locationsDAO.selectRegion5();
	}

	// 은서 : foot, tour 등록 시 location search
	@Override
	public List<Location> getKeyword(String name) {
		return locationsDAO.selectKeyword("%" + name + "%");
	}

	@Override
	public Map<String, Object> getLocation(int no) {
		Map<String, Object> map = new ConcurrentHashMap<>();
		Location location = locationsDAO.selectOne(no);
		List<Spot> tourList = spotsDAO.selectLocationTourList(no);
		List<Spot> foodList = spotsDAO.selectLocationFoodList(no);

		map.put("location", location);
		map.put("tourList", tourList);
		map.put("foodList", foodList);
		return map;
	}// getLocation() end

}// LocationsServiceImpl end
