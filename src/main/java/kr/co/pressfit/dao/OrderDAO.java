package kr.co.pressfit.dao;

import java.util.List;
import java.util.Map;

import kr.co.pressfit.vo.CartVO;

public interface OrderDAO {

	
	public List<CartVO> orderList(String id) throws Exception;
	public List<CartVO> order(List<String> chkArr) throws Exception;
	public List<CartVO> memberInfo(String id) throws Exception;
	public List<CartVO> orderCancel(String id) throws Exception;
	public List<CartVO> orderConfirm(Map<String, Object> list) throws Exception;
	
	
}
