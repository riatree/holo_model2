package org.yolo.holo.dao;

import org.yolo.holo.vo.Dounor;

public interface DounorsDAO {
	
	public Dounor selectDounorProfile(int no);
	public Dounor selectLogin(Dounor dounor);
	public int selectCheckId(String id);
	public int selectCheckNickname(String nickname);
	public int insert(Dounor dounor);
	public int updatePink(int no);
	public int updateGreen(int no);
	public int updateRed(int no);
	public int updateChco(int no);
	public int updateOrange(int no);
	public int updateBlue(int no);
	public int updateWhite(int no);
	public int updateYellow(int no);
	
}//DounorsDAO end
