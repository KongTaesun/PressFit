package kr.co.pressfit.service;

import java.util.List;


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
}
 