package kr.co.pressfit.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pressfit.dao.LoggerDAO;


@Controller
@RequestMapping("/logger/*")
public class LoggerController {
	
	@Inject
	LoggerDAO loggerdao;
	@RequestMapping(value="all.do")
	public ModelAndView all() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("allvisit", loggerdao.allvisit());
    	mv.addObject("dayvisit", loggerdao.dayvisit());
    	mv.addObject("processtime", loggerdao.processtime());
    	mv.addObject("allresponsecount", loggerdao.allresponsecount());
    	mv.addObject("dayresponsecount", loggerdao.dayresponsecount());
    	mv.addObject("allsearch", loggerdao.allsearch());
    	mv.addObject("daysearch", loggerdao.daysearch());
    	mv.addObject("alloreder", loggerdao.alloreder());
    	mv.addObject("dayoreder", loggerdao.dayoreder());
    	return mv;
    }
	@RequestMapping(value="allvisit.do")
	public ModelAndView allvisit() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("allvisit", loggerdao.allvisit());
    	return mv;
    }
	@RequestMapping(value="dayvisit.do")
	public ModelAndView dayvisit() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("dayvisit", loggerdao.dayvisit());
    	return mv;
    }
	@RequestMapping(value="allsearch.do")
	public ModelAndView allsearch() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("allsearch", loggerdao.allsearch());
    	return mv;
    }
	@RequestMapping(value="daysearch.do")
	public ModelAndView daysearch() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("daysearch", loggerdao.daysearch());
    	return mv;
    }
	@RequestMapping(value="processtime.do")
	public ModelAndView processtime() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("processtime", loggerdao.processtime());
    	return mv;
    }
	@RequestMapping(value="allresponsecount.do")
	public ModelAndView allresponsecount() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("allresponsecount", loggerdao.allresponsecount());
    	return mv;
    }
	@RequestMapping(value="dayresponsecount.do")
	public ModelAndView dayresponsecount() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("dayresponsecount", loggerdao.dayresponsecount());
    	return mv;
    }
	@RequestMapping(value="alloreder.do")
	public ModelAndView alloreder() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("alloreder", loggerdao.alloreder());
    	return mv;
    }
	@RequestMapping(value="dayoreder.do")
	public ModelAndView dayoreder() throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("dayoreder", loggerdao.dayoreder());
    	return mv;
    }
	
}
