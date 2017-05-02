package kr.co.pressfit.dao;

import java.util.List;
import java.util.Map;

import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CartVO;

 

public interface BusinessDAO {
	public List<BusinessVO> businessList();
	public void insertBusiness(BusinessVO vo);
	public BusinessVO viewBusiness(String id); 
	public void deleteBusiness(String id);
	public void updateBusiness(BusinessVO vo);
	//비밀번호 체크
	public boolean checkPw(String id, String pw);
	
	// 주문리스트
	public List<CartVO> orderList(int start, int end, String searchOption, String id) throws Exception;
	public int sumMoney(String id) throws Exception;
	
	public int countArticle(String searchOption, String keyword, String id) throws Exception;
	// 결제
	public void payment(List<String> List, String searchOption) throws Exception;
}

 




