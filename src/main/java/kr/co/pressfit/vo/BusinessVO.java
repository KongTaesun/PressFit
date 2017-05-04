package kr.co.pressfit.vo;

import java.sql.Date;

public class BusinessVO {

	private int idx; 
	private	String id; 
	private	String pw;
	private	String name;
	private	int gender;
	private	int birth; 

	private	String hp;
	private	String email; 
	private Date regdate;
	private Date updatedate;
	private	String basic_addr;
	private	String detail_addr;
	private	String post;
	
	private	String companyname;
	private	int companytp;
	private	String representative;
	private	String corporateregistrationnumber;
	private	String typeofbusiness;
	private	String itemsofbusiness;
	private	String companyaddress;
	private	int warn;
	private int TOTAL;
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
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public int getCompanytp() {
		return companytp;
	}
	public void setCompanytp(int companytp) {
		this.companytp = companytp;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getCorporateregistrationnumber() {
		return corporateregistrationnumber;
	}
	public void setCorporateregistrationnumber(String corporateregistrationnumber) {
		this.corporateregistrationnumber = corporateregistrationnumber;
	}
	public String getTypeofbusiness() {
		return typeofbusiness;
	}
	public void setTypeofbusiness(String typeofbusiness) {
		this.typeofbusiness = typeofbusiness;
	}
	public String getItemsofbusiness() {
		return itemsofbusiness;
	}
	public void setItemsofbusiness(String itemsofbusiness) {
		this.itemsofbusiness = itemsofbusiness;
	}
	public String getCompanyaddress() {
		return companyaddress;
	}
	public void setCompanyaddress(String companyaddress) {
		this.companyaddress = companyaddress;
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
	@Override
	public String toString() {
		return "BusinessVO [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender
				+ ", birth=" + birth + ", hp=" + hp + ", email=" + email + ", regdate=" + regdate + ", updatedate="
				+ updatedate + ", basic_addr=" + basic_addr + ", detail_addr=" + detail_addr + ", post=" + post
				+ ", companyname=" + companyname + ", companytp=" + companytp + ", representative=" + representative
				+ ", corporateregistrationnumber=" + corporateregistrationnumber + ", typeofbusiness=" + typeofbusiness
				+ ", itemsofbusiness=" + itemsofbusiness + ", companyaddress=" + companyaddress + ", warn=" + warn
				+ ", TOTAL=" + TOTAL + "]";
	}
	
}
