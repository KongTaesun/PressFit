package kr.co.pressfit.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.CartVO;


@Repository
public class OrderDAOlmpl implements OrderDAO {

	
	@Inject
	SqlSession sqlSession;
	
	@Override
    public List<CartVO> orderList(String id) {
        return sqlSession.selectList("order.orderList", id);
    }
	
	@Override
	public List<CartVO> order(List<String> chkArr) throws Exception {
		return sqlSession.selectList("cart.order", chkArr);
	}
	@Override
	public List<CartVO> memberInfo(String id) throws Exception {
		return sqlSession.selectList("cart.memberInfo", id);
	}
}
