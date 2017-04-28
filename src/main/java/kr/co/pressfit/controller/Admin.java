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
import kr.co.pressfit.service.JoinService;
import kr.co.pressfit.service.KeyboardService;
import kr.co.pressfit.service.OrderService;
import kr.co.pressfit.service.TMouseService;
import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.FaqVO;
import kr.co.pressfit.vo.GalleryVO;
import kr.co.pressfit.vo.KeyboardVO;
import kr.co.pressfit.vo.MemberVO;
import kr.co.pressfit.vo.PageVO;
import kr.co.pressfit.vo.TMouseVO;
  
@Controller
@RequestMapping("/admin/*")
public class Admin {
	
	@SuppressWarnings("unused")
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
	BusinessService businessservice;
    @Inject
    CartService cartService;
	@Inject
	OrderService orderService;
	@Inject
	AdminService adminservice;
	@Inject  
	JoinService joinservice;
	
	@RequestMapping("main.do")
	public String main(Model model, HttpSession session){
		return "admin/main"; 
	}
	@RequestMapping("board.do")
	public String board(Model model, HttpSession session){
		return "admin/board"; 
	}
	@RequestMapping("faq.do")
	public String faq(Model model, HttpSession session){
		return "admin/faq"; 
	}
	@RequestMapping("product.do")
	public String product(Model model, HttpSession session){
		return "admin/product"; 
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
	@RequestMapping("maker.do")
	public String maker(Model model, HttpSession session){
		return "admin/maker"; 
	}
	@RequestMapping("/inter/login.do")
	public String login(Model model, HttpSession session){
		System.out.println(session.getAttribute("admin"));
		return "admin/login";
	} 
	@RequestMapping("/inter/passwordcheck.do")
	public ModelAndView passwordcheck(@ModelAttribute AdminVO vo,Model model, HttpSession session){
        ModelAndView mav = new ModelAndView();
		boolean result=adminservice.passwordCheck(vo);
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
		adminservice.create(vo);
	} 
	@RequestMapping("read.do")
	public ModelAndView read(@ModelAttribute AdminVO vo,Model model, HttpSession session){
		ModelAndView mv = new ModelAndView("jsonView");
	    mv.addObject("community", adminservice.read(vo));
	    return mv;
	}
	@RequestMapping("update.do") 
	public void update(@ModelAttribute AdminVO vo, Model model, HttpSession session){ 
		adminservice.update(vo);
	}
	@RequestMapping("delete.do")
	public void delete(@ModelAttribute AdminVO vo,Model model, HttpSession session){
		adminservice.delete(vo);
	}
	@RequestMapping(value="/community/list.do")
	public ModelAndView communityList(@RequestParam(name="communityPAGEINDEX",defaultValue="communityPAGEINDEX") int pageindex,
			@RequestParam(defaultValue="PAGE_ROW",name="PAGE_ROW") int pagerow) throws Exception{
		int nPageIndex = 0;
	    if(StringUtils.isEmpty(pageindex) == false){
	        nPageIndex = pageindex-1;
	    }
    	PageVO vo = new PageVO();
    	vo.setSTART((nPageIndex * pagerow));
    	vo.setEND(pagerow);
    	List<CommunityVO> list = adminservice.communityList(vo);

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
	@RequestMapping(value="/community/create.do")
	public ModelAndView communitycreate(@RequestParam(name="communityVO") CommunityVO vo)throws Exception{
		communityservice.create(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/community/read.do")
	public ModelAndView communityread(@RequestParam(name="communityidx") int idx)throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("community", communityservice.read(idx));
    	return mv;
    }
	@RequestMapping(value="/community/update.do")
	public ModelAndView communityupdate(@RequestParam(name="communityVO") CommunityVO vo)throws Exception{
		communityservice.update(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/community/delete.do")
	public ModelAndView communitydelete(@RequestParam(name="communityidx") int idx)throws Exception{
		communityservice.delete(idx);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	
	@RequestMapping(value="/faq/list.do")
	public ModelAndView faqList(@RequestParam(name="faqPAGEINDEX",defaultValue="faqPAGEINDEX") int pageindex,
			@RequestParam(defaultValue="PAGE_ROW",name="PAGE_ROW") int pagerow) throws Exception{
		int nPageIndex = 0;
	    if(StringUtils.isEmpty(pageindex) == false){
	        nPageIndex = pageindex-1;
	    }
    	PageVO vo = new PageVO();
    	vo.setSTART((nPageIndex * pagerow));
    	vo.setEND(pagerow);
    	List<FaqVO> list = adminservice.faqList(vo);

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
	@RequestMapping(value="/faq/create.do")
	public ModelAndView faqcreate(@RequestParam(name="faqVO") FaqVO vo)throws Exception{
		faqservice.create(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/faq/read.do")
	public ModelAndView faqread(@RequestParam(name="faqidx") int idx)throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("faq", faqservice.read(idx));
    	return mv;
    }
	@RequestMapping(value="/faq/update.do")
	public ModelAndView faqupdate(@RequestParam(name="faqVO") FaqVO vo)throws Exception{
		faqservice.update(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/faq/delete.do")
	public ModelAndView faqdelete(@RequestParam(name="faqidx") int idx)throws Exception{
		faqservice.delete(idx);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	
	@RequestMapping(value="/gallery/list.do")
	public ModelAndView galleryList(@RequestParam(name="galleryPAGEINDEX",defaultValue="galleryPAGEINDEX") int pageindex,
			@RequestParam(defaultValue="PAGE_ROW",name="PAGE_ROW") int pagerow) throws Exception{
		int nPageIndex = 0;
	    if(StringUtils.isEmpty(pageindex) == false){
	        nPageIndex = pageindex-1;
	    }
    	PageVO vo = new PageVO();
    	vo.setSTART((nPageIndex * pagerow));
    	vo.setEND(pagerow);
    	List<GalleryVO> list = adminservice.galleryList(vo);

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
	@RequestMapping(value="/gallery/create.do")
	public ModelAndView gallerycreate(@RequestParam(name="galleryVO") GalleryVO vo)throws Exception{
		galleryservice.create(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/gallery/read.do")
	public ModelAndView galleryread(@RequestParam(name="galleryidx") int idx)throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("gallery", galleryservice.read(idx));
    	return mv;
    }
	@RequestMapping(value="/gallery/update.do")
	public ModelAndView galleryupdate(@RequestParam(name="galleryVO") GalleryVO vo)throws Exception{
		galleryservice.update(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/gallery/delete.do")
	public ModelAndView gallerydelete(@RequestParam(name="galleryidx") int idx)throws Exception{
		galleryservice.delete(idx);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	
	@RequestMapping(value="/tmouse/list.do")
	public ModelAndView tmouseList(@RequestParam(name="tmousePAGEINDEX",defaultValue="tmousePAGEINDEX") int pageindex,
			@RequestParam(defaultValue="PAGE_ROW",name="PAGE_ROW") int pagerow) throws Exception{
		int nPageIndex = 0;
	    if(StringUtils.isEmpty(pageindex) == false){
	        nPageIndex = pageindex-1;
	    }
    	PageVO vo = new PageVO();
    	vo.setSTART((nPageIndex * pagerow));
    	vo.setEND(pagerow);
    	List<TMouseVO> list = adminservice.tmouseList(vo);

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
	@RequestMapping(value="/tmouse/create.do")
	public ModelAndView tmousecreate(@RequestParam(name="tmouseVO") TMouseVO vo)throws Exception{
		tmouseservice.create(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/tmouse/read.do")
	public ModelAndView tmouseread(@RequestParam(name="tmouseidx") int idx)throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("tmouse", tmouseservice.read(idx));
    	return mv;
    }
	@RequestMapping(value="/tmouse/update.do")
	public ModelAndView tmouseupdate(@RequestParam(name="tmouseVO") TMouseVO vo)throws Exception{
		tmouseservice.update(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/tmouse/delete.do")
	public ModelAndView tmousedelete(@RequestParam(name="tmouseidx") int idx)throws Exception{
		tmouseservice.delete(idx);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	
	@RequestMapping(value="/keyboard/list.do")
	public ModelAndView keyboardList(@RequestParam(name="keyboardPAGEINDEX",defaultValue="keyboardPAGEINDEX") int pageindex,
			@RequestParam(defaultValue="PAGE_ROW",name="PAGE_ROW") int pagerow) throws Exception{
		int nPageIndex = 0;
	    if(StringUtils.isEmpty(pageindex) == false){
	        nPageIndex = pageindex-1;
	    }
    	PageVO vo = new PageVO();
    	vo.setSTART((nPageIndex * pagerow));
    	vo.setEND(pagerow);
    	List<KeyboardVO> list = adminservice.keyboardList(vo);

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
	@RequestMapping(value="/keyboard/create.do")
	public ModelAndView keyboardcreate(@RequestParam(name="keyboardVO") KeyboardVO vo)throws Exception{
		keyboardservice.create(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/keyboard/read.do")
	public ModelAndView keyboardread(@RequestParam(name="keyboardidx") int idx)throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("keyboard", keyboardservice.read(idx));
    	return mv;
    }
	@RequestMapping(value="/keyboard/update.do")
	public ModelAndView keyboardupdate(@RequestParam(name="keyboardVO") KeyboardVO vo)throws Exception{
		keyboardservice.update(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/keyboard/delete.do")
	public ModelAndView keyboarddelete(@RequestParam(name="keyboardidx") int idx)throws Exception{
		keyboardservice.delete(idx);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	
	@RequestMapping(value="/business/list.do")
	public ModelAndView businessList(@RequestParam(name="businessPAGEINDEX",defaultValue="businessPAGEINDEX") int pageindex,
			@RequestParam(defaultValue="PAGE_ROW",name="PAGE_ROW") int pagerow) throws Exception{
		int nPageIndex = 0;
	    if(StringUtils.isEmpty(pageindex) == false){
	        nPageIndex = pageindex-1;
	    }
    	PageVO vo = new PageVO();
    	vo.setSTART((nPageIndex * pagerow));
    	vo.setEND(pagerow);
    	List<BusinessVO> list = adminservice.businessList(vo);

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
	@RequestMapping(value="/business/create.do")
	public ModelAndView businesscreate(@RequestParam(name="businessVO") BusinessVO vo)throws Exception{
		businessservice.insertBusiness(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/business/read.do")
	public ModelAndView businessread(@RequestParam(name="businessid") String id)throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("business", businessservice.viewBusiness(id));
    	return mv;
    }
	@RequestMapping(value="/business/update.do")
	public ModelAndView businessupdate(@RequestParam(name="businessVO") BusinessVO vo)throws Exception{
		businessservice.updateBusiness(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/business/delete.do")
	public ModelAndView businessdelete(@RequestParam(name="businessid") String id)throws Exception{
		businessservice.deleteBusiness(id);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	
	@RequestMapping(value="/member/list.do")
	public ModelAndView memberList(@RequestParam(name="memberPAGEINDEX",defaultValue="memberPAGEINDEX") int pageindex,
			@RequestParam(defaultValue="PAGE_ROW",name="PAGE_ROW") int pagerow) throws Exception{
		int nPageIndex = 0;
	    if(StringUtils.isEmpty(pageindex) == false){
	        nPageIndex = pageindex-1;
	    }
    	PageVO vo = new PageVO();
    	vo.setSTART((nPageIndex * pagerow));
    	vo.setEND(pagerow);
    	List<MemberVO> list = adminservice.memberList(vo);

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
	@RequestMapping(value="/member/create.do")
	public ModelAndView membercreate(@RequestParam(name="memberVO") MemberVO vo)throws Exception{
		joinservice.insertMember(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/member/read.do")
	public ModelAndView memberread(@RequestParam(name="memberidx") String id)throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("member", joinservice.viewMember(id));
    	return mv;
    }
	@RequestMapping(value="/member/update.do")
	public ModelAndView memberupdate(@RequestParam(name="memberVO") MemberVO vo)throws Exception{
		joinservice.updateMember(vo);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	@RequestMapping(value="/member/delete.do")
	public ModelAndView memberdelete(@RequestParam(name="memberidx") String id)throws Exception{
		joinservice.deleteMember(id);
    	ModelAndView mv = new ModelAndView("jsonView");
    	return mv;
    }
	
}

 













