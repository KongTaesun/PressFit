package kr.co.pressfit.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.pressfit.service.JoinService;
import kr.co.pressfit.vo.MemberVO;

 
@Controller  //현재 클래스를 controller bean으로 등록시킴
public class JoinController {
	//import org.slf4j.Logger;
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
// MemberService 객체를 스프링에서 생성하여 주입시킴
	@Inject  
	JoinService joinService;
	
// url pattern mapping	
	@RequestMapping("member/list.do")
	public String memberList(Model model){
// Controller => Service => DAO 요청		
		List<MemberVO> list=joinService.memberList();
		model.addAttribute("list", list); 
		return "member/member_list";
	}
	//회원등록폼으로 이동
	@RequestMapping("member/write.do")
	public String write(){
		return "member/write";
	}
// @ModelAttribute 에 폼에서 입력한 데이터가 저장됨	 
	//insert 처리
	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberVO vo){
		// 테이블에 레코드를 입력
		joinService.insertMember(vo);
		// member_list.jsp로 리디렉트
//   /member/list.do 루트 디렉토리 기준
//   member/list.do  현재 디렉토리 기준
		return "redirect:/member/list.do"; 
	}	
	 
	@RequestMapping("member/view.do")
	public String view(@RequestParam  String id, Model model){
		//System.out.println("클릭한 아이디:"+userid);
// info, debug, warn, error 		
		logger.info("클릭한 아이디:"+id);
		// 회원정보를 모델에 저장
		model.addAttribute("vo"
				, joinService.viewMember(id));
		// view.jsp로 포워딩
		return "member/view";
	}
	@RequestMapping("member/update.do") 
	public String update(@ModelAttribute MemberVO vo, Model model){
		System.out.println(vo);
		//비밀번호 체크
		boolean result=joinService.checkPw("member1","1234");
		if(result){
			joinService.updateMember(vo);
			return "redirect:/member/list.do";  
		}else{
			//가입일자,수정날짜
			MemberVO vo2 = joinService.viewMember(
					vo.getId());
			vo.setRegdate(vo2.getRegdate());
			vo.setUpdatedate(vo2.getUpdatedate());
			
			model.addAttribute("vo",vo);
			model.addAttribute("message"
					,"비밀번호가 일치하지 않습니다.");
			return "member/view"; 
		}
	}
	
	 
	
// 	@RequestMapping : url mapping
//  @RequestParam : get or post 방식으로 전달된 변수값	
	@RequestMapping("member/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pw, Model model){ 
		//비밀번호 체크
		boolean result = joinService.checkPw(id,pw);
		if(result){
			//삭제 처리
			joinService.deleteMember(id);
			//회원 목록으로 이동
			return "redirect:/member/list.do";
		}else{
			//비번이 틀렸을 때
			model.addAttribute("message","비밀번호가 일치하지 않습니다.");
			model.addAttribute("vo", joinService.viewMember(id)); 
			// view.jsp로 포워드
			return "member/view"; 
		}		
		
	}
	
	@RequestMapping("member/mypage.do")
	public String mypage(@RequestParam  String id, Model model){
		
		logger.info("클릭한 아이디:"+id);
		model.addAttribute("vo", joinService.mypage(id));
		
		return "member/mypage";
	}
}















