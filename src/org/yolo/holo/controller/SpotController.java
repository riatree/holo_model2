package org.yolo.holo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.yolo.holo.service.DounorsService;
import org.yolo.holo.service.LocationsService;
import org.yolo.holo.service.MenusService;
import org.yolo.holo.service.SpotsService;
import org.yolo.holo.util.FileRenameUtil;
import org.yolo.holo.vo.ContentsTag;
import org.yolo.holo.vo.Dounor;
import org.yolo.holo.vo.FoodGrade;
import org.yolo.holo.vo.Location;
import org.yolo.holo.vo.Menu;
import org.yolo.holo.vo.PageVO;
import org.yolo.holo.vo.Service;
import org.yolo.holo.vo.Spot;
import org.yolo.holo.vo.SpotPic;
import org.yolo.holo.vo.Tag;

import util.ResizeImageUtil;

@Controller
public class SpotController {

	private SpotsService spotsService;
	private LocationsService locationsService;
	private DounorsService dounorsService;
	private MenusService menusService;
	private ResizeImageUtil resizeImageUtil;
	private FileRenameUtil fileRenameUtil;

	public void setSpotsService(SpotsService spotsService) {
		this.spotsService = spotsService;
	}

	public void setLocationsService(LocationsService locationsService) {
		this.locationsService = locationsService;
	}

	public void setDounorsService(DounorsService dounorsService) {
		this.dounorsService = dounorsService;
	}

	public void setMenusService(MenusService menusService) {
		this.menusService = menusService;
	}

	public void setResizeImageUtil(ResizeImageUtil resizeImageUtil) {
		this.resizeImageUtil = resizeImageUtil;
	}

	public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
		this.fileRenameUtil = fileRenameUtil;
	}
	
	

	// 은서 : foodList 출력
	@RequestMapping(value = "/food/page/{pageNo}", method = RequestMethod.GET)
	public String foodList(@PathVariable int pageNo, Model model) {
		System.out.println("GET /food/page/" + pageNo);

		model.addAllAttributes(spotsService.getFoodList(pageNo));

		return "food";
	} // foodList() end

	// 은서 : localhost/food 를 쳐도 localhost/food/page/1 로 보내기
	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String foodFirstPage() {

		return "redirect:/food/page/1";
	} // tourFirstPage() end

	// 은서 : tourList 출력
	@RequestMapping(value = "/tour/page/{pageNo}", method = RequestMethod.GET)
	public String tourList(@PathVariable int pageNo, Model model) {
		System.out.println("GET /tour/page/" + pageNo);

		model.addAllAttributes(spotsService.getTourList(pageNo));

		return "tour";
	} // tourList() end

	// 은서 : localhost/tour 를 쳐도 localhost/tour/page/1 로 보내기
	@RequestMapping(value = "/tour", method = RequestMethod.GET)
	public String tourFirstPage() {

		return "redirect:/tour/page/1";
	} // tourFirstPage() end

	// 은서 : tour, food 등록 시 location 목록 search
	@RequestMapping(value = "/ajax/spot/location/{name}", method = RequestMethod.GET)
	@ResponseBody
	public List<Location> locationSearch(@PathVariable String name) {

		return locationsService.getKeyword(name);

	} // locationSearch() end

	// 은서 : spot 사진 등록
	@RequestMapping(value = "/ajax/spot/upload", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String tourUpload(MultipartFile uploadImg, HttpServletRequest request) {
		// System.out.println("POST /upload");

		// WAS경로
		String rootPath = request.getServletContext().getRealPath("/");
		// System.out.println(rootPath);

		// 업로드 폴더 경로
		String uploadPath = rootPath + "img" + File.separator + "upload" + File.separator;
		// System.out.println(uploadPath);

		// 파일 이름
		String fileName = uploadImg.getOriginalFilename();
		System.out.println(fileName);

		// 이동할 파일
		File file = new File(uploadPath + fileName);

		// 리네임(같은 이름의 파일)
		file = fileRenameUtil.rename(file);

		// 파일 이동
		try {
			uploadImg.transferTo(file);

			// 리사이즈
			ResizeImageUtil.resize(uploadPath + file.getName(),
					rootPath + "img" + File.separator + "spot" + File.separator + file.getName(), 300, 200);

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "{\"src\":\"" + file.getName() + "\"}";
	} // upload() end

	// 은서 : food insert
	@RequestMapping(value = "/spot/food", method = RequestMethod.POST)
	public String insertFood(HttpSession session, Spot spot, String picName, String[] menuName, int[] menuPrice,
			int king, int hice, String[] good, String[] service, String[] theme, BindingResult br) {
		// System.out.println("POST /spot");

		Dounor dounor = (Dounor) session.getAttribute("loginDounor");
		int dounorNo = dounor.getNo();

		spotsService.insertFood(dounorNo, spot, picName, menuName, menuPrice, king, hice, good, service, theme);

		// 인자에 Spotpic spotpic 추가

		System.out.println(br.getErrorCount());

		for (FieldError error : br.getFieldErrors()) {
			System.out.println(error.getField());
		}

		return "redirect:/spot/" + spot.getNo();

	} // insertFood() end

	// 은서 : tour insert
	@RequestMapping(value = "/spot/tour", method = RequestMethod.POST)
	public String insertTour(HttpSession session, Spot spot, String picName, int hice, String[] good, String[] service,
			String[] theme) {
		System.out.println("POST /spot");

		Dounor dounor = (Dounor) session.getAttribute("loginDounor");
		int dounorNo = dounor.getNo();

		spotsService.insertTour(dounorNo, spot, picName, hice, good, service, theme);

		return "redirect:/spot/" + spot.getNo();
	} // insertTour() end

	@RequestMapping(value = "/spot/{no}", method = RequestMethod.GET)
	public String spot(Model model, @PathVariable int no) {

		model.addAllAttributes(spotsService.getSpotOne(no));

		return "Detail";
	}

	@RequestMapping(value = "/spot/{no}", method = RequestMethod.POST)
	public String insertMenu(@PathVariable int no, Menu menu, String[] menuName, String[] menuPrice) {

		menu.setNoSpot(no);

		spotsService.insertMenu(menu, menuName, menuPrice);

		return "redirect:/spot/" + no;
	}

	@RequestMapping(value = "/user/{no}/founder", method = RequestMethod.GET)
	public String getFoodFounder(@PathVariable int no, HttpSession session, Model model) {

		System.out.println("GET /user/" + no + "/founder");

		Dounor loginDounor = (Dounor) session.getAttribute("loginDounor");

		// 프로필
		PageVO pageVO = new PageVO();
		pageVO.setNo(no);
		pageVO.setFlag(loginDounor.getNo() == no);

		model.addAllAttributes(dounorsService.getProfile(no, pageVO, loginDounor.getNo()));

		// founder
		model.addAllAttributes(spotsService.ProFounder(no));

		return "profile";
	}// getFoodFounder() end

}// SpotController end
