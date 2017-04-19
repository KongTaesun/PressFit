package kr.co.pressfit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.service.BusinessjoinService;
import kr.co.pressfit.vo.BusinessVO;


@Controller 
@RequestMapping("/business/*") 
public class BusinessjoinController {

    private static final Logger logger = LoggerFactory.getLogger(BusinessjoinController.class);
    
    @Inject
    BusinessjoinService businessjoinService;
    String folder = "business";
   
    @RequestMapping("businesslogin.do") 
    public String login(){ 
    	logger.debug("LOGIN");
        return "login/login";  
    } 
    
    @RequestMapping("businessloginCheck.do")
    public ModelAndView loginCheck(@ModelAttribute BusinessVO vo, HttpSession session){
        boolean result = businessjoinService.businessloginCheck(vo, session);
        ModelAndView mav = new ModelAndView();
      
        if (result == true) { 
            mav.setViewName("login/login");
            session.setAttribute("id", vo.getId());

            session.setAttribute("kind", "business");
            mav.addObject("msg", "success");
        } else {    
        	 
            mav.setViewName("login/login");
            mav.addObject("msg", "failure");
        }
        return mav;
    }
    
  
    @RequestMapping("businesslogout.do")
    public ModelAndView logout(HttpSession session){
    	businessjoinService.businesslogout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName(folder+"/businesslogin");
        mav.addObject("msg", "businesslogout");
        return mav;
    }
     
    @RequestMapping("businessfind.do")
    public String find(){ 
    	logger.debug("FIND");
        return folder+"/businessfind";   
    } 
}
 