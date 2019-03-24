package org.yolo.holo.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.yolo.holo.dao.HlogCommentsDAO;
import org.yolo.holo.util.PaginateUtil;
import org.yolo.holo.vo.HlogComment;
import org.yolo.holo.vo.PageVO;

public class HlogCommentsServiceImpl implements HlogCommentsService{
   private HlogCommentsDAO hlogCommentsDAO;
   private PaginateUtil paginateUtil;
   
   public void setHlogCommentsDAO(HlogCommentsDAO hlogCommentsDAO) {
      this.hlogCommentsDAO = hlogCommentsDAO;
   }//setHlogCommentsDAO() end
   
   public void setPaginateUtil(PaginateUtil paginateUtil) {
      this.paginateUtil = paginateUtil;
   }//setPaginateUtil() end
   
   @Override
   public Map<String, Object> getList(int no, int pageNo) {
      Map<String, Object> map = new ConcurrentHashMap<>();
      int numPage =5;
      int numBlock =5;
      PageVO pageVO = new PageVO(pageNo, numPage, no);
      List<HlogComment> hlogComments = hlogCommentsDAO.selectList(pageVO);
      int total = hlogCommentsDAO.selectTotal(no);
      String url ="/hlog/"+no+"/page/";
      String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
      map.put("total", total);
      map.put("hlogComments", hlogComments);
      map.put("paginate", paginate);
      return map;
   }//getList() end

   @Override
   public boolean registerComment(HlogComment hlogComment) {
      return 1 == hlogCommentsDAO.insert(hlogComment) ;
   }//registerComment() end

   @Override
   public boolean removeComment(int no) {
      return 1 == hlogCommentsDAO.delete(no);
   }//removeComment() end
   
}//HLogCommentsServiceImpl end