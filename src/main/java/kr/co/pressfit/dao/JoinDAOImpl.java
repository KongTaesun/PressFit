package kr.co.pressfit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.MemberVO;


//현재 클래스를 dao bean으로 등록시킴
@Repository  
public class JoinDAOImpl implements JoinDAO {

	// SqlSession 객체를 스프링에서 생성하여 주입시켜 줌
	// 의존관계 주입(Dependency Injection, DI)
	// 느슨한 결합
	// IoC(Inversion of Control, 제어의 역전)
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberVO> memberList() {
	  return sqlSession.selectList("join.memberList");
	}
// commit(), close() 할 필요가 없음
	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert("join.insertMember", vo);
	}

	@Override
	public MemberVO viewMember(String id) {
		return sqlSession.selectOne("join.viewMember" , id);
	}

	@Override
	public void deleteMember(String id) {
		sqlSession.delete("join.deleteMember", id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update("join.updateMember", vo);
	}
	@Override
	public boolean checkPw(String id, String pw){
		boolean result=false;
		Map<String,String> map=
				new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		int count= 
			sqlSession.selectOne("join.checkPw",map);
		if(count==1) result=true;
		return result;
	}

} 







