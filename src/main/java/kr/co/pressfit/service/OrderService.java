package kr.co.pressfit.service;

import java.util.List;

import kr.co.pressfit.vo.CartVO;

public interface OrderService {

	public List<CartVO> orderList(String id) throws Exception;
}
