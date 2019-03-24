package org.yolo.holo.vo;

import java.sql.Timestamp;

public class FoodGrade {
   private int no,noDounor,noSpot,hice,noTogether,spotNo,noReview;
   private String flavor,service,clean,feeling,cheap,togetherGood,spotName;
   private Timestamp regdate;
   
   // 추가
   private double noDounorCount,cleanCount,flavorCount,serviceCount,feelingCount,togetherGoodCount,cheapCount;
   private double hiceCount;
   
   public FoodGrade() {
      
   }

   
   public int getNoReview() {
      return noReview;
   }


   public void setNoReview(int noReview) {
      this.noReview = noReview;
   }


   public int getNoSpot() {
      return noSpot;
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

   public int getNoSpo0t() {
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

   public int getSpotNo() {
      return spotNo;
   }

   public void setSpotNo(int spotNo) {
      this.spotNo = spotNo;
   }

   public String getFlavor() {
      return flavor;
   }

   public void setFlavor(String flavor) {
      this.flavor = flavor;
   }

   public String getService() {
      return service;
   }

   public void setService(String service) {
      this.service = service;
   }

   public String getClean() {
      return clean;
   }

   public void setClean(String clean) {
      this.clean = clean;
   }

   public String getFeeling() {
      return feeling;
   }

   public void setFeeling(String feeling) {
      this.feeling = feeling;
   }

   public String getCheap() {
      return cheap;
   }

   public void setCheap(String cheap) {
      this.cheap = cheap;
   }

   public String getTogetherGood() {
      return togetherGood;
   }

   public void setTogetherGood(String togetherGood) {
      this.togetherGood = togetherGood;
   }

   public String getSpotName() {
      return spotName;
   }

   public void setSpotName(String spotName) {
      this.spotName = spotName;
   }

   public Timestamp getRegdate() {
      return regdate;
   }

   public void setRegdate(Timestamp regdate) {
      this.regdate = regdate;
   }

   public double getNoDounorCount() {
      return noDounorCount;
   }

   public void setNoDounorCount(double noDounorCount) {
      this.noDounorCount = noDounorCount;
   }

   public double getCleanCount() {
      if(this.cleanCount==0) {
         return 0;
      }else {
         return cleanCount/getNoDounorCount()*100;
      }
   }

   public void setCleanCount(double cleanCount) {
      this.cleanCount = cleanCount;
   }

   public double getFlavorCount() {
      if(this.flavorCount==0) {
         return 0;
      }else {
         return flavorCount/getNoDounorCount()*100;
      }
   }

   public void setFlavorCount(double flavorCount) {
      this.flavorCount = flavorCount;
   }

   public double getServiceCount() {
      if(this.serviceCount==0) {
         return 0;
      }else {
         return serviceCount/getNoDounorCount()*100;
      }
   }

   public void setServiceCount(double serviceCount) {
      this.serviceCount = serviceCount;
   }

   public double getFeelingCount() {
      if(this.feelingCount==0) {
         return 0;
      }else {
         return feelingCount/getNoDounorCount()*100;
      }
   }

   public void setFeelingCount(double feelingCount) {
      this.feelingCount = feelingCount;
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

   public double getCheapCount() {
      if(this.cheapCount==0) {
         return 0;
      }else {
         return cheapCount/getNoDounorCount()*100;
      }
   }

   public void setCheapCount(double cheapCount) {
      this.cheapCount = cheapCount;
   }

   public double getHiceCount() {
      return hiceCount;
   }

   public void setHiceCount(double hiceCount) {
      this.hiceCount = hiceCount;
   }
   
   
   
}