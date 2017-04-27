package kr.co.pressfit.dao;

import java.util.List;

import kr.co.pressfit.vo.MemberVO;


public interface JoinDAO {
	public List<MemberVO> memberList();
	public void insertMember(MemberVO vo);
	public MemberVO viewMember(String id);
	public void deleteMember(String id);
	public void updateMember(MemberVO vo);
	//비밀번호 체크
	public boolean checkPw(String id, String pw);
	public MemberVO mypage(String id);
}

 




