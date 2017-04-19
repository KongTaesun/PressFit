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

    // 1. ��ٱ��� �߰�
    @Override
    public void insert(CartVO vo) throws Exception {
        cartDao.insert(vo);
    }
    // 2. ��ٱ��� ���
    @Override
    public List<CartVO> listCart(String id) throws Exception {
        return cartDao.listCart(id);
    }
    // 3. ��ٱ��� ����
    @Override
    public void delete(int cart_id) throws Exception {
    	System.out.println("����"+cart_id);
        cartDao.delete(cart_id);
    }
    // 4. ��ٱ��� ����
    @Override
    public void modifyCart(CartVO vo) throws Exception {
        cartDao.modifyCart(vo);
    }
    // 5. ��ٱ��� �ݾ� �հ�
    @Override
    public int sumMoney(String userId) throws Exception {
        return cartDao.sumMoney(userId);
    }
    // 6. ��ٱ��� ��ǰ Ȯ��
    @Override
    public int countCart(int idx, String userId) throws Exception {
        return cartDao.countCart(idx, userId);
    }
    // 7. ��ٱ��� ��ǰ ���� ����
    @Override
    public void updateCart(CartVO vo) throws Exception {
        cartDao.updateCart(vo);
    }
    // 8.
	@Override
	public void chkArr(List<String> List) throws Exception {
		System.out.println("��������"+List);
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
		System.out.println("서비스"+chkArr);
		return cartDao.order(chkArr);
		
	}
	
	
}

