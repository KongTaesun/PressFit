package kr.co.pressfit.dao;

import java.util.List;

import kr.co.pressfit.vo.CartVO;

public interface OrderDAO {

	
	public List<CartVO> orderList(String id) throws Exception;
}
