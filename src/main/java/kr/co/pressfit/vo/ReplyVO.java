package kr.co.pressfit.vo;

import java.util.Date;

public class ReplyVO {
	private int idx;
	private int boardno;
	private String replytext;
	private String replayer;
	private Date regdate;
	private String secret_reply;
	private String showdel;
	private int ref;
	private int turn;
	private int level;
	private String cpicture;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplayer() {
		return replayer;
	}
	public void setReplayer(String replayer) {
		this.replayer = replayer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getSecret_reply() {
		return secret_reply;
	}
	public void setSecret_reply(String secret_reply) {
		this.secret_reply = secret_reply;
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
	public String getCpicture() {
		return cpicture;
	}
	public void setCpicture(String cpicture) {
		this.cpicture = cpicture;
	}
	@Override
	public String toString() {
		return "ReplyVO [idx=" + idx + ", boardno=" + boardno + ", replytext=" + replytext + ", replayer=" + replayer
				+ ", regdate=" + regdate + ", secret_reply=" + secret_reply + ", showdel=" + showdel + ", ref=" + ref
				+ ", turn=" + turn + ", level=" + level + ", cpicture=" + cpicture + "]";
	}
	
	
	
 }