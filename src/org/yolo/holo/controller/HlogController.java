package org.yolo.holo.controller;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.yolo.holo.service.DounorsService;
import org.yolo.holo.service.FollowService;
import org.yolo.holo.service.HlogCommentsService;
import org.yolo.holo.service.HlogsService;
import org.yolo.holo.util.FileRenameUtil;
import org.yolo.holo.vo.Dounor;
import org.yolo.holo.vo.Follow;
import org.yolo.holo.vo.Hlog;
import org.yolo.holo.vo.HlogComment;
import org.yolo.holo.vo.PageVO;


@Controller
public class HlogController {

	private HlogsService hlogsService;
	private DounorsService dounorsService;
	private FollowService followService;
	private HlogCommentsService hlogCommentsService;
	private FileRenameUtil fileRenameUtil;

	public void setHlogsService(HlogsService hlogsService) {
		this.hlogsService = hlogsService;
	}

	public void setDounorsService(DounorsService dounorsService) {
		this.dounorsService = dounorsService;
	}

	public void setFollowService(FollowService followService) {
		this.followService = followService;
	}

	public void setHlogCommentsService(HlogCommentsService hlogCommentsService) {
		this.hlogCommentsService = hlogCommentsService;
	}// setHlogCommentsService() end

	public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
		this.fileRenameUtil = fileRenameUtil;
	}// setFileRenameUtil() end

	@RequestMapping(value = "/hlog", method = RequestMethod.GET)
	public String hlog() {
		System.out.println("GET /hlog");
		return "hlog";
	}// hlog() end

	@RequestMapping(value = "/user/{no}/hlog/page/{pageNo}", method = { RequestMethod.GET, RequestMethod.POST })
	public String getProHlogList(@PathVariable int no, @PathVariable int pageNo, Model model, HttpSession session) {

		System.out.println("GET /user/" + no + "/hlog/page/" + pageNo);

		Dounor loginDounor = (Dounor) session.getAttribute("loginDounor");

		// 프로필
		PageVO pageVO = new PageVO();
		pageVO.setNo(no);
		pageVO.setFlag(loginDounor.getNo() == no);

		model.addAllAttributes(dounorsService.getProfile(no, pageVO, loginDounor.getNo()));

		// hlog

		System.out.println(loginDounor.getNo() == no);

		model.addAllAttributes(hlogsService.getProHlogList(pageNo, no, loginDounor.getNo() == no));

		//

		Follow follow = new Follow();
		follow.setNoFollowing(no);// 프로필 유저 번호
		follow.setNoFollower(loginDounor.getNo());// 로그인 유저 번호

		// 팔로우 리스트
		model.addAllAttributes(dounorsService.followList(follow));

		return "profile";
	}// getProHlogList() end

	// following
	@RequestMapping(value = "/ajax/user/{no}/hlog/page/{pageNo}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getFollowingList(@PathVariable int no, Follow follow, HttpSession session, Model model) {

		follow.setNoFollowing(no);

		model.addAllAttributes(dounorsService.followList(follow));
		return dounorsService.followList(follow);
	} // getFollowingList() end

	@RequestMapping(value = "/ajax/follow", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getFollowingFlag(Follow follow, HttpSession session, Model model) {

		Dounor loginDounor = (Dounor) session.getAttribute("loginDounor");

		follow.setNoFollower(loginDounor.getNo());
		follow.setNoFollowing(follow.getNoFollowing());

		System.out
				.println("인서트,딜리트 / following " + follow.getNoFollowing() + " / follower : " + follow.getNoFollower());

		// model.addAllAttributes(dounorsService.followingFlag(follow));
		return dounorsService.followingFlag(follow);
	} // getFollowingFlag() end

	@RequestMapping(value = "/ajax/hlog/list/{pageNo}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> hlogList(@PathVariable int pageNo) {
		System.out.println("/ajax/hlog/list/" + pageNo);
		return hlogsService.getList(pageNo);
	}// hlogList() end

	@RequestMapping(value = "/hlog/{no}", method = RequestMethod.GET)
	public String hlog(@PathVariable int no, boolean isHit, HttpSession session, Model model) {
		System.out.println("GET /hlog/" + no);
		Hlog hLog = hlogsService.getHlog(no, isHit);
		if (hLog == null) {
			return "redirect:/hlog";
		} else {
			Set<Integer> viewPages = (Set)session.getAttribute("viewPages");
			if (viewPages == null) {
				viewPages = new LinkedHashSet<>();
			} // if end
			if (!viewPages.contains(no)) {
				session.setAttribute("viewPages", viewPages);
				hLog.setHit(hLog.getHit() + 1);
			} // if end
			model.addAttribute("hlog", hLog);
			return "hlogDetail";
		} // if() ~ else end
	}// hlog() end

	@RequestMapping(value = "/ajax/hlog/{no}/page/{pageNo}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> hlogCommentList(@PathVariable int no, @PathVariable int pageNo) {
		System.out.println("/ajax/hlog/" + no + "/page/" + pageNo);
		return hlogCommentsService.getList(no, pageNo);
	}// hlogCommentList() end

	@RequestMapping(value = "/ajax/hlog/comment", method = RequestMethod.POST)
	@ResponseBody
	public String registerComment(HlogComment hlogComment) {
		System.out.println("POST /ajax/hlog/comment");
		boolean flag = hlogCommentsService.registerComment(hlogComment);
		return "{\"result\" :" + flag + "}";
	}// registerComment() end

	@RequestMapping(value = "/ajax/hlog/comment/delete", method = RequestMethod.POST)
	@ResponseBody
	public String removeComment(int no) {
		System.out.println("DELETE /ajax/hlog/comment");
		boolean flag = hlogCommentsService.removeComment(no);
		return "{\"result\" :" + flag + "}";
	}// removeComment() end

	@RequestMapping(value = "/hlog/register", method = RequestMethod.GET)
	public String writeForm() {
		System.out.println("GET /hlogform");
		return "hlogForm";
	}// writeForm() end

	@RequestMapping(value = "/ajax/hlog/hero/upload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uploadImage(MultipartFile uploadImage, HttpServletRequest request) {
		System.out.println("POST /upload");
		String rootPath = request.getServletContext().getRealPath("/");
		String uploadPath = rootPath + "img" + File.separator + "upload" + File.separator;
		String fileName = uploadImage.getOriginalFilename();
		File file = new File(uploadPath + fileName);
		file = fileRenameUtil.rename(file);
		try {
			uploadImage.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} // try ~ catch() end
		return "{\"src\":\"" + file.getName() + "\"}";
	}// uploadImage() end

	@RequestMapping(value = "/hlog", method = RequestMethod.POST)
	public String regiterHlog(Hlog hlog, HttpSession session, @RequestParam(required = false) String colorCode) {
		System.out.println("POST /hlog");

		Dounor dounor = (Dounor) session.getAttribute("loginDounor");

		hlog.setDounorNo(dounor.getNo());
		hlog.setProfile(dounor.getProfile());
		hlog.setNickname(dounor.getNickname());

		// System.out.println(hlog.getOpen());
		// System.out.println(hlog.getTripStyle());
		// System.out.println(hlog.getTitle());
		// System.out.println(dounor.getProfile());
		// System.out.println(dounor.getNo());
		// System.out.println(dounor.getNickname());
		// System.out.println(hlog.getGoDate());
		// System.out.println(hlog.getComeDate());
		// System.out.println(hlog.getContents());
		// System.out.println("colorCode:"+colorCode);
		// System.out.println("titlePic:"+hlog.getTitlePic());

		System.out.println("register Hlog : " + hlogsService.register(hlog, colorCode));
		return "redirect:/hlog";
	}// regiterHlog() end

}// HLogController end