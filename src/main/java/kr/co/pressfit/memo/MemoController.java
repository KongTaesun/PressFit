package kr.co.pressfit.memo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.vo.MemoVO;



@Controller
@RequestMapping("/memo/*")
public class MemoController {

	@Inject 
	MemoService memoService;
	
	@RequestMapping("delete/{idx}")
	public String delete(@PathVariable int idx){
		memoService.delete(idx); //?��코드 ?��?��
		return "redirect:/memo/list.do"; //리스?���? ?��?��
	}	 
	
	@RequestMapping("update/{idx}")
	public String update(
			@PathVariable int idx, MemoVO vo){
		memoService.update(vo); //?��코드 ?��?��
		return "redirect:/memo/list.do"; //리스?���? ?��?��
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
		//memoService.insert(vo); //�??���?
		memoService.insert(vo.getWriter(), vo.getMemo()); 
		return "redirect:/memo/list.do"; //리스?���? ?��?��
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav){
		//메모 목록?�� 리턴받음
		List<MemoVO> items=memoService.list();
		//뷰의 ?���? ?��?�� : views/memo/memo_list.jsp
		mav.setViewName("memo/memo_list");
		//뷰에 출력?�� ?��?��?�� ???��
		mav.addObject("list", items);
		// ?���? ?��?��
		return mav;
	}
}

 







