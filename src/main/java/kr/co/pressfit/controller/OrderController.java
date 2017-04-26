package kr.co.pressfit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

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
	

	
	@RequestMapping(value="/orderConfirm.do")
	public ModelAndView orderConfirm(HttpSession session, int cart_id, ModelAndView mav) throws Exception{

		 String id = (String) session.getAttribute("id");
		 
		 Map <String, Object> list = new HashMap<String,Object>();
		
		 list.put("id", id);
		 list.put("cart_id", cart_id);
		 
		 orderService.orderConfirm(list);  
		 	  
		  Map <String, Object> map = new HashMap<String, Object>();
		    
		  map.put("list", list);
		  mav.setViewName("redirect:/order/orderList.do");  
		  mav.addObject("map", map);  
		  
		  return mav;
	}
	
	@RequestMapping("/orderList.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception{ 
	
		String id = (String) session.getAttribute("id");
		 Map <String, Object> map = new HashMap<String, Object>();
	     List <CartVO> list = orderService.orderList(id); 
		
	     map.put("list", list);   
	     mav.setViewName("order/orderList");  
	     mav.addObject("map", map);  
	     
	     
		return mav;

	}
	 @RequestMapping(value="/orderCancel.do")
		public ModelAndView orderCancel(HttpSession session, ModelAndView mav) throws Exception{ 
			
		  String id = (String) session.getAttribute("id");
		  System.out.println(id);
		  Map <String, Object> map = new HashMap<String,Object>();
		  List <CartVO> list = orderService.orderCancel(id); 
			 
		  map.put("list", list);   
		  mav.setViewName("order/orderCancel");  
		  mav.addObject("map", map);  
		  
		  return mav;
		  }
	 
	 @RequestMapping(value="/orderCancelaction.do")
		public ModelAndView orderCancelaction(HttpSession session, int cart_id, ModelAndView mav) throws Exception{ 
			
		  String id = (String) session.getAttribute("id");
		  
		  Map <String, Object> list = new HashMap<String,Object>();
			
			 list.put("id", id);
			 list.put("cart_id", cart_id);
			  
		  orderService.orderCancelaction(list);
		  
		  Map <String, Object> map = new HashMap<String, Object>();
		    
		  map.put("list", list);
		  mav.setViewName("redirect:/order/orderCancel.do");  
		  mav.addObject("map", map);  
		  
		  return mav;
		  }
	
}