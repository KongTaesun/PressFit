package kr.co.pressfit.dao;

import java.util.List;

import kr.co.pressfit.vo.CartVO;
import kr.co.pressfit.vo.TMouseVO;

public interface CartDAO {

	public void insert(CartVO vo) throws Exception;
	public List<CartVO> listCart(String userId) throws Exception;
	public void delete(int cart_id) throws Exception;
	public void modifyCart(CartVO vo) throws Exception;
	public int sumMoney(String userId) throws Exception;
	public int countCart(int productId, String userId) throws Exception;
	public void updateCart(CartVO vo) throws Exception;
	public void chkArr(CartVO vo) throws Exception;
	public void alldelete(String userId) throws Exception;
	public List<CartVO> order(List<String> chkArr) throws Exception;
	public List<CartVO> memberInfo(String id) throws Exception;
	public void amounttest(CartVO vo) throws Exception;
	public CartVO buy(CartVO vo) throws Exception;
	public int sumBuyMoney(String id)throws Exception;
}
