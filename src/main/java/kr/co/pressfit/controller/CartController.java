package kr.co.pressfit.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.service.CartService;
import kr.co.pressfit.service.TMouseService;
import kr.co.pressfit.vo.CartVO;
import kr.co.pressfit.vo.TMouseVO;

@Controller
@RequestMapping("/shop/cart/*")
public class CartController {

    @Inject
    CartService cartService;
    
    @Inject
    TMouseService tmouseservice;
    
    @ResponseBody 
    
    @RequestMapping("insert.do")
    public ModelAndView insert(@ModelAttribute CartVO vo, HttpSession session) throws Exception{
    	System.out.println(vo);
        String id = (String) session.getAttribute("id");
        vo.setUser_id(id);

        int count = cartService.countCart(vo.getIdx(), id);
        
        if(count == 0){
            cartService.insert(vo);
        } else {
            cartService.updateCart(vo);
        }
        
        String value = vo.getKind();
        
        ModelAndView mav = new ModelAndView();
        
        if("keyboard".equals(value)){
        	mav.setViewName("redirect:/keyboard/list.do"); 
        }
        else{
	        mav.setViewName("redirect:/tmouse/list.do");
	    }
        
        return mav;
    }
    
    @ResponseBody 
    @RequestMapping(value="buy.do", method=RequestMethod.GET)
    public ModelAndView buy(@ModelAttribute CartVO vo, HttpSession session) throws Exception{
        // session占쎈퓠 占쏙옙占쎌삢占쎈쭆 userId�몴占� writer占쎈퓠 占쏙옙占쎌삢
        /*String crea_id = (String) session.getAttribute("id");
        vo.setCrea_id(crea_id);
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();
        */
    	ModelAndView mav = new ModelAndView();
    	String id = (String) session.getAttribute("id"); 
        Map<String, Object> map = new HashMap<String, Object>();
           
        List<CartVO> list = new ArrayList<CartVO>();
        list.add(cartService.buy(vo));
        List<CartVO> memberInfo = cartService.memberInfo(id);
        int sumMoney = cartService.sumBuyMoney(id); 
        System.out.println("바로구매루트섬머니"+sumMoney);
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);
        map.put("memberInfo", memberInfo);
        /*map.put("count", list.size());*/
        map.put("sumMoney", sumMoney);
        map.put("fee", fee);
        map.put("allSum", sumMoney+fee);
        mav.setViewName("/shop/cart/orderInfoAction");
        mav.addObject("map", map);
        return mav;
    }
   
    @RequestMapping("cartList.do")
    public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception{
        String id = (String) session.getAttribute("id");
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = cartService.listCart(id);  
        int sumMoney = cartService.sumMoney(id); 
       
        
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);                
        map.put("count", list.size());        
        map.put("sumMoney", sumMoney);        
        map.put("fee", fee);                 
        map.put("allSum", sumMoney+fee);    
        mav.setViewName("shop/cart/cartList");    
        mav.addObject("map", map);           
        return mav;
    }

    
    @RequestMapping("delete.do")
    public String delete(@RequestParam(value="cart_id", required=false) int cart_id) throws Exception{
        cartService.delete(cart_id);
        System.out.println("cart_id"+cart_id);
        return "redirect:/shop/cart/cartList.do";
    }

    @RequestMapping("alldelete.do")
    public String alldelete(HttpSession session) throws Exception{
    	String userId = (String) session.getAttribute("id");
    	cartService.alldelete(userId);
    	    	
    	return "redirect:/shop/cart/cartList.do";
    }
    
     
    
     @RequestMapping("update.do")
    public String update(@RequestParam int[] amount, @RequestParam int[] idx, HttpSession session) throws Exception {
       
        String userId = (String) session.getAttribute("id");
       
        for(int i=0; i<idx.length; i++){
            CartVO vo = new CartVO();
            vo.setUser_id(userId);
            vo.setAmount(amount[i]);
            vo.setIdx(idx[i]);
            cartService.modifyCart(vo);
        }

        return "redirect:/shop/cart/list.do";
    }
    
    
    @RequestMapping(value="/payment.do")
	public ModelAndView cartCheck(@RequestParam(value="cart_id") int[] cart_id, 
			@RequestParam(value="amount") int[] amountList, HttpSession session, @RequestParam(value="methodpayment") String methodpayment, 
			@RequestParam(value="idx") int[] idx, @RequestParam(value="kind") String[] kind) throws Exception{
    	
    	String userId = (String) session.getAttribute("id");
    	
    	ModelAndView mv = new ModelAndView("/shop/cart/boardBuy");
    	
        for(int i=0; i<idx.length; i++){
            CartVO vo = new CartVO();
            vo.setAmount(amountList[i]);
            vo.setMethodpayment(methodpayment);
            vo.setIdx(idx[i]);
            vo.setKind(kind[i]);
            vo.setCart_id(cart_id[i]);
             
            cartService.chkArr(vo);
        	cartService.amounttest(vo);
        }
    	
    	
    	
    	 
		return mv; 
	}
    
    
    
    @RequestMapping(value="/orderInfoAction.do")
	public ModelAndView order(@RequestParam(value="check") List<String> chkArr, HttpSession session) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	String id = (String) session.getAttribute("id"); 
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = cartService.order(chkArr);
        int checksumMoney = cartService.checksumMoney(chkArr);
        List<CartVO> memberInfo = cartService.memberInfo(id);
        int sumMoney = cartService.sumMoney(id);
        
        System.out.println("이거봐"+list);
        
        
        
        int fee = checksumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);
        map.put("memberInfo", memberInfo);
        /*map.put("count", list.size());*/
        map.put("checksumMoney", checksumMoney);
        map.put("sumMoney", sumMoney);
        map.put("fee", fee);
        map.put("allSum", checksumMoney+fee);
        mav.setViewName("/shop/cart/orderInfoAction");
        mav.addObject("map", map);
        return mav;
    	}
	}