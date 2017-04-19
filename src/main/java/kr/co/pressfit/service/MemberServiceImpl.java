package kr.co.pressfit.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;

import kr.co.pressfit.dao.MemberDAO;
import kr.co.pressfit.vo.MemberVO;
 
@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class MemberServiceImpl implements MemberService {
    
    @Inject
    MemberDAO memberDao;
    
    // 01_01. 회원 로그인체크
    @Override
    public boolean loginCheck(MemberVO vo, HttpSession session) {
        boolean result = memberDao.loginCheck(vo);
        if (result) { // true일 경우 세션에 등록
            MemberVO vo2 = viewMember(vo);
            // 세션 변수 등록
            session.setAttribute("id", vo2.getId());
            session.setAttribute("name", vo2.getName());
        } 
        return result;
    }
    // 01_02. 회원 로그인 정보
    @Override
    public MemberVO viewMember(MemberVO vo) {
        return memberDao.viewMember(vo);
    }
    // 02. 회원 로그아웃
    @Override
    public void logout(HttpSession session) {
        // 세션 변수 개별 삭제
        // session.removeAttribute("userId");
        // 세션 정보를 초기화 시킴 
        session.invalidate();
    }
}
