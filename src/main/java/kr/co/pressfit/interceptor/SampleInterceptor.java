package kr.co.pressfit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SampleInterceptor  
	extends HandlerInterceptorAdapter{
	//요청 전에 실행
	@Override
	public boolean preHandle(HttpServletRequest request
			, HttpServletResponse response
			, Object handler)
			throws Exception {
		System.out.println("pre handle....");
		return true;
	}
	//요청 후에 실행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("post handle....");
	}
}

