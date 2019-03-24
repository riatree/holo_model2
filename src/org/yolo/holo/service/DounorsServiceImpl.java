package org.yolo.holo.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.yolo.holo.dao.DounorSavesDAO;
import org.yolo.holo.dao.DounorsDAO;
import org.yolo.holo.dao.FollowDAO;
import org.yolo.holo.dao.HlogsDAO;
import org.yolo.holo.dao.PersonnelsDAO;
import org.yolo.holo.dao.ReviewsDAO;
import org.yolo.holo.dao.SpotsDAO;
import org.yolo.holo.vo.Dounor;
import org.yolo.holo.vo.Follow;
import org.yolo.holo.vo.PageVO;

public class DounorsServiceImpl implements DounorsService{
   
   private DounorsDAO dounorsDAO;
   private ReviewsDAO reviewsDAO;
   private SpotsDAO spotsDAO;
   private FollowDAO followDAO;
   private PersonnelsDAO personnelsDAO;
   private DounorSavesDAO dounorSavesDAO;
   private HlogsDAO hlogsDAO;
   
   public void setDounorsDAO(DounorsDAO dounorsDAO) {
      this.dounorsDAO = dounorsDAO;
   }//setDounorsDAO() end   
   public void setDounorSavesDAO(DounorSavesDAO dounorSavesDAO) {
      this.dounorSavesDAO = dounorSavesDAO;
   }
   public void setFollowDAO(FollowDAO followDAO) {
      this.followDAO = followDAO;
   }
   public void setHlogsDAO(HlogsDAO hlogsDAO) {
      this.hlogsDAO = hlogsDAO;
   }
   public void setPersonnelsDAO(PersonnelsDAO personnelsDAO) {
      this.personnelsDAO = personnelsDAO;
   }
   public void setReviewsDAO(ReviewsDAO reviewsDAO) {
      this.reviewsDAO = reviewsDAO;
   }
   public void setSpotsDAO(SpotsDAO spotsDAO) {
      this.spotsDAO = spotsDAO;
   }
   
   
   @Override
   public Dounor login(Dounor dounor) {
      return dounorsDAO.selectLogin(dounor);
   }//login() end


   @Override
   public Map<String, Object> getProfile(int no ,PageVO pageVO,int loginNo) {
      
      Map<String, Object> map = new ConcurrentHashMap<>();
      
      Dounor dounor = dounorsDAO.selectDounorProfile(pageVO.getNo());
      int pink = dounor.getPink();
      int green = dounor.getGreen();
      int red = dounor.getRed();
      int chco = dounor.getChco();
      int orange = dounor.getOrange();
      int blue = dounor.getBlue();
      int white = dounor.getWhite();
      int yellow = dounor.getYellow();
      String profile = dounor.getProfile();
      String nickname = dounor.getNickname();

      int togetherReviewNum = reviewsDAO.selectProReviewTotal(no);// 동행리뷰 갯수
      int founderTourNum = spotsDAO.selectProTourFounderCount(no);//찾은 관광명소 수
      int founderFoodNum = spotsDAO.selectProFoodFounderCount(no);//찾은 음식점수
      int founderTotalNum = founderTourNum + founderFoodNum; //찾은 spot 수
      int followNum = followDAO.selectFollowingNum(no);//팔로잉 수 
      int personnelNum = personnelsDAO.selectDounorPersonnelCount(no);//동행수 초코
      int likeNum = dounorSavesDAO.selectLikeCount(no);//라이크 수 블루
      int hlogCountNum = hlogsDAO.selectProTotal(pageVO);//Hlog 쓴 끌수 화이트
      int reviewNum = reviewsDAO.selectProReviewCount(no);//리뷰 수 옐로우
      
      System.out.println("동행한수 : "+togetherReviewNum + "/ pink : "+pink);

      togetherReviewNum = togetherReviewNum/5;   
      followNum = followNum/10;
      personnelNum = personnelNum/3;
      likeNum = likeNum/30;
      reviewNum = reviewNum/30;
      
            
      if(togetherReviewNum>6) {
         togetherReviewNum=6;
      }//if end
      if(founderTotalNum>6) {
         founderTotalNum=6;
      }//if end
      if(followNum>6) {
         followNum=6;
      }//if end
      if(personnelNum>6) {
         personnelNum=6;
      }//if end
      if(likeNum>6) {
         likeNum=6;
      }//if end
      if(hlogCountNum>6) {
         hlogCountNum=6;
      }//if end
      if(reviewNum>6) {
         reviewNum=6;
      }//if end
      
      if(togetherReviewNum!=pink) {
         int result = dounorsDAO.updatePink(togetherReviewNum);
         pink = dounorsDAO.selectDounorProfile(no).getPink();
      }//if end
      if(founderTotalNum!=green) {
         int result = dounorsDAO.updateGreen(founderTotalNum);
         green = dounorsDAO.selectDounorProfile(no).getGreen();
      }//if end
      if(followNum!=red) {
         int result = dounorsDAO.updateRed(followNum);
         red = dounorsDAO.selectDounorProfile(no).getRed();
      }//if end
      if(personnelNum!=chco) {
         int result = dounorsDAO.updateChco(personnelNum);
         chco = dounorsDAO.selectDounorProfile(no).getChco();
      }//if end
      if(likeNum!=blue) {
         int result = dounorsDAO.updateBlue(likeNum);
         blue = dounorsDAO.selectDounorProfile(no).getBlue();
      }//if end
      if(hlogCountNum!=white) {
         int result = dounorsDAO.updateWhite(hlogCountNum);
         white = dounorsDAO.selectDounorProfile(no).getWhite();
      }//if end
      if(reviewNum!=yellow) {
         int result = dounorsDAO.updateYellow(reviewNum);
         yellow = dounorsDAO.selectDounorProfile(no).getYellow();
      }//if end
      System.out.println("no : "+no+"/pink : " +pink + "/green : "+ green + "/red : "+ red+"/chco : "+chco+"/orange : "+orange +"/blue : "+ blue + "/white : "+white+"/yellow : "+yellow+"/profile : "+profile + "/nickname : " + nickname);
      Dounor newDounor = new Dounor(no, pink, green, red, chco, orange, blue, white, yellow, profile, nickname);
      
      
      //////////////////////////////////팔로우기능
      
      
      Follow follow = new Follow();
       follow.setNoFollowing(no);
       follow.setNoFollower(loginNo);
      
      int flag = followDAO.selectFollowingNow(follow);
      int FollowingNum = followDAO.selectFollowerNum(no);
      int FollowerNum = followDAO.selectFollowingNum(no);
      
      System.out.println("팔로잉했는가flag : " + flag+ " FollowingNum : "+ FollowingNum + " FollowerNum : " + FollowerNum);
         
      map.put("dounorProfile", newDounor);
      map.put("followFlag", flag);
      map.put("FollowingNum",FollowingNum);
      map.put("FollowerNum",FollowerNum);
      
      return map;
   }
   
   
   @Override
   public Map<String, Object> followList(Follow follow) {

      Map<String, Object> map = new ConcurrentHashMap<>();
      
   /*   follow.setNoFollowing(follow.getNoFollowing());//프로필 유저 번호
      follow.setNoFollower(follow.getNoFollower());//로그인 유저 번호
      */
      System.out.println("팔로잉 넘버" + follow.getNoFollowing() + "/ 팔로우 넘버" + follow.getNoFollower());
      
       List<Follow> followingList = followDAO.selectFollowerList(follow.getNoFollowing());
       List<Follow> followerList = followDAO.selectFollowingList(follow.getNoFollowing());

       System.out.println("followingList : " +followingList );
       System.out.println("followerList : " +followerList );
      
       map.put("followingList", followingList);
       map.put("followerList", followerList);
      
      return map;
   }
   @Override
   public Map<String, Object> followingFlag(Follow follow) {

      
      Map<String, Object> map = new ConcurrentHashMap<>();
      
      int result = 0;
      String value= null;

      System.out.println("팔로우하려는 유저번호 : " + follow.getNoFollower());
      System.out.println("팔로잉당하는 유저번호 : " + follow.getNoFollowing());
      
       int flag = followDAO.selectFollowingNow(follow);
      System.out.println("flag : "+ flag);

      if(flag == 1){
         result = followDAO.delete(follow);
         System.out.println("삭제완료");
         value="delete";
      }else{
         result = followDAO.insert(follow);
         System.out.println("입력 완료");
         value="insert";
      }//if~else end
      
      System.out.println("followBtn result : "+ result);
   
    map.put("followBtnResult", value);   
    map.put("followCount", followDAO.selectFollowingNow(follow));
      
      return map;
   }
   
   @Override
   public int checkId(String id) {
      return dounorsDAO.selectCheckId(id);
   }//checkId() end

   @Override
   public int checkNickname(String nickname) {
      return dounorsDAO.selectCheckNickname(nickname);
   }//checkNickname() end


   


   
}//DounorsServiceImpl end