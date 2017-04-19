package kr.co.pressfit.dao;

import javax.servlet.http.HttpSession;

import kr.co.pressfit.vo.BusinessVO;

 
public interface BusinessjoinDAO {
    // 01_01. 회원 로그인 체크
    public boolean businessloginCheck(BusinessVO vo);
    // 01_02. 회원 로그인 정보
    public BusinessVO businessviewMember(BusinessVO vo);
    // 02. 회원 로그아웃
    public void businesslogout(HttpSession session);
}
