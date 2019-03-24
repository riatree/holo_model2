package org.yolo.holo.service;

import java.util.Map;

import org.yolo.holo.vo.Personnel;
import org.yolo.holo.vo.Together;

public interface TogethersService {
	
	public Map<String, Object> together(int pageNo);
	
	// 은서 : together insert
	public boolean togetherRegister(int noDounor, Together together, Personnel personnel); 

}//TogethersService end
