package kr.co.pressfit.service;

import javax.servlet.http.HttpSession;

import kr.co.pressfit.vo.MemberVO;

 
public interface MemberService {
    // 01_01. 회원 로그인 체크
    public boolean loginCheck(MemberVO vo, HttpSession session);
    // 01_02. 회원 로그인 정보
    public MemberVO viewMember(MemberVO vo);
    // 02. 회원 로그아웃
    public void logout(HttpSession session);
}