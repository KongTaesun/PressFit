package kr.co.pressfit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.service.MemberService;
import kr.co.pressfit.vo.MemberVO;

@Controller 
@RequestMapping("/login/*") 
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @Inject
    MemberService memberService;
    String folder = "login";
   
    @RequestMapping("login.do")
    public String login(){ 
    	logger.debug("LOGIN");
        return folder+"/login";   
    }
    
    @RequestMapping("loginCheck.do")
    public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session){
      
    	boolean result = memberService.loginCheck(vo, session);
        ModelAndView mav = new ModelAndView();
      
        if (result == true) { 

            mav.setViewName("../../index");  
            session.setAttribute("id", vo.getId());
            session.setAttribute("kind", "business");
 
             
        } else {    
        	
            mav.setViewName(folder+"/login");
            mav.addObject("msg", "failure"); 
        }
        return mav;
    }
    
  
    @RequestMapping("logout.do")
    public ModelAndView logout(HttpSession session){
        memberService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName(folder+"/login");
        mav.addObject("msg", "logout");
        return mav;
    }
    
    @RequestMapping("find.do")
    public String find(){ 
    	logger.debug("FIND");
        return folder+"/find";   
    } 
}

    
    

 