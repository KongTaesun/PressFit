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

    // 1. 占쏙옙袂占쏙옙占� 占쌩곤옙
    @Override
    public void insert(CartVO vo) {
        sqlSession.insert("cart.insertCart", vo);
    }
    // 2. 占쏙옙袂占쏙옙占� 占쏙옙占�
    @Override
    public List<CartVO> listCart(String userId) {
        return sqlSession.selectList("cart.listCart", userId);
    }
    // 3. 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙
    @Override
    public void delete(int cart_id) {
    	System.out.println("DAO:"+cart_id);
        sqlSession.delete("cart.deleteCart", cart_id);
    }
    // 4. 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙
    @Override
    public void modifyCart(CartVO vo) { 
        sqlSession.update("cart.modifyCart", vo);
    }
    // 5. 占쏙옙袂占쏙옙占� 占쌥억옙 占쌌곤옙
    @Override
    public int sumMoney(String userId) {
        return sqlSession.selectOne("cart.sumMoney", userId);
    }
    // 6. 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙품 占쏙옙占쌘듸옙 확占쏙옙
    @Override
    public int countCart(int productId, String userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("productId", productId);
        map.put("userId", userId);
        return sqlSession.selectOne("cart.countCart", map);
    }
    // 7. 占쏙옙袂占쏙옙占� 占쏙옙품占쏙옙占쏙옙 占쏙옙占쏙옙
    @Override
    public void updateCart(CartVO vo) {
        sqlSession.update("cart.sumCart", vo);
    }
    // 8. 占쏙옙袂占쏙옙占� 체크
	@Override
	public void chkArr(List<String> List, String methodpayment) throws Exception {
		for(int i=0; i<List.size(); i++){
			Map<String, Object> map = new HashMap<String, Object>();
			String num = List.get(i);
			map.put("num", num);
			map.put("methodpayment", methodpayment);
			sqlSession.update("cart.payment", map);
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
	@Override
	public List<CartVO> memberInfo(String id) throws Exception {
		return sqlSession.selectList("cart.memberInfo", id);
	}
	
}