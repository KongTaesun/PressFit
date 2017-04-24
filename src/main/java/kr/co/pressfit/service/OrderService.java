package kr.co.pressfit.service;

import java.util.List;

import kr.co.pressfit.vo.CartVO;

public interface OrderService {

	public List<CartVO> orderList(String id) throws Exception;
	public List<CartVO> order(List<String> chkArr) throws Exception;
	public List<CartVO> memberInfo(String id)throws Exception;
}
