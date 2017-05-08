package kr.co.pressfit.vo;

import java.util.Arrays;
import java.util.Date;

public class GalleryVO {
	private int idx;
	private String title;
	private String subtitle;
	
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private String[] filelist;
	private String showdel;
	private int ref;
	private int turn;
	private int level;
	private int recnt; 
	private String fullName;
	private int TOTAL;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String[] getFilelist() {
		return filelist;
	}
	public void setFilelist(String[] filelist) {
		this.filelist = filelist;
	}
	public String getShowdel() {
		return showdel;
	}
	public void setShowdel(String showdel) {
		this.showdel = showdel;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getTOTAL() {
		return TOTAL;
	}
	public void setTOTAL(int tOTAL) {
		TOTAL = tOTAL;
	}
	@Override
	public String toString() {
		return "GalleryVO [idx=" + idx + ", title=" + title + ", subtitle=" + subtitle + ", content=" + content
				+ ", writer=" + writer + ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", filelist="
				+ Arrays.toString(filelist) + ", showdel=" + showdel + ", ref=" + ref + ", turn=" + turn + ", level="
				+ level + ", recnt=" + recnt + ", fullName=" + fullName + ", TOTAL=" + TOTAL + "]";
	} 


}
