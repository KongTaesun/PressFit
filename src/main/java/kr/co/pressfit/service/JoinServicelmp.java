package kr.co.pressfit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.pressfit.dao.JoinDAO;
import kr.co.pressfit.dao.JoinDAOImpl;
import kr.co.pressfit.vo.MemberVO;

@Service
public class JoinServicelmp implements JoinService {

	
	@Inject 
JoinDAOImpl joinDao;


@Override
public List<MemberVO> memberList() {
	List<MemberVO> list=joinDao.memberList();
	String str=""; 
	for(MemberVO vo : list){
		str = vo.getId().replace("<", "&lt;");
		str = vo.getId().replace(">", "&gt;");
		vo.setId(str);
		str = vo.getPw().replace("<", "&lt;");
		str = vo.getPw().replace(">", "&gt;");
		vo.setPw(str); 
		str = vo.getName().replace("<", "&lt;");
		str = vo.getName().replace(">", "&gt;");
		vo.setName(str); 	 
		str = vo.getEmail().replace("<", "&lt;");
		str = vo.getEmail().replace(">", "&gt;");
		vo.setEmail(str);				
	}
	return list;
}
 
@Override
public void insertMember(MemberVO vo) {
	joinDao.insertMember(vo); 
}

@Override
public void deleteMember(String id) {
	joinDao.deleteMember(id);
}

@Override
public void updateMember(MemberVO vo) {
	joinDao.updateMember(vo); 
}

@Override
public boolean checkPw(String id, String pw) {
	return joinDao.checkPw(id, pw); 
}

@Override 
public MemberVO mypage(String id) {
	return joinDao.mypage(id); 
}
@Override 
public MemberVO updatepage(String id) {
	return joinDao.updatepage(id); 
}

@Override
public void addAttach(MemberVO vo) {
	joinDao.addAttach(vo);
}

}