package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.Location;

public interface LocationsDAO {
	
	public Location selectOne(int no);

	public List<Location> selectRegion1();

	public List<Location> selectRegion2();

	public List<Location> selectRegion3();

	public List<Location> selectRegion4();

	public List<Location> selectRegion5();

	// 2018-11-30 SPOT 등록 키워드 검색
	public List<Location> selectKeyword(String name);

}//LocationsDAO end
