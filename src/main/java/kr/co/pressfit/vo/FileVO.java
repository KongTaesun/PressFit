package kr.co.pressfit.vo;

import java.util.Date;

public class FileVO {
	private int idx;
	private String fullname;
	private Date regdate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "FileVO [idx=" + idx + ", fullname=" + fullname + ", regdate=" + regdate + "]";
	}
	
}