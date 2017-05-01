package kr.co.pressfit.vo;

import java.sql.Date;

public class MemberVO {
   private int idx; 
   private   String id;
   private   String pw;
   private   String name;
   private   int gender;
   private   int birth;
   private   String address;
   private   String hp;
   private   String email;
   private Date regdate; // java.sql.Date
   private Date updatedate;
   private int TOTAL;
   private int warn;
   private String cpicture;
   
   
   
   
   public String getCpicture() {
	return cpicture;
}
public void setCpicture(String cpicture) {
	this.cpicture = cpicture;
}
public int getWarn() {
      return warn;
   }
   public void setWarn(int warn) {
      this.warn = warn;
   }
   public int getTOTAL() {
      return TOTAL;
   }
   public void setTOTAL(int tOTAL) {
      TOTAL = tOTAL;
   } 
   
   
   public int getIdx() {
      return idx;
   }
   public void setIdx(int idx) {
      this.idx = idx;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public int getGender() {
      return gender;
   }
   public void setGender(int gender) {
      this.gender = gender;
   }
   public int getBirth() {
      return birth;
   }
   public void setBirth(int birth) {
      this.birth = birth;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getHp() {
      return hp; 
   }
   public void setHp(String hp) {
      this.hp = hp;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) { 
      this.email = email;
   }
   
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
   public Date getUpdatedate() {
      return updatedate;
   }
   public void setUpdatedate(Date updatedate) {
      this.updatedate = updatedate;
   }
@Override
public String toString() {
	return "MemberVO [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", birth="
			+ birth + ", address=" + address + ", hp=" + hp + ", email=" + email + ", regdate=" + regdate
			+ ", updatedate=" + updatedate + ", TOTAL=" + TOTAL + ", warn=" + warn + ", cpicture=" + cpicture + "]";
}
   
   
}