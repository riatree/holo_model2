package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Menu;

public class MenusDAOImpl implements MenusDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	public int insert(Menu menu) {

		return session.insert("menu.insert", menu);
	}

	@Override
	public int menuInsert(Menu menu) {
		// TODO Auto-generated method stub
		return session.insert("menu.menuInsert", menu);
	}

	@Override
	public List<Menu> selectMenu(int no) {
		// TODO Auto-generated method stub
		return session.selectList("menu.selectMenu", no);
	}

}// MenusDAOImpl end
