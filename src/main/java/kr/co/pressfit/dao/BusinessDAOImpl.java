package kr.co.pressfit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CartVO;


 
//현재 클래스를 dao bean으로 등록시킴
@Repository  
public class BusinessDAOImpl implements BusinessDAO {

	// SqlSession 객체를 스프링에서 생성하여 주입시켜 줌
	// 의존관계 주입(Dependency Injection, DI)
	// 느슨한 결합
	// IoC(Inversion of Control, 제어의 역전)
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BusinessVO> businessList() {
	  return sqlSession.selectList("business.businessList");
	}
// commit(), close() 할 필요가 없음
	@Override
	public void insertBusiness(BusinessVO vo) {  
		sqlSession.insert("business.insertBusiness", vo);
	}

	@Override
	public BusinessVO viewBusiness(String id) {
		System.out.println("dao"+id);
		return sqlSession.selectOne("business.viewBusiness", id);
	}

	@Override
	public void deleteBusiness(String id) {
		sqlSession.delete("business.deleteBusiness", id);
	}
 
	@Override
	public void updateBusiness(BusinessVO vo) {
		sqlSession.update("business.updateBusiness", vo);
	}
	@Override
	public boolean checkPw(String id, String pw){
		boolean result=false;
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		int count=
			sqlSession.selectOne("business.checkPw",map);
		if(count==1) result=true;
		return result;
	}
	
	@Override
    public List<CartVO> orderList(String id) {
        return sqlSession.selectList("business.orderList", id);
    }
    // 5. ��ٱ��� �ݾ� �հ�
    @Override
    public int sumMoney(String id) {
        return sqlSession.selectOne("business.sumMoney", id);
    }
    // 결제
    @Override
	public List<CartVO> payment(List<String> chkArr) throws Exception {
		return sqlSession.selectList("business.payment", chkArr);
	}
}







