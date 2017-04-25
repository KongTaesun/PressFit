package kr.co.pressfit.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.pressfit.dao.OrderDAOlmpl;
import kr.co.pressfit.vo.CartVO;

@Service
public class OrderServicelmp implements OrderService{
	
	@Inject
	OrderDAOlmpl OrderDao;
	

	@Override
    public List<CartVO> orderList(String id) throws Exception {
        return OrderDao.orderList(id);
    }
	@Override
	public List<CartVO> order(List<String> chkArr) throws Exception {
		return OrderDao.order(chkArr);
	}
	@Override
	public List<CartVO> memberInfo(String id) throws Exception {

		return OrderDao.memberInfo(id);
	}
	@Override 
	public List<CartVO> orderCancel(CartVO vo) throws Exception {
		
		return null;
	}
	@Override 
	public List<CartVO> orderConfirm(Map<String, Object> list) throws Exception {
		
		return OrderDao.orderConfirm(list); 
	}
}
 