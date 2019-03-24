package org.yolo.holo.vo;

import java.sql.Timestamp;

import java.text.SimpleDateFormat;


public class Review {
   private int no,noSpot,noDounor,noTogether,dounorNo,hice;
   private String contents,picRoute,name,profile,nickname,spotType,spotName;
   private Timestamp regdate;
   
   private String flavor,service,clean,feeling,cheap;
   
   public int getDounorNo() {
      return dounorNo;
   }


   
   public String getSpotName() {
      return spotName;
   }



   public void setSpotName(String spotName) {
      this.spotName = spotName;
   }



   public String getSpotType() {
      return spotType;
   }



   public void setSpotType(String spotType) {
      this.spotType = spotType;
   }



   public void setDounorNo(int dounorNo) {
      this.dounorNo = dounorNo;
   }


   public int getHice() {
      return hice;
   }


   public void setHice(int hice) {
      this.hice = hice;
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


   public Review() {
      
   }


   public String getNickname() {
      return nickname;
   }



   public void setNickname(String nickname) {
      this.nickname = nickname;
   }



   public String getName() {
      return name;
   }



   public void setName(String name) {
      this.name = name;
   }



   public String getProfile() {
      return profile;
   }



   public void setProfile(String profile) {
      this.profile = profile;
   }



   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public int getNoSpot() {
      return noSpot;
   }

   public void setNoSpot(int noSpot) {
      this.noSpot = noSpot;
   }

   public int getNoDounor() {
      return noDounor;
   }

   public void setNoDounor(int noDounor) {
      this.noDounor = noDounor;
   }

   public int getNoTogether() {
      return noTogether;
   }

   public void setNoTogether(int noTogether) {
      this.noTogether = noTogether;
   }

   public String getContents() {
      return contents;
   }

   public void setContents(String contents) {
      this.contents = contents;
   }

   public String getPicRoute() {
      return picRoute;
   }

   public void setPicRoute(String picRoute) {
      this.picRoute = picRoute;
   }

   public Timestamp getRegdate() {
      return regdate;
   }

   public void setRegdate(Timestamp regdate) {
      this.regdate = regdate;
   }
   
   // 수진 추가
   public String getFormatRegdate() {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
      if(regdate!=null) {
      return sdf.format(regdate);
      }else {
         return "";
      }
   }
   
   
}
   
   