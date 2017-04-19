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

    // 1. 占쏙옙袂占쏙옙占� 占쌩곤옙
    @Override
    public void insert(CartVO vo) throws Exception {
        cartDao.insert(vo);
    }
    // 2. 占쏙옙袂占쏙옙占� 占쏙옙占�
    @Override
    public List<CartVO> listCart(String id) throws Exception {
        return cartDao.listCart(id);
    }
    // 3. 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙
    @Override
    public void delete(int cart_id) throws Exception {
    	System.out.println("占쏙옙占쏙옙"+cart_id);
        cartDao.delete(cart_id);
    }
    // 4. 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙
    @Override
    public void modifyCart(CartVO vo) throws Exception {
        cartDao.modifyCart(vo);
    }
    // 5. 占쏙옙袂占쏙옙占� 占쌥억옙 占쌌곤옙
    @Override
    public int sumMoney(String userId) throws Exception {
        return cartDao.sumMoney(userId);
    }
    // 6. 占쏙옙袂占쏙옙占� 占쏙옙품 확占쏙옙
    @Override
    public int countCart(int idx, String userId) throws Exception {
        return cartDao.countCart(idx, userId);
    }
    // 7. 占쏙옙袂占쏙옙占� 占쏙옙품 占쏙옙占쏙옙 占쏙옙占쏙옙
    @Override
    public void updateCart(CartVO vo) throws Exception {
        cartDao.updateCart(vo);
    }
    // 8.
	@Override
	public void chkArr(List<String> List) throws Exception {
		System.out.println("占쏙옙占쏙옙占쏙옙占쏙옙"+List);
		cartDao.chkArr(List);
	}
	// 9.
	@Override
	public void alldelete(String userId) throws Exception {
		cartDao.alldelete(userId);
	}
	// 10.
	@Override
	public List<CartVO> order(List<String> chkArr) throws Exception {
		System.out.println("�꽌鍮꾩뒪"+chkArr);
		return cartDao.order(chkArr);
	}
	@Override
	public List<CartVO> memberInfo(String id) throws Exception {

		return cartDao.memberInfo(id);
	}
	
	
	
	
}

