package kr.co.pressfit.vo;

import java.sql.Date;

public class BusinessVO {

	private int idx; 
	private	String id; 
	private	String pw;
	private	String name;
	private	int gender;
	private	int birth; 
	private	String address;
	private	String hp;
	private	String email; 
	private Date regdate;
	private Date updatedate;
	private	String companyname;
	private	int companytp;
	private	String representative;
	private	String corporateregistrationnumber;
	private	String typeofbusiness;
	private	String itemsofbusiness;
	private	String companyaddress;
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
	@Override
	public String toString() {
		return "BusinessVO [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender
				+ ", birth=" + birth + ", address=" + address + ", hp=" + hp + ", email=" + email + ", regdate="
				+ regdate + ", updatedate=" + updatedate + ", companyname=" + companyname + ", companytp=" + companytp
				+ ", representative=" + representative + ", corporateregistrationnumber=" + corporateregistrationnumber
				+ ", typeofbusiness=" + typeofbusiness + ", itemsofbusiness=" + itemsofbusiness + ", companyaddress="
				+ companyaddress + "]";
	}
}
