package kr.co.pressfit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.pressfit.dao.CartDAO;
import kr.co.pressfit.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
    CartDAO cartDao;

    @Override
    public void insert(CartVO vo) throws Exception {
        cartDao.insert(vo);
    }
    @Override
    public List<CartVO> listCart(String id) throws Exception {
        return cartDao.listCart(id);
    }
    @Override
    public void delete(int cart_id) throws Exception {
         cartDao.delete(cart_id);
    }
    @Override
    public void modifyCart(CartVO vo) throws Exception {
        cartDao.modifyCart(vo);
    }
    @Override
    public int sumMoney(String userId) throws Exception {
        return cartDao.sumMoney(userId);
    }
    @Override
    public int countCart(int idx, String userId) throws Exception {
        return cartDao.countCart(idx, userId);
    }
    @Override
    public void updateCart(CartVO vo) throws Exception {
        cartDao.updateCart(vo);
    }
    @Override
	public void chkArr(CartVO vo) throws Exception {
		cartDao.chkArr(vo);
	}
	
	@Override
	public void alldelete(String userId) throws Exception {
		cartDao.alldelete(userId);
	}
	
	@Override
	public List<CartVO> order(List<String> chkArr) throws Exception {
		return cartDao.order(chkArr);
	}
	@Override
	public List<CartVO> memberInfo(String id) throws Exception {

		return cartDao.memberInfo(id);
	}
	@Override
	public void amounttest(CartVO vo) throws Exception {
		cartDao.amounttest(vo);
	}
	
	
}

