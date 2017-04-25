package kr.co.pressfit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.pressfit.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

    @Inject
    SqlSession sqlSession;

    @Override
    public void insert(CartVO vo) {
        sqlSession.insert("cart.insertCart", vo);
    }
   
    @Override
    public List<CartVO> listCart(String userId) {
        return sqlSession.selectList("cart.listCart", userId);
    }
   
    @Override
    public void delete(int cart_id) {
    	System.out.println("DAO:"+cart_id);
        sqlSession.delete("cart.deleteCart", cart_id);
    }
    
    @Override
    public void modifyCart(CartVO vo) { 
        sqlSession.update("cart.modifyCart", vo);
    }
    
    @Override
    public int sumMoney(String userId) {
        return sqlSession.selectOne("cart.sumMoney", userId);
    }
    
    @Override
    public int countCart(int productId, String userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("productId", productId);
        map.put("userId", userId);
        return sqlSession.selectOne("cart.countCart", map);
    }
    
    @Override
    public void updateCart(CartVO vo) {
        sqlSession.update("cart.sumCart", vo);
    }
  
    @Transactional
	@Override
	public void chkArr(List<String> List, String methodpayment, List<Integer> amountList, int idx) throws Exception {
    	System.out.println("DAO");
    	System.out.println(List);
    	System.out.println(methodpayment);
    	System.out.println(amountList);
    	System.out.println(idx);
    	
    	for(int i=0; i<List.size(); i++){
			Map<String, Object> map = new HashMap<String, Object>();
			String num = List.get(i);
			int amount = amountList.get(i);
			map.put("num", num);
			map.put("methodpayment", methodpayment);
			map.put("amount", amount);
			map.put("idx", idx);
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