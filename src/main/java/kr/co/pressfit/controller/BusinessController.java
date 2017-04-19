package kr.co.pressfit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.common.BoardPager;
import kr.co.pressfit.service.BusinessService;
import kr.co.pressfit.service.KeyboardService;
import kr.co.pressfit.service.TMouseService;
import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CartVO;
import kr.co.pressfit.vo.KeyboardVO;
import kr.co.pressfit.vo.TMouseVO;

  
@Controller  //현재 클래스를 controller bean으로 등록시킴
@RequestMapping("/business/*")
public class BusinessController {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
	@Inject  
	TMouseService tmouseservice;
	@Inject
	KeyboardService keyboardservice;
	@Inject
	BusinessService businessService;
	String folder = "business";

	@Resource(name = "uploadPath")
	String uploadPath;

	@RequestMapping("list.do")
	public String businessList(Model model){ 
		List<BusinessVO> list = businessService.businessList(); 
		model.addAttribute("list", list); 
		return "business/business_list";
	}

	@RequestMapping("write.do")
	public String write(){
		return "business/write";
	} 

	@RequestMapping("insert.do") 
	public String insert(@ModelAttribute BusinessVO vo){
	
		businessService.insertBusiness(vo);
	
		return "redirect:/business/login.do"; 
	}	
	 
	@RequestMapping("view.do")
	public String view(@RequestParam  String id, Model model){
		
		logger.info("클릭한 아이디:"+id);
		
		model.addAttribute("vo", businessService.viewBusiness(id));
		return "business/view";
	}
	@RequestMapping("update.do") 
	public String update(@ModelAttribute BusinessVO vo, Model model){ 
		
		boolean result=businessService.checkPw(
				vo.getId(),vo.getPw() );
		if(result){
			businessService.updateBusiness(vo);
			return "redirect:/business/list.do"; 
		}else{
		
			BusinessVO vo2 = businessService.viewBusiness(
					
			vo.getId());
			vo.setRegdate(vo2.getRegdate());
			vo.setUpdatedate(vo2.getUpdatedate());
			
			model.addAttribute("vo",vo);
			model.addAttribute("message"
					,"비밀번호가 일치하지 않습니다.");
			return "business/view"; 
		}
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam String id, @RequestParam String pw, Model model){
		
		boolean result = businessService.checkPw(id, pw);
		if(result){
			 
			businessService.deleteBusiness(id);
			return "redirect:/business/list.do";
		}else{
			//비번이 틀렸을 때
			model.addAttribute("message" 
					,"비밀번호가 일치하지 않습니다."); 
			model.addAttribute("vo", businessService.viewBusiness(id));
			// view.jsp로 포워드
			return "business/view"; 
		}		
		
	}
	
	// 자신이 올린 제품리스트 (마우스)
	@RequestMapping("mouseList.do")
	public ModelAndView mouseList(@RequestParam(defaultValue = "title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int minPrice,
			@RequestParam(defaultValue = "200000") int maxPrice, @RequestParam(defaultValue = "1") int curPage, HttpSession session)
			throws Exception {
		String id = (String) session.getAttribute("id");
		int count = tmouseservice.countArticle(searchOption, keyword, id);
		System.out.println(count);
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		List<TMouseVO> list = tmouseservice.listAll(start, end, searchOption, keyword, minPrice, maxPrice, id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("minPrice", minPrice);
		map.put("maxPrice", maxPrice);
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName(folder + "/mouseList");

		return mav;
	}
	
	// 자신이 올린 제품리스트 (키보드)
	@RequestMapping("keyboardList.do")
	public ModelAndView keyboardList(@RequestParam(defaultValue = "title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int minPrice,
			@RequestParam(defaultValue = "200000") int maxPrice, @RequestParam(defaultValue = "1") int curPage, HttpSession session)
			throws Exception {
		String id = (String) session.getAttribute("id");
		System.out.println(searchOption);
		System.out.println(keyword);
		System.out.println(id);
		int count = keyboardservice.countArticle(searchOption, keyword, id);
		System.out.println(count);
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		List<KeyboardVO> list = keyboardservice.listAll(start, end, searchOption, keyword, minPrice, maxPrice, id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("minPrice", minPrice);
		map.put("maxPrice", maxPrice);
		map.put("boardPager", boardPager);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName(folder + "/keyboardList");

		return mav;
	}
	
	// 사업자 주문들어온 상품 리스트
	@RequestMapping("orderList.do")
    public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception{
        String id = (String) session.getAttribute("id"); // session�� ����� userId
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = businessService.orderList(id); // ��ٱ��� ���� 
        int sumMoney = businessService.sumMoney(id); // ��ٱ��� ��ü �ݾ� ȣ��
        // ��ٱ��� ��ü ��׿� ���� ��ۺ� ����
        // ��۷�(10�����̻� => ����, �̸� => 2500��)
        
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);                // ��ٱ��� ������ map�� ����
        map.put("count", list.size());        // ��ٱ��� ��ǰ�� ����
        map.put("sumMoney", sumMoney);        // ��ٱ��� ��ü �ݾ�
        map.put("fee", fee);                 // ��۱ݾ�
        map.put("allSum", sumMoney+fee);    // �ֹ� ��ǰ ��ü �ݾ�
        mav.setViewName("business/orderList");    // view(jsp)�� �̸� ����
        mav.addObject("map", map);            // map ���� ����
        return mav;
    }
	
	// 주문들어온 상품 결제
	@RequestMapping(value="payment.do")
	public ModelAndView order(@RequestParam(value="check") List<String> chkArr, HttpSession session) throws Exception{
    	System.out.println("컨트롤러"+chkArr);
    	ModelAndView mav = new ModelAndView();
    	String id = (String) session.getAttribute("id"); // session�� ����� userId
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = businessService.payment(chkArr);
        System.out.println("컨트롤러"+list);
        int sumMoney = businessService.sumMoney(id); // ��ٱ��� ��ü �ݾ� ȣ��
        
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);
        /*map.put("count", list.size());*/
        map.put("sumMoney", sumMoney);
        map.put("fee", fee);
        map.put("allSum", sumMoney+fee);
        mav.setViewName("business/orderList");
        mav.addObject("map", map);
        return mav;
    	
		
    }
}

 













