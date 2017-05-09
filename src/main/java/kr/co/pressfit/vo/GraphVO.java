package kr.co.pressfit.vo;

public class GraphVO {

	private	int mAmount;		// 마우스 재고량 
	private	int mSalesAmount;	// 마우스 판매량
	private	int mSalesTotal;	// 마우스 매출액
	private	int kAmount; 		// 키보드 재고량
	private	int kSalesAmount;	// 키보드 판매량
	private	int kSalesTotal;	// 키보드 매출액
	
	public int getmAmount() {
		return mAmount;
	}
	public void setmAmount(int mAmount) {
		this.mAmount = mAmount;
	}
	public int getmSalesAmount() {
		return mSalesAmount;
	}
	public void setmSalesAmount(int mSalesAmount) {
		this.mSalesAmount = mSalesAmount;
	}
	public int getmSalesTotal() {
		return mSalesTotal;
	}
	public void setmSalesTotal(int mSalesTotal) {
		this.mSalesTotal = mSalesTotal;
	}
	public int getkAmount() {
		return kAmount;
	}
	public void setkAmount(int kAmount) {
		this.kAmount = kAmount;
	}
	public int getkSalesAmount() {
		return kSalesAmount;
	}
	public void setkSalesAmount(int kSalesAmount) {
		this.kSalesAmount = kSalesAmount;
	}
	public int getkSalesTotal() {
		return kSalesTotal;
	}
	public void setkSalesTotal(int kSalesTotal) {
		this.kSalesTotal = kSalesTotal;
	}
	
	@Override
	public String toString() {
		return "GraphVO [mAmount=" + mAmount + ", mSalesAmount=" + mSalesAmount + ", mSalesTotal=" + mSalesTotal
				+ ", kAmount=" + kAmount + ", kSalesAmount=" + kSalesAmount + ", kSalesTotal=" + kSalesTotal + "]";
	}
}
	
	
	
	