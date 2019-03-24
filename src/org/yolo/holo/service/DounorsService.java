package org.yolo.holo.service;

import java.util.Map;

import org.yolo.holo.vo.Dounor;
import org.yolo.holo.vo.Follow;
import org.yolo.holo.vo.PageVO;

public interface DounorsService {

	public Dounor login(Dounor dounor);

	public Map<String, Object> getProfile(int no, PageVO pageVO, int loginNo);

	public Map<String, Object> followList(Follow follow);

	public Map<String, Object> followingFlag(Follow follow);

	public int checkId(String id);

	public int checkNickname(String nickname);

}// DounorsService end
