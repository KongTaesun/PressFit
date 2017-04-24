package kr.co.pressfit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.service.OrderService;
import kr.co.pressfit.vo.CartVO;



@Controller  
@RequestMapping("/order/*")
public class OrderController {


	private static final Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
	@Inject
	OrderService orderService;
	
	@RequestMapping("orderList.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception{ 
	
		String id = (String) session.getAttribute("id");
		 Map <String, Object> map = new HashMap<String, Object>();
	     List <CartVO> list = orderService.orderList(id); 
		
	     map.put("list", list);   
	     mav.setViewName("order/orderList");  
	     mav.addObject("map", map);  
	     
	     
		return mav;

	
	}
	
	  @RequestMapping(value="/orderDetail.do")
		public void order(@RequestParam(value="check") List<String> chkArr, HttpSession session) throws Exception{
	    	
	  }
	
	
}