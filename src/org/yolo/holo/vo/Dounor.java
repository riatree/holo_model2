package org.yolo.holo.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Dounor {

   private int no,pink,green,red,chco,orange,blue,white,yellow; 
   private String name,gender,id,pwd,nickname,email,phone,profile,blacklist;
   private Date birthDate;
   private Timestamp regdate;
   
   public Dounor() {
      
   }
   
   
   public Dounor(int no, int pink, int green, int red, int chco, int orange, int blue, int white, int yellow, String profile, String nickname
         ) {
      super();
      this.no = no;
      this.pink = pink;
      this.green = green;
      this.red = red;
      this.chco = chco;
      this.orange = orange;
      this.blue = blue;
      this.white = white;
      this.yellow = yellow;
      this.nickname = nickname;
      this.profile = profile;
   }




   public Dounor(String id, String pwd) {
      super();
      this.id = id;
      this.pwd = pwd;
   }



   public Dounor(String id, String nickname, String pwd, String gender, Date birthDate, String email, String phone, String name, String profile, String blacklist ) {
      super();
      this.name = name;
      this.gender = gender;
      this.id = id;
      this.pwd = pwd;
      this.nickname = nickname;
      this.email = email;
      this.phone = phone;
      this.profile = profile;
      this.blacklist = blacklist;
      this.birthDate = birthDate;
   }


   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public String getNickname() {
      return nickname;
   }

   public void setNickname(String nickname) {
      this.nickname = nickname;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getProfile() {
      return profile;
   }

   public void setProfile(String profile) {
      this.profile = profile;
   }

   public String getBlacklist() {
      return blacklist;
   }

   public void setBlacklist(String blacklist) {
      this.blacklist = blacklist;
   }

   public Date getBirthDate() {
      return birthDate;
   }

   public void setBirthDate(Date birthDate) {
      this.birthDate = birthDate;
   }

   public Timestamp getRegdate() {
      return regdate;
   }

   public void setRegdate(Timestamp regdate) {
      this.regdate = regdate;
   }
   public int getPink() {
      return pink;
   }



   public void setPink(int pink) {
      this.pink = pink;
   }



   public int getGreen() {
      return green;
   }



   public void setGreen(int green) {
      this.green = green;
   }



   public int getRed() {
      return red;
   }



   public void setRed(int red) {
      this.red = red;
   }



   public int getChco() {
      return chco;
   }



   public void setChco(int chco) {
      this.chco = chco;
   }



   public int getOrange() {
      return orange;
   }



   public void setOrange(int orange) {
      this.orange = orange;
   }



   public int getBlue() {
      return blue;
   }



   public void setBlue(int blue) {
      this.blue = blue;
   }



   public int getWhite() {
      return white;
   }



   public void setWhite(int white) {
      this.white = white;
   }



   public int getYellow() {
      return yellow;
   }



   public void setYellow(int yellow) {
      this.yellow = yellow;
   }

   
   
   
   
}