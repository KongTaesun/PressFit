package kr.co.pressfit.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;

import kr.co.pressfit.dao.BusinessjoinDAO;
import kr.co.pressfit.vo.BusinessVO;

 
@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class BusinessjoinServiceImpl implements BusinessjoinService {
    
    @Inject
    BusinessjoinDAO businessjoinDao; 
    
    // 01_01. 회원 로그인체크
    @Override
    public boolean businessloginCheck(BusinessVO vo, HttpSession session) {
        boolean result = businessjoinDao.businessloginCheck(vo);
        if (result) { // true일 경우 세션에 등록
        	BusinessVO vo2 = businessviewMember(vo);
            // 세션 변수 등록
            session.setAttribute("id", vo2.getId());
            session.setAttribute("name", vo2.getName());
        } 
        return result;
    }
    // 01_02. 회원 로그인 정보  
    @Override
    public BusinessVO businessviewMember(BusinessVO vo) {
        return businessjoinDao.businessviewMember(vo);
    }
    // 02. 회원 로그아웃  
    @Override
    public void businesslogout(HttpSession session) {
        // 세션 변수 개별 삭제
        // session.removeAttribute("userId");
        // 세션 정보를 초기화 시킴 
        session.invalidate();
    }
}
