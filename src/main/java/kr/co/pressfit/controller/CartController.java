package kr.co.pressfit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
    // 1. ��ٱ��� �߰�
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

    
    // 2. ��ٱ��� ���
    @RequestMapping("cartList.do")
    public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception{
        String id = (String) session.getAttribute("id"); // session�� ����� userId
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = cartService.listCart(id); // ��ٱ��� ���� 
        int sumMoney = cartService.sumMoney(id); // ��ٱ��� ��ü �ݾ� ȣ��
        // ��ٱ��� ��ü ��׿� ���� ��ۺ� ����
        // ��۷�(10�����̻� => ����, �̸� => 2500��)
        
        
        
        
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);                // ��ٱ��� ������ map�� ����
        map.put("count", list.size());        // ��ٱ��� ��ǰ�� ����
        map.put("sumMoney", sumMoney);        // ��ٱ��� ��ü �ݾ�
        map.put("fee", fee);                 // ��۱ݾ�
        map.put("allSum", sumMoney+fee);    // �ֹ� ��ǰ ��ü �ݾ�
        mav.setViewName("shop/cart/cartList");    // view(jsp)�� �̸� ����
        mav.addObject("map", map);            // map ���� ����
        return mav;
    }

    
    // 3. ��ٱ��� ����
    @RequestMapping("delete.do")
    public String delete(@RequestParam(value="cart_id", required=false) int cart_id) throws Exception{
        cartService.delete(cart_id);
        System.out.println("��Ʈ�ѷ�"+cart_id);
        return "redirect:/shop/cart/cartList.do";
    }

    @RequestMapping("alldelete.do")
    public String alldelete(HttpSession session) throws Exception{
    	String userId = (String) session.getAttribute("id");
    	cartService.alldelete(userId);
    	    	
    	return "redirect:/shop/cart/cartList.do";
    }
    
     
    
    // 4. ��ٱ��� ����
    @RequestMapping("update.do")
    public String update(@RequestParam int[] amount, @RequestParam int[] idx, HttpSession session) throws Exception {
        // session�� id
        String userId = (String) session.getAttribute("id");
        // ���ڵ��� ���� ��ŭ �ݺ��� ����
        for(int i=0; i<idx.length; i++){
            CartVO vo = new CartVO();
            vo.setUser_id(userId);
            vo.setAmount(amount[i]);
            vo.setIdx(idx[i]);
            cartService.modifyCart(vo);
        }

        return "redirect:/shop/cart/list.do";
    }
    
    // 5. ��ٱ��� üũ ����
    @RequestMapping(value="/payment.do")
	public ModelAndView cartCheck(@RequestParam(value="check") List<String> chkArr, HttpSession session) throws Exception{
    	String userId = (String) session.getAttribute("id");
    	ModelAndView mv = new ModelAndView("/shop/cart/boardBuy");
		cartService.chkArr(chkArr);
		
		return mv;
	}
    
    @RequestMapping(value="/orderInfoAction.do")
	public ModelAndView order(@RequestParam(value="check") List<String> chkArr, HttpSession session) throws Exception{
    	System.out.println("컨트롤러"+chkArr);
    	ModelAndView mav = new ModelAndView();
    	String id = (String) session.getAttribute("id"); // session�� ����� userId
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = cartService.order(chkArr);
        System.out.println("컨트롤러"+list);
        int sumMoney = cartService.sumMoney(id); // ��ٱ��� ��ü �ݾ� ȣ��
        
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);
        /*map.put("count", list.size());*/
        map.put("sumMoney", sumMoney);
        map.put("fee", fee);
        map.put("allSum", sumMoney+fee);
        mav.setViewName("/shop/cart/orderInfoAction");
        mav.addObject("map", map);
        return mav;
    	
		
    	}
		
	}