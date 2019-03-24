package org.yolo.holo.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.yolo.holo.dao.PersonnelsDAO;
import org.yolo.holo.dao.TagsDAO;
import org.yolo.holo.dao.TogethersDAO;
import org.yolo.holo.util.PaginateUtil;
import org.yolo.holo.vo.ContentsTag;
import org.yolo.holo.vo.PageVO;
import org.yolo.holo.vo.Personnel;
import org.yolo.holo.vo.Together;

public class TogethersServiceImpl implements TogethersService {
   
   private TogethersDAO togethersDAO;
   private PersonnelsDAO personnelsDAO;
   
   public void setTogethersDAO(TogethersDAO togethersDAO) {
      this.togethersDAO = togethersDAO;
   }//setTogethersDAO() end
   
   private PaginateUtil paginateUtil;
   
   public void setPaginateUtil(PaginateUtil paginateUtil) {
      this.paginateUtil = paginateUtil;
   }
   
   private TagsDAO tagsDAO;
   
   public void setTagsDAO(TagsDAO tagsDAO) {
      this.tagsDAO = tagsDAO;
   }
   public void setPersonnelsDAO(PersonnelsDAO personnelsDAO) {
	this.personnelsDAO = personnelsDAO;
}
   
   
   @Override
   public Map<String, Object> together(int pageNo) {
      // TODO Auto-generated method stub
      
      Map<String, Object> map = new ConcurrentHashMap<>();
      
      int numPage = 6;
      int numBlock = 5;
      
      PageVO pageVO = new PageVO(pageNo,numPage);

      List<Together> togetherPage = togethersDAO.selectTogetherListPage(pageVO);

      int total = togethersDAO.selectTogetherTotal();
      String url = "/together/page/";
      
      String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
      
      
      for(Together together: togetherPage) {
         System.out.println(together.getNoSpot());
         together.setTags(tagsDAO.selectTag(together.getNoSpot()));
         together.setPersonnelResult(togethersDAO.selectPersonnelTotal(together.getNo()));
      }
      
      map.put("list", togetherPage);
      map.put("paginate", paginate);
      
      return map;
   }


    // 은서 : together insert
	@Override
	public boolean togetherRegister(int noDounor, Together together, Personnel personnel) {

		int result = 0;
		
		together.setNoDounor(noDounor);
		result = togethersDAO.insert(together);
		if(result == 0) {
			return false;
		}
		
		int noTogether = together.getNo();
		
		personnel.setNoDounor(noDounor);
		personnel.setNoTogether(noTogether);
		result = personnelsDAO.insert(personnel);	
		if(result == 0) {
			return false;
		}
		
		return 1 == result;
	}
	   
}//TogethersServiceImpl end