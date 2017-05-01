package kr.co.pressfit.vo;

public class LoggerVO {

	private	int idx;
	private	String ip;
	private	String start;
	private	float processtime;
	private	int login;
	private	String id;
	private	String kind;
	private	String end;
	private	String uri;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public float getProcesstime() {
		return processtime;
	}
	public void setProcesstime(float processtime) {
		this.processtime = processtime;
	}
	public int getLogin() {
		return login;
	}
	public void setLogin(int login) {
		this.login = login;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	@Override
	public String toString() {
		return "LoggerVO [idx=" + idx + ", ip=" + ip + ", start=" + start + ", processtime=" + processtime + ", login="
				+ login + ", id=" + id + ", kind=" + kind + ", end=" + end + ", uri=" + uri + "]";
	}
	
}
