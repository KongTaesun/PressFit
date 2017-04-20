package kr.co.pressfit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.service.CartService;
import kr.co.pressfit.service.TMouseService;
import kr.co.pressfit.vo.CartVO;

@Controller
@RequestMapping("/shop/cart/*")
public class CartController {

    @Inject
    CartService cartService;
    
    @Inject
    TMouseService tmouseservice;
    
    @ResponseBody 
    // 1. 占쏙옙袂占쏙옙占� 占쌩곤옙
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

    
    // 2. 占쏙옙袂占쏙옙占� 占쏙옙占�
    @RequestMapping("cartList.do")
    public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception{
        String id = (String) session.getAttribute("id"); // session占쏙옙 占쏙옙占쏙옙占� userId
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = cartService.listCart(id); // 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙 
        int sumMoney = cartService.sumMoney(id); // 占쏙옙袂占쏙옙占� 占쏙옙체 占쌥억옙 호占쏙옙
        // 占쏙옙袂占쏙옙占� 占쏙옙체 占쏙옙六占� 占쏙옙占쏙옙 占쏙옙舫占� 占쏙옙占쏙옙
        // 占쏙옙紡占�(10占쏙옙占쏙옙占싱삼옙 => 占쏙옙占쏙옙, 占싱몌옙 => 2500占쏙옙)
        
        
        
        
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);                // 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙占쏙옙 map占쏙옙 占쏙옙占쏙옙
        map.put("count", list.size());        // 占쏙옙袂占쏙옙占� 占쏙옙품占쏙옙 占쏙옙占쏙옙
        map.put("sumMoney", sumMoney);        // 占쏙옙袂占쏙옙占� 占쏙옙체 占쌥억옙
        map.put("fee", fee);                 // 占쏙옙旁附占�
        map.put("allSum", sumMoney+fee);    // 占쌍뱄옙 占쏙옙품 占쏙옙체 占쌥억옙
        mav.setViewName("shop/cart/cartList");    // view(jsp)占쏙옙 占싱몌옙 占쏙옙占쏙옙
        mav.addObject("map", map);            // map 占쏙옙占쏙옙 占쏙옙占쏙옙
        return mav;
    }

    
    // 3. 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙
    @RequestMapping("delete.do")
    public String delete(@RequestParam(value="cart_id", required=false) int cart_id) throws Exception{
        cartService.delete(cart_id);
        System.out.println("占쏙옙트占싼뤄옙"+cart_id);
        return "redirect:/shop/cart/cartList.do";
    }

    @RequestMapping("alldelete.do")
    public String alldelete(HttpSession session) throws Exception{
    	String userId = (String) session.getAttribute("id");
    	cartService.alldelete(userId);
    	    	
    	return "redirect:/shop/cart/cartList.do";
    }
    
     
    
    // 4. 占쏙옙袂占쏙옙占� 占쏙옙占쏙옙
    @RequestMapping("update.do")
    public String update(@RequestParam int[] amount, @RequestParam int[] idx, HttpSession session) throws Exception {
        // session占쏙옙 id
        String userId = (String) session.getAttribute("id");
        // 占쏙옙占쌘듸옙占쏙옙 占쏙옙占쏙옙 占쏙옙큼 占쌥븝옙占쏙옙 占쏙옙占쏙옙
        for(int i=0; i<idx.length; i++){
            CartVO vo = new CartVO();
            vo.setUser_id(userId);
            vo.setAmount(amount[i]);
            vo.setIdx(idx[i]);
            cartService.modifyCart(vo);
        }

        return "redirect:/shop/cart/list.do";
    }
    
    // 5. 占쏙옙袂占쏙옙占� 체크 占쏙옙占쏙옙
    @RequestMapping(value="/payment.do")
	public ModelAndView cartCheck(@RequestParam(value="check") List<String> chkArr, HttpSession session) throws Exception{
    	String userId = (String) session.getAttribute("id");
    	ModelAndView mv = new ModelAndView("/shop/cart/boardBuy");
		cartService.chkArr(chkArr);
		
		return mv;
	}
    
    @RequestMapping(value="/orderInfoAction.do")
	public ModelAndView order(@RequestParam(value="check") List<String> chkArr, HttpSession session) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	String id = (String) session.getAttribute("id"); // session占쏙옙 占쏙옙占쏙옙占� userId
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = cartService.order(chkArr);
        List<CartVO> memberInfo = cartService.memberInfo(id);
        int sumMoney = cartService.sumMoney(id); // 占쏙옙袂占쏙옙占� 占쏙옙체 占쌥억옙 호占쏙옙
        
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
	}