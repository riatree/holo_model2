package org.yolo.holo.vo;

import java.sql.Timestamp;

public class TourGrade {
   
   // togetherGood
   private int no,noDounor,noSpot,hice,noTogether,spotNo,noReview;   
   private String photozon,facility,traffic,watch,around,togetherGood,spotName;
   private Timestamp regdate;
   
   // 추가
   private double noDounorCount,photozonCount,facilityCount,trafficCount,watchCount,togetherGoodCount,aroundCount;
   private double hiceCount;
   
   
   
   
   public int getNoReview() {
      return noReview;
   }

   public void setNoReview(int noReview) {
      this.noReview = noReview;
   }

   public String getTogetherGood() {
      return togetherGood;
   }

   public void setTogetherGood(String togetherGood) {
      this.togetherGood = togetherGood;
   }

   public double getNoDounorCount() {
      return noDounorCount;
   }

   public void setNoDounorCount(double noDounorCount) {
      this.noDounorCount = noDounorCount;
   }

   public double getPhotozonCount() {
      if(this.photozonCount==0) {
         return 0;
      }else {
         return photozonCount/getNoDounorCount()*100;
      }
   }

   public void setPhotozonCount(double photozonCount) {
      this.photozonCount = photozonCount;
   }

   public double getFacilityCount() {
      if(this.facilityCount==0) {
         return 0;
      }else {
         return facilityCount/getNoDounorCount()*100;
      }
   }

   public void setFacilityCount(double facilityCount) {
      this.facilityCount = facilityCount;
   }

   public double getTrafficCount() {
      if(this.trafficCount==0) {
         return 0;
      }else {
         return trafficCount/getNoDounorCount()*100;
      }
   }

   public void setTrafficCount(double trafficCount) {
      this.trafficCount = trafficCount;
   }

   public double getWatchCount() {
      if(this.watchCount==0) {
         return 0;
      }else {
         return watchCount/getNoDounorCount()*100;
      }
   }

   public void setWatchCount(double watchCount) {
      this.watchCount = watchCount;
   }

   public double getTogetherGoodCount() {
      if(this.togetherGoodCount==0) {
         return 0;
      }else {
         return togetherGoodCount/getNoDounorCount()*100;
      }
   }

   public void setTogetherGoodCount(double togetherGoodCount) {
      this.togetherGoodCount = togetherGoodCount;
   }

   public double getAroundCount() {
      if(this.aroundCount==0) {
         return 0;
      }else {
         return aroundCount/getNoDounorCount()*100;
      }
   }

   public void setAroundCount(double aroundCount) {
      this.aroundCount = aroundCount;
   }

   public double getHiceCount() {
      return hiceCount;
   }

   public void setHiceCount(double hiceCount) {
      this.hiceCount = hiceCount;
   }

   public TourGrade() {
      
   }
   
   int getSpotNo() {
      return spotNo;
   }

   void setSpotNo(int spotNo) {
      this.spotNo = spotNo;
   }

   String getSpotName() {
      return spotName;
   }

   void setSpotName(String spotName) {
      this.spotName = spotName;
   }

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public int getNoDounor() {
      return noDounor;
   }

   public void setNoDounor(int noDounor) {
      this.noDounor = noDounor;
   }

   public int getNoSpot() {
      return noSpot;
   }

   public void setNoSpot(int noSpot) {
      this.noSpot = noSpot;
   }

   public int getHice() {
      return hice;
   }

   public void setHice(int hice) {
      this.hice = hice;
   }

   public int getNoTogether() {
      return noTogether;
   }

   public void setNoTogether(int noTogether) {
      this.noTogether = noTogether;
   }

   public String getPhotozon() {
      return photozon;
   }

   public void setPhotozon(String photozon) {
      this.photozon = photozon;
   }

   public String getFacility() {
      return facility;
   }

   public void setFacility(String facility) {
      this.facility = facility;
   }

   public String getTraffic() {
      return traffic;
   }

   public void setTraffic(String traffic) {
      this.traffic = traffic;
   }

   public String getWatch() {
      return watch;
   }

   public void setWatch(String watch) {
      this.watch = watch;
   }

   public String getAround() {
      return around;
   }

   public void setAround(String around) {
      this.around = around;
   }

   public Timestamp getRegdate() {
      return regdate;
   }

   public void setRegdate(Timestamp regdate) {
      this.regdate = regdate;
   }
   
   
   
}