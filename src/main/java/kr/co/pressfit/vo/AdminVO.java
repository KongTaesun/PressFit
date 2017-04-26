package kr.co.pressfit.vo;

public class AdminVO {

	private	String id; 
	private	String pw;
	private	String pw2;
	private	String level;
	private int TOTAL;
	
	public int getTOTAL() {
		return TOTAL;
	}
	public void setTOTAL(int tOTAL) {
		TOTAL = tOTAL;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
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
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	@Override
	public String toString() {
		return "AdminVO [id=" + id + ", pw=" + pw + ", pw2=" + pw2 + ", level=" + level + ", TOTAL=" + TOTAL + "]";
	}
	
}
