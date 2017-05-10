package kr.co.pressfit.dao;

import java.util.List;
import java.util.Map;

import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CartVO;
import kr.co.pressfit.vo.GraphVO;
import kr.co.pressfit.vo.KeyboardVO;
import kr.co.pressfit.vo.TMouseVO;

 

public interface BusinessDAO {
	public List<BusinessVO> businessList();
	public void insertBusiness(BusinessVO vo);
	public BusinessVO viewBusiness(String id); 
	public void deleteBusiness(String id);
	public void updateBusiness(BusinessVO vo);
	//비밀번호 체크
	public boolean checkPw(String id, String pw);
	
	// 주문리스트
    public List<CartVO> orderList(String startDate, String endDate, String searchOption, String id) throws Exception;
	public int sumMoney(String id) throws Exception;
	
	public int countArticle(String searchOption, String keyword, String id) throws Exception;
	// 결제
	public void payment(List<String> List, String searchOption) throws Exception;
	
	public GraphVO mainGraphData(String id) throws Exception;
	public TMouseVO mouseRank(String id) throws Exception;
	public KeyboardVO keyboardRank(String id) throws Exception;
	public List<GraphVO> monthData(String id, String kind) throws Exception;
}

 




