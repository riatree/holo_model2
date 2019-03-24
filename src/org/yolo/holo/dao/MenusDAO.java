package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.Menu;

public interface MenusDAO {

	public int insert(Menu menu);

	public int menuInsert(Menu menu);

	public List<Menu> selectMenu(int no);

}// MenusDAO end
