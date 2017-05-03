package kr.co.pressfit.vo;

import java.sql.Date;

public class MemberVO {
	
	private int idx;
	private String id;
	private String pw;
	private String name;
	private int gender;
	private int birth;
	private int post;
	private String basic_addr;
	private String detail_addr;
	private String hp;
	private String email;
	private Date regdate; // java.sql.Date
	private Date updatedate;
	private String cpicture;
	private int TOTAL;
	private int warn; 
	
	 
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
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public String getBasic_addr() {
		return basic_addr;
	}
	public void setBasic_addr(String basic_addr) {
		this.basic_addr = basic_addr;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
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
	public String getCpicture() {
		return cpicture;
	}
	public void setCpicture(String cpicture) {
		this.cpicture = cpicture;
	}
	public int getTOTAL() {
		return TOTAL; 
	}
	public void setTOTAL(int tOTAL) {
		TOTAL = tOTAL;
	}
	public int getWarn() {
		return warn;
	}
	public void setWarn(int warn) {
		this.warn = warn;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender
				+ ", birth=" + birth + ", post=" + post + ", basic_addr=" + basic_addr + ", detail_addr=" + detail_addr
				+ ", hp=" + hp + ", email=" + email + ", regdate=" + regdate + ", updatedate=" + updatedate
				+ ", cpicture=" + cpicture + ", TOTAL=" + TOTAL + ", warn=" + warn + "]";
	}
	
}