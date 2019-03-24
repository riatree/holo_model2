package org.yolo.holo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yolo.holo.service.DounorsService;
import org.yolo.holo.vo.Dounor;

@Controller
public class UserController {

	// 은서 : 로그인 위해 추가
	private DounorsService dounorsService;

	public void setDounorsService(DounorsService dounorsService) {
		this.dounorsService = dounorsService;
	}

	// 로그인
	@RequestMapping(value = "/session", method = RequestMethod.POST)
	public String login(@RequestHeader String referer, Dounor dounor, HttpSession session) {
		System.out.println("POST /session");

		session.setAttribute("loginDounor", dounorsService.login(dounor));

		return "redirect:" + referer;
	} // login() end

	// 로그아웃
	@RequestMapping(value = "/session", method = RequestMethod.DELETE)
	public String logout(@RequestHeader String referer, HttpSession session) {

		session.invalidate();

		return "redirect:" + referer;
	} // logout() end

	// 회원가입 입력 폼 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "joinForm";
	}// join() end

	// ajax ckeckId
	@RequestMapping(value = "/ajax/dounor/check/id", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkId(String id) {
		return "{\"count\":" + dounorsService.checkId(id) + "}";
	}// checkId() end

	@RequestMapping(value = "/ajax/dounor/check/nickname", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkNickname(String nickname) {
		return "{\"count\": " + dounorsService.checkNickname(nickname) + " }";
	}// checkNickname() end

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String register(Dounor dounor, @RequestHeader String referer) {
		System.out.println(dounor.getId());
		System.out.println(dounor.getNickname());
		System.out.println(dounor.getPwd());
		System.out.println(dounor.getGender());
		System.out.println(dounor.getBirthDate());
		System.out.println(dounor.getEmail());
		System.out.println(dounor.getPhone());
		System.out.println(dounor.getName());
		System.out.println(dounor.getProfile());

		return "redirect:/" + referer;
	}// register() end

}// UserController end
