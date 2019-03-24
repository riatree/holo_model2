package org.yolo.holo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yolo.holo.service.SpotsService;
import org.yolo.holo.service.TogethersService;
import org.yolo.holo.vo.Dounor;
import org.yolo.holo.vo.Personnel;
import org.yolo.holo.vo.Spot;
import org.yolo.holo.vo.Together;

@Controller
public class TogetherController {

	private TogethersService togethersService;
	
	// 은서 
	private SpotsService spotsService;

	public void setTogethersService(TogethersService togethersService) {
		this.togethersService = togethersService;
	}
	public void setSpotsService(SpotsService spotsService) {
		this.spotsService = spotsService;
	}

	@RequestMapping(value = "/together/page/{pageNo}", method = RequestMethod.GET)
	public String index(@PathVariable int pageNo, Model model) {

		// System.out.println("GET /together/page/" + pageNo);

		model.addAllAttributes(togethersService.together(pageNo));

		return "together";
	} // index() end

	// localhost/together을 쳐도 localhost/together/page/1로 감
	@RequestMapping(value = "/together", method = RequestMethod.GET)
	public String index() {

		// System.out.println("GET /together/page/");

		return "redirect:/together/page/1";
	} // index() end

	@RequestMapping(value = "/together/register", method = RequestMethod.GET)
	public String togetherRegisterForm() {

		// System.out.println("GET /together/registerForm/");

		return "togetherRegisterForm";
	} // togetherRegisterForm() end

	// 은서 : together 등록 시 spot 목록 search
	@RequestMapping(value = "/ajax/together/spot/{name}", method = RequestMethod.GET)
	@ResponseBody
	public List<Spot> spotSearch(@PathVariable String name) {

		return spotsService.selectSearchSpot(name);
	} // spotSearch() end
	
	
	// 은서 : together insert
	@RequestMapping(value = "/together", method = RequestMethod.POST)
	public String togetherRegister(HttpSession session, Together together, Personnel personnel) {
		// System.out.println("POST /spot");

		Dounor dounor = (Dounor) session.getAttribute("loginDounor");
		int noDounor = dounor.getNo();

		togethersService.togetherRegister(noDounor, together, personnel);

		return "redirect:/together/page/1";
	} // insertTour() end

}// TogetherController end