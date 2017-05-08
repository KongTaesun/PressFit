package kr.co.pressfit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.FileVO;
import kr.co.pressfit.vo.MemberVO;


//�쁽�옱 �겢�옒�뒪瑜� dao bean�쑝濡� �벑濡앹떆�궡
@Repository  
public class JoinDAOImpl implements JoinDAO {

	// SqlSession 媛앹껜瑜� �뒪�봽留곸뿉�꽌 �깮�꽦�븯�뿬 二쇱엯�떆耳� 以�
	// �쓽議닿�怨� 二쇱엯(Dependency Injection, DI)
	// �뒓�뒯�븳 寃고빀
	// IoC(Inversion of Control, �젣�뼱�쓽 �뿭�쟾)
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberVO> memberList() {
	  return sqlSession.selectList("join.memberList");
	}
// commit(), close() �븷 �븘�슂媛� �뾾�쓬
	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert("join.insertMember", vo);
	}
	@Override
	public MemberVO mypage(String id) {
		return sqlSession.selectOne("join.mypage" , id);
	}
	@Override
	public MemberVO updatepage(String id) {
		return sqlSession.selectOne("join.updatepage" , id);
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
	 @Override 
	    public void addAttach(MemberVO vo) {
	    	sqlSession.update("join.addAttach", vo);
	    }
	 
	
} 




 


