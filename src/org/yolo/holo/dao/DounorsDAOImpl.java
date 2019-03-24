package org.yolo.holo.dao;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Dounor;

public class DounorsDAOImpl implements DounorsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	public Dounor selectDounorProfile(int no) {

		return session.selectOne("dounor.selectDounorProfile", no);

	}// selectDounorProfile end

	public Dounor selectLogin(Dounor dounor) {

		return session.selectOne("dounor.selectLogin", dounor);
	}

	public int selectCheckId(String id) {

		return session.selectOne("dounor.selectCheckId", id);

	}// selectCheckId() end

	public int selectCheckNickname(String nickname) {

		return session.selectOne("dounor.selectCheckNickname", nickname);

	}// selectNickname() end

	public int insert(Dounor dounor) {

		return session.insert("dounor.insert", dounor);

	}// insert() end

	// 프로필 도넛 update Pink
	public int updatePink(int no) {

		return session.update("dounor.updatePink", no);

	}// updatePink() end

	// 프로필 도넛 update Green
	public int updateGreen(int no) {

		return session.update("dounor.updateGreen", no);

	}// updateGreen() end

	// 프로필 도넛 update Red
	public int updateRed(int no) {

		return session.update("dounor.updateRed", no);

	}// updateRed() end

	// 프로필 도넛 update Chco
	public int updateChco(int no) {

		return session.update("dounor.updateChco", no);

	}// updateChco() end

	// 프로필 도넛 update Orange
	public int updateOrange(int no) {

		return session.update("dounor.updateOrange", no);

	}// updateOrange() end

	// 프로필 도넛 update Blue
	public int updateBlue(int no) {

		return session.update("dounor.updateBlue", no);

	}// updateBlue() end

	// 프로필 도넛 update White
	public int updateWhite(int no) {

		return session.update("dounor.updateWhite", no);

	}// updateWhite() end

	// 프로필 도넛 update Yellow
	public int updateYellow(int no) {

		return session.update("dounor.updateYellow", no);

	}// updateYellow() end

}// DounorsDAOImpl end
