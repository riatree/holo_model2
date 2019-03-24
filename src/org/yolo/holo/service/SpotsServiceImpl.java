package org.yolo.holo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.yolo.holo.dao.ContentsTagsDAO;
import org.yolo.holo.dao.DounorSavesDAO;
import org.yolo.holo.dao.DounorsDAO;
import org.yolo.holo.dao.FoodGradesDAO;
import org.yolo.holo.dao.MenusDAO;
import org.yolo.holo.dao.ReviewsDAO;
import org.yolo.holo.dao.ServicesDAO;
import org.yolo.holo.dao.SpotPicsDAO;
import org.yolo.holo.dao.SpotsDAO;
import org.yolo.holo.dao.TagsDAO;
import org.yolo.holo.dao.TogethersDAO;
import org.yolo.holo.dao.TourGradesDAO;
import org.yolo.holo.util.PaginateUtil;
import org.yolo.holo.vo.ContentsTag;
import org.yolo.holo.vo.Dounor;
import org.yolo.holo.vo.FoodGrade;
import org.yolo.holo.vo.Menu;
import org.yolo.holo.vo.PageVO;
import org.yolo.holo.vo.Review;
import org.yolo.holo.vo.Service;
import org.yolo.holo.vo.Spot;
import org.yolo.holo.vo.SpotPic;
import org.yolo.holo.vo.Tag;
import org.yolo.holo.vo.Together;
import org.yolo.holo.vo.TourGrade;

public class SpotsServiceImpl implements SpotsService {

	private SpotsDAO spotsDAO;
	private PaginateUtil paginateUtil;
	private DounorSavesDAO dounorSavesDAO;
	private TagsDAO tagsDAO;
	private FoodGradesDAO foodGradesDAO;
	private TourGradesDAO tourGradesDAO;
	private SpotPicsDAO spotPicsDAO;
	private MenusDAO menusDAO;
	private ServicesDAO servicesDAO;
	private ContentsTagsDAO contentsTagsDAO;
	private ReviewsDAO reviewsDAO;
	private TogethersDAO togethersDAO;

