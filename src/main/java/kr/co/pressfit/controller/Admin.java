package kr.co.pressfit.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.service.AdminService;
import kr.co.pressfit.service.BusinessService;
import kr.co.pressfit.service.CartService;
import kr.co.pressfit.service.CommunityService;
import kr.co.pressfit.service.FaqService;
import kr.co.pressfit.service.GalleryService;
import kr.co.pressfit.service.KeyboardService;
import kr.co.pressfit.service.MemberService;
import kr.co.pressfit.service.OrderService;
import kr.co.pressfit.service.TMouseService;
import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.PageVO;
  
@Controller
@RequestMapping("/admin/*")
public class Admin {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject  
	TMouseService tmouseservice;
    @Inject
    KeyboardService keyboardservice;
    @Inject
    CommunityService communityservice;
    @Inject
    FaqService faqservice;
    @Inject
    GalleryService galleryservice;
	@Inject 
	BusinessService businessService;
    @Inject
    MemberService memberService;
    @Inject
    CartService cartService;
	@Inject
	OrderService orderService;
	@Inject
	AdminService adminService;
	
	@RequestMapping("main.do")
	public String main(Model model, HttpSession session){
		return "admin/main"; 
	}
	@RequestMapping("board.do")
	public String board(Model model, HttpSession session){
		return "admin/board"; 
	}
	@RequestMapping("member.do")
	public String member(Model model, HttpSession session){
		
		return "admin/member"; 
	}
	@RequestMapping("graph.do")
	public String graph(Model model, HttpSession session){
		return "admin/graph"; 
	}
	@RequestMapping("search.do")
	public String search(Model model, HttpSession session){
		return "admin/search"; 
	}
	@RequestMapping("/inter/login.do")
	public String login(Model model, HttpSession session){
		System.out.println(session.getAttribute("admin"));
		return "admin/login";
	} 
	@RequestMapping("/inter/passwordcheck.do")
	public ModelAndView passwordcheck(@ModelAttribute AdminVO vo,Model model, HttpSession session){
        ModelAndView mav = new ModelAndView();
		boolean result=adminService.passwordCheck(vo);
        if (result == true) { 
            mav.setViewName("admin/main");
            session.setAttribute("admin", vo.getId());
            session.setAttribute("adminlevel", vo.getLevel());
            session.setMaxInactiveInterval(60*40);
            mav.addObject("msg", "success");
        } else {
            mav.setViewName("admin/login");
            mav.addObject("msg", "failure");
        } 
        return mav;
	}
	@RequestMapping("create.do")
	public void create(@ModelAttribute AdminVO vo,Model model, HttpSession session){
		adminService.create(vo);
	}
	@RequestMapping("read.do")
	public String read(@ModelAttribute AdminVO vo,Model model, HttpSession session){
		 adminService.read(vo);
		 return "id:"+vo.getId().toString()+"pw:"+vo.getPw().toString()+"pw2:"+vo.getPw2().toString();
	}
	@RequestMapping("update.do") 
	public void update(@ModelAttribute AdminVO vo, Model model, HttpSession session){ 
		adminService.update(vo);
	}
	@RequestMapping("delete.do")
	public void delete(@ModelAttribute AdminVO vo,Model model, HttpSession session){
		adminService.delete(vo);
	}
	@RequestMapping(value="/community/list.do")
	public ModelAndView selectBoardList(@RequestParam(name="PAGE_INDEX",defaultValue="PAGE_INDEX") int pageindex,
			@RequestParam(defaultValue="PAGE_ROW",name="PAGE_ROW") int pagerow) throws Exception{
		int nPageIndex = 0;
	    if(StringUtils.isEmpty(pageindex) == false){
	        nPageIndex = pageindex-1;
	    }
    	PageVO vo = new PageVO();
    	vo.setSTART((nPageIndex * pagerow) + 1);
    	vo.setEND(pagerow);
    	List<CommunityVO> list = adminService.communityList(vo);

    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).getTOTAL());
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
}

 













