package kr.co.pressfit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
  
@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@RequestMapping("/search/quest.do")
	public String quest(Model model){
		return "recommendation/recomain";
	}
	@RequestMapping("/search/answer.do")
	public String answer(@RequestParam String q,Model model){
		model.addAttribute("q",q);
		return "recommendation/pagepasstest";
	}
	/*@RequestMapping("/search/answer.do")
	public String answer(Model model){
		return "recommendation/recoview";
	}*/
	@RequestMapping("/search/chart.do")
	public String chart(Model model){
		return "recommendation/chart";
	}
	@RequestMapping("/search/page.do")
	public String page(Model model){
		return "recommendation/pagepasstest";
	}
}

 