	public void setSpotsDAO(SpotsDAO spotsDAO) {
		this.spotsDAO = spotsDAO;
	}// setSpotsDAO() end

	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	} // setPaginateUtil() end

	public void setDounorSavesDAO(DounorSavesDAO dounorSavesDAO) {
		this.dounorSavesDAO = dounorSavesDAO;
	}

	public void setTagsDAO(TagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}

	public void setFoodGradesDAO(FoodGradesDAO foodGradesDAO) {
		this.foodGradesDAO = foodGradesDAO;
	}

	public void setTourGradesDAO(TourGradesDAO tourGradesDAO) {
		this.tourGradesDAO = tourGradesDAO;
	}

	public void setSpotPicsDAO(SpotPicsDAO spotPicsDAO) {
		this.spotPicsDAO = spotPicsDAO;
	}

	public void setMenusDAO(MenusDAO menusDAO) {
		this.menusDAO = menusDAO;
	}

	public void setServicesDAO(ServicesDAO servicesDAO) {
		this.servicesDAO = servicesDAO;
	}

	public void setContentsTagsDAO(ContentsTagsDAO contentsTagsDAO) {
		this.contentsTagsDAO = contentsTagsDAO;
	}

	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	public void setTogethersDAO(TogethersDAO togethersDAO) {
		this.togethersDAO = togethersDAO;
	}

	// 은서 : food list 추가
	@Override
	public Map<String, Object> getFoodList(int pageNo) {

		Map<String, Object> map = new ConcurrentHashMap<>();

		int numBlock = 5;

		// 한페이지 당 보여지는 게시물 수
		int numPage = 6;

		// 페이지 처리용
		PageVO pageVO = new PageVO(pageNo, numPage);

		List<Spot> list = spotsDAO.selectFoodList(pageVO);

		// 전체 페이지수
		int total = spotsDAO.selectFoodTotal();

		String url = "/food/page/";

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		// 스크랩, 좋아요 수 가져오기
		// hice값 가져오기
		// 태그 가져오기
		for (Spot spot : list) {
			spot.setScrap(dounorSavesDAO.selectSpotScrap(spot.getNo()));
			spot.setLike(dounorSavesDAO.selectSpotLike(spot.getNo()));
//			spot.setHicePoint(foodGradesDAO.selectFoodHice(spot.getNo()));
//			
//			if(spot.getHicePoint() == null)

			spot.setTagList(tagsDAO.selectTag(spot.getNo()));

		} // for end

		map.put("spots", list);
		map.put("paginate", paginate);

		return map;
	} // getFoodList() end

	// 은서 : tour list 추가
	@Override
	public Map<String, Object> getTourList(int pageNo) {

		Map<String, Object> map = new ConcurrentHashMap<>();

		// 한페이지에 보여질 페이지 블룩 수
		int numBlock = 5;

		// 한페이지 당 보여지는 게시물 수
		int numPage = 6;

		// 페이지 처리용
		PageVO pageVO = new PageVO(pageNo, numPage);

		List<Spot> list = spotsDAO.selectTourList(pageVO);

		// 전체 페이지수
		int total = spotsDAO.selectTourTotal();

		String url = "/tour/page/";

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		for (Spot spot : list) {
			spot.setScrap(dounorSavesDAO.selectSpotScrap(spot.getNo()));
			spot.setLike(dounorSavesDAO.selectSpotLike(spot.getNo()));
//			spot.setHicePoint(foodGradesDAO.selectFoodHice(spot.getNo()));
//			
//			if(spot.getHicePoint() == null)

			spot.setTagList(tagsDAO.selectTag(spot.getNo()));

		} // for end

		map.put("spots", list);
		map.put("paginate", paginate);

		return map;
	} // getTourList() end

	// 은서 : food insert
	@Override
	public boolean insertFood(int dounorNo, Spot spot, String picName, String[] menuName, int[] menuPrice, int king,
			int hice, String[] good, String[] service, String[] theme) {

		int result = 0;

		// spot
		spot.setDounorNo(dounorNo);
		if (spot.getAddress2() == null) {
			spot.setAddress2(" ");
		}
		if (spot.getContact() == null) {
			spot.setContact(" ");
		}
		result = spotsDAO.insert(spot);

		if (result == 0) {
			return false;
		}

		// System.out.println(result);

		int noSpot = spot.getNo();

		// System.out.println(noSpot);

		// spotpic
		SpotPic spotpic = new SpotPic();
		spotpic.setPicName(picName);
		spotpic.setNoSpot(noSpot);
		spotpic.setNoDounor(dounorNo);
		result = spotPicsDAO.insert(spotpic);
		if (result == 0) {
			return false;
		}

		// menu
		for (int i = 0; i < menuName.length; i++) {

			// int value = Integer.parseInt(king[i]);

			Menu menu = new Menu(menuName[i], menuPrice[i]);

			if (king == i) {
				menu.setKing(1);
			} // if end

			menu.setNoSpot(noSpot);
			result = menusDAO.insert(menu);
			if (result == 0) {
				return false;
			}
		} // for end

		// foodgrade
		FoodGrade foodgrade = new FoodGrade();
		foodgrade.setNoDounor(dounorNo);
		foodgrade.setNoSpot(noSpot);
		foodgrade.setHice(hice);
		foodgrade.setFlavor("0");
		foodgrade.setService("0");
		foodgrade.setClean("0");
		foodgrade.setFeeling("0");
		foodgrade.setCheap("0");
		for (String goodOne : good) {

			switch (goodOne) {
			case "F": {
				foodgrade.setFlavor("1");
				break;
			}
			case "S": {
				foodgrade.setService("1");
				break;
			}
			case "C": {
				foodgrade.setClean("1");
				break;
			}
			case "L": {
				foodgrade.setFeeling("1");
				break;
			}
			case "H": {
				foodgrade.setCheap("1");
				break;
			}
			} // switch end
		} // for end
		result = foodGradesDAO.insert(foodgrade);
		if (result == 0) {
			return false;
		}

		// service
		for (String serviceStrOne : service) {

			Service services = new Service();
			services.setName(serviceStrOne);
			services.setNoSpot(noSpot);

			result = servicesDAO.insert(services);
			if (result == 0) {
				return false;
			}
		} // for end

		for (String themeStrOne : theme) {

			int themeOne = Integer.parseInt(themeStrOne);

			ContentsTag contentsTag = new ContentsTag();
			contentsTag.setNoTag(themeOne);
			contentsTag.setContentsNo(noSpot);

			result = contentsTagsDAO.insert(contentsTag);
			if (result == 0) {
				return false;
			}
		} // for end
		return 1 == result;
	} // insertFood() end

	// 은서 : tour insert
	@Override
	public boolean insertTour(int dounorNo, Spot spot, String picName, int hice, String[] good, String[] service,
			String[] theme) {

		int result = 0;

		// spot
		spot.setDounorNo(dounorNo);
		if (spot.getAddress2() == null) {
			spot.setAddress2(" ");
		}
		if (spot.getContact() == null) {
			spot.setContact(" ");
		}
		result = spotsDAO.insert(spot);

		if (result == 0) {
			return false;
		}

		int noSpot = spot.getNo();

		// spotpic
		SpotPic spotpic = new SpotPic();
		spotpic.setPicName(picName);
		spotpic.setNoSpot(noSpot);
		spotpic.setNoDounor(dounorNo);
		result = spotPicsDAO.insert(spotpic);

		// tourgrade
		TourGrade tourgrade = new TourGrade();
		tourgrade.setNoDounor(dounorNo);
		tourgrade.setNoSpot(noSpot);
		tourgrade.setHice(hice);
		tourgrade.setPhotozon("0");
		tourgrade.setFacility("0");
		tourgrade.setTraffic("0");
		tourgrade.setWatch("0");
		tourgrade.setAround("0");
		for (String goodStrOne : good) {

			switch (goodStrOne) {
			case "P": {
				tourgrade.setPhotozon("1");
				break;
			}
			case "F": {
				tourgrade.setFacility("1");
				break;
			}
			case "T": {
				tourgrade.setTraffic("1");
				break;
			}
			case "W": {
				tourgrade.setWatch("1");
				break;
			}
			case "A": {
				tourgrade.setAround("1");
				break;
			}
			} // switch end
		} // for end
		result = tourGradesDAO.insert(tourgrade);
		if (result == 0) {
			return false;
		}

		// service
		for (String serviceStrOne : service) {

			Service services = new Service();
			services.setName(serviceStrOne);
			services.setNoSpot(noSpot);

			result = servicesDAO.insert(services);
			if (result == 0) {
				return false;
			}
		} // for end

		for (String themeStrOne : theme) {

			int themeOne = Integer.parseInt(themeStrOne);

			ContentsTag contentsTag = new ContentsTag();
			contentsTag.setNoTag(themeOne);
			contentsTag.setContentsNo(noSpot);

			result = contentsTagsDAO.insert(contentsTag);
			if (result == 0) {
				return false;
			}
		} // for end

		return 1 == result;
	} // insertTour() end

	// 은서 : together에서 spot search
	@Override
	public List<Spot> selectSearchSpot(String name) {

		return spotsDAO.selectSearchSpot("%" + name + "%");
	}

	public Map<String, Object> getSpotOne(int no) {
		// TODO Auto-generated method stub

		System.out.println(no);
		// 서비스에서 비지니스로직을 처리함

		Map<String, Object> map = new HashMap<>();

		Spot spot = spotsDAO.selectSpotOne(no);
		System.out.println(spot);

		List<Spot> spotLists = spotsDAO.selectSpotList();

		List<Tag> tag = tagsDAO.selectTag(no); // 태그 리스트
		List<SpotPic> spotPic = spotPicsDAO.selectSpotPicList(no); // 스팟사진 리스트
		int spotPicNum = spotPicsDAO.selectPicNum(no); // 스팟 사진 개수
		FoodGrade foodgrade = foodGradesDAO.selectFoodReview(spot.getNo());
		TourGrade tourgrade = tourGradesDAO.selectTourReview(spot.getNo());
		List<Service> service = servicesDAO.selectSpotService(spot.getNo()); // 부가 서비스 리스트

		List<Review> reviews = reviewsDAO.reviewList(no); // 리뷰
		List<Together> togethers = togethersDAO.selectTogetherListNo(no); // 동행리뷰 동행글
		List<Together> spotTogethers = togethersDAO.selectSpotTogetherList(no); // 동행리스트
		for (Together together : togethers) {
			together.setTags(tagsDAO.selectTag(together.getNoSpot()));
			together.setPersonnelResult(togethersDAO.selectPersonnelTotal(together.getNo()));
			together.setReviews(reviewsDAO.reviewTogetherList(together.getNoSpot()));
		}

		for (Together together : spotTogethers) {
			together.setTags(tagsDAO.selectTag(together.getNoSpot()));
		}

		for (Spot spotList : spotLists) {
			spotList.setTags(tagsDAO.selectTag(spotList.getNoSpot()));
		}

		List<Menu> menus = menusDAO.selectMenu(no);

		map.put("spot", spot);
		map.put("spotList", spotLists);
		map.put("spotpic", spotPic);
		map.put("tag", tag);
		map.put("foodgrade", foodgrade);
		map.put("tourgrade", tourgrade);
		map.put("service", service);
		map.put("review", reviews);
		map.put("reviewTogether", togethers);
		map.put("spotTogether", spotTogethers);
		map.put("menu", menus);

		return map;

	}

	@Override
	public boolean insertMenu(Menu menu, String[] menuName, String[] menuPrice) {
		// TODO Auto-generated method stub
		int result = 0;

		// menu
		for (int i = 0; i < menuName.length; i++) {

			menu.setName(menuName[i]);
			menu.setPrice(Integer.parseInt(menuPrice[i]));

			result = menusDAO.insert(menu);
			if (result == 0) {
				return false;
			}
		} // for end

		return 1 == result;
	}

	@Override
	public int FounderTourNum(int no) {
		// TODO Auto-generated method stub
		return spotsDAO.selectProTourFounderCount(no);
	}// FounderTourNum() end

	@Override
	public int FounderFoodNum(int no) {
		// TODO Auto-generated method stub
		return spotsDAO.selectProFoodFounderCount(no);
	}// FounderFoodNum() end

	@Override
	public Map<String, Object> ProFounder(int no) {

		Map<String, Object> map = new ConcurrentHashMap<>();

		List<Spot> foodFounder = spotsDAO.selectProFoodFounder(no);
		List<Spot> tourFounder = spotsDAO.selectProTourFounder(no);

		System.out.println("찾은 음식점list : " + foodFounder + "개");
		System.out.println("찾은 관광명소list : " + tourFounder + "개");

		int foodFounderNum = spotsDAO.selectProFoodFounderCount(no);
		int tourFounderNum = spotsDAO.selectProTourFounderCount(no);
		System.out.println("찾은 음식점 : " + foodFounderNum + "개/ 찾은 관광명소 : " + tourFounderNum + "개");

		map.put("foodFounder", foodFounder);
		map.put("tourFounder", tourFounder);
		map.put("foodFounderNum", foodFounderNum);
		map.put("tourFounderNum", tourFounderNum);

		return map;
	}

}// SpotsServiceImpl end
