package kr.co.pressfit.service;

import java.util.List;

import kr.co.pressfit.vo.MemberVO;


public interface JoinService {
	public List<MemberVO> memberList();
	public void insertMember(MemberVO vo);
	public MemberVO mypage(String id);
	public MemberVO updatepage(String id);
	
	
	public void deleteMember(String id);
	public void updateMember(MemberVO vo);

	public boolean checkPw(String id, String pw);
	
	public void addAttach(MemberVO vo);
}
