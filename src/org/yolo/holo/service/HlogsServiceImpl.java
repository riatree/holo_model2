package org.yolo.holo.service;

import java.util.List;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.bind.annotation.PathVariable;
import org.yolo.holo.dao.HlogsDAO;
import org.yolo.holo.util.PaginateUtil;
import org.yolo.holo.vo.Hlog;
import org.yolo.holo.vo.PageVO;

public class HlogsServiceImpl implements HlogsService {

	private HlogsDAO hlogsDAO;
	private PaginateUtil paginateUtil;
	private DounorsService dounorsService;

	public void setHlogsDAO(HlogsDAO hlogsDAO) {
		this.hlogsDAO = hlogsDAO;
	}

	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	public void setDounorsService(DounorsService dounorsService) {
		this.dounorsService = dounorsService;
	}

	@Override
	public Map<String, Object> getProHlogList(int pageNo, int no, boolean flag) {

		Map<String, Object> map = new ConcurrentHashMap<>();

		// 한페이지 당 보여지는 게시물 수
		int numPage = 3;

		// 한페이지에 보여질 페이지 블룩 수
		int numBlock = 3;

		// 페이지 처리용
		PageVO pageVO = new PageVO(pageNo, numPage, flag, no);

		System.out.println("시작 : " + pageVO.getStart() + " 끝 : " + pageVO.getEnd() + " flag : " + pageVO.isFlag());

		// 전체 페이지수
		int total = hlogsDAO.selectProTotal(pageVO);

		List<Hlog> list = hlogsDAO.selectProList(pageVO);

		String url = "/user/" + no + "/hlog/page/";

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		System.out.println("hlogList" + list);
		System.out.println("hlogTotal : " + total);

		map.put("hlogList", list);
		map.put("hlogTotal", total);
		map.put("paginate", paginate);

		return map;
	}

	@Override
	public Map<String, Object> getList(int pageNo) {
		Map<String, Object> map = new ConcurrentHashMap<>();

		int numPage = 9;
		int numBlock = 5;
		PageVO pageVO = new PageVO(pageNo, numPage);
		List<Hlog> list = hlogsDAO.selectList(pageVO);
		int total = hlogsDAO.selectTotal();
		String url = "/hlog/page/";
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		map.put("list", list);
		map.put("paginate", paginate);

		return map;
	}// getList() end

	@Override
	public Hlog getHlog(int no, boolean isHit) {
		if (!isHit) {
			hlogsDAO.updateHit(no);
		} // if end
		return hlogsDAO.selectOne(no);
	}// getHlog() end

	@Override

	public boolean register(Hlog hlog, String colorCode) {
		if (colorCode.length() > 0) {
			hlog.setTitlePic(colorCode);
		}

		return 1 == hlogsDAO.insert(hlog);
	}

}// HLogsServiceImpl end