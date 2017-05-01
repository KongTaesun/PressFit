package kr.co.pressfit.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.service.MemoService;
import kr.co.pressfit.vo.MemoVO;



@Controller
@RequestMapping("/memo/*")
public class MemoController {

	@Inject 
	MemoService memoService;
	
	@RequestMapping("delete/{idx}")
	public String delete(@PathVariable int idx){
		memoService.delete(idx); //? μ½λ ?­? 
		return "redirect:/memo/list.do"; //λ¦¬μ€?Έλ‘? ?΄?
	}	 
	
	@RequestMapping("update/{idx}")
	public String update(
			@PathVariable int idx, MemoVO vo){
		memoService.update(vo); //? μ½λ ?? 
		return "redirect:/memo/list.do"; //λ¦¬μ€?Έλ‘? ?΄?
	}
	
//http://localhost:8080/spring02/memo/view/7	
	@RequestMapping("view/{idx}")
	public ModelAndView view(
			@PathVariable int idx, ModelAndView mav	){
		// views/memo/view.jsp
		mav.setViewName("memo/view");
		mav.addObject("vo", memoService.memo_view(idx)); 
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(MemoVO vo){
		//memoService.insert(vo); //κΈ??°κΈ?
		memoService.insert(vo.getWriter(), vo.getMemo()); 
		return "redirect:/memo/list.do"; //λ¦¬μ€?Έλ‘? ?΄?
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav){
		//λ©λͺ¨ λͺ©λ‘? λ¦¬ν΄λ°μ
		List<MemoVO> items=memoService.list();
		//λ·°μ ?΄λ¦? ?€?  : views/memo/memo_list.jsp
		mav.setViewName("memo/memo_list");
		//λ·°μ μΆλ ₯?  ?°?΄?° ???₯
		mav.addObject("list", items);
		// ?λ©? ? ?
		return mav;
	}
}









