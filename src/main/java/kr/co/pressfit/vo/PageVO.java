package kr.co.pressfit.vo;

public class PageVO {

	private	int START; 
	private	int END;
	public int getSTART() {
		return START;
	}
	public void setSTART(int sTART) {
		START = sTART;
	}
	public int getEND() {
		return END;
	}
	public void setEND(int eND) {
		END = eND;
	}
	@Override
	public String toString() {
		return "PageVO [START=" + START + ", END=" + END + "]";
	}
}
