package kr.co.pressfit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

    @Inject
    SqlSession sqlSession;

    // 1. ��ٱ��� �߰�
    @Override
    public void insert(CartVO vo) {
        sqlSession.insert("cart.insertCart", vo);
    }
    // 2. ��ٱ��� ���
    @Override
    public List<CartVO> listCart(String userId) {
        return sqlSession.selectList("cart.listCart", userId);
    }
    // 3. ��ٱ��� ����
    @Override
    public void delete(int cart_id) {
    	System.out.println("DAO:"+cart_id);
        sqlSession.delete("cart.deleteCart", cart_id);
    }
    // 4. ��ٱ��� ����
    @Override
    public void modifyCart(CartVO vo) { 
        sqlSession.update("cart.modifyCart", vo);
    }
    // 5. ��ٱ��� �ݾ� �հ�
    @Override
    public int sumMoney(String userId) {
        return sqlSession.selectOne("cart.sumMoney", userId);
    }
    // 6. ��ٱ��� ������ ��ǰ ���ڵ� Ȯ��
    @Override
    public int countCart(int productId, String userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("productId", productId);
        map.put("userId", userId);
        return sqlSession.selectOne("cart.countCart", map);
    }
    // 7. ��ٱ��� ��ǰ���� ����
    @Override
    public void updateCart(CartVO vo) {
        sqlSession.update("cart.sumCart", vo);
    }
    // 8. ��ٱ��� üũ
	@Override
	public void chkArr(List<String> List) throws Exception {
		for(int i=0; i<List.size(); i++){
			System.out.println("DAO1:"+List.get(i));
			String num = List.get(i);
			sqlSession.update("cart.payment", num);
		}

	}
	@Override
	public void alldelete(String userId) throws Exception {
		sqlSession.delete("cart.alldeleteCart", userId);
	}
	@Override
	public List<CartVO> order(List<String> chkArr) throws Exception {
		/*String num = null;
		for(int i=0; i<chkArr.size(); i++){
			System.out.println("DAO1:"+chkArr.get(i));
			num = chkArr.get(i);
			sqlSession.selectOne("cart.order", num);
		}*/
		return sqlSession.selectList("cart.order", chkArr);
	}
}