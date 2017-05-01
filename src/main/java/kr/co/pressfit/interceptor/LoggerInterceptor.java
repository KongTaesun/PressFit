package kr.co.pressfit.interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
    protected Log log = LogFactory.getLog(LoggerInterceptor.class);
     
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

	        //시간을 가져온다
	        long currentTime = System.currentTimeMillis(); 
	        //현재시간을 모델에 넣는다.
	        request.setAttribute("bTime", currentTime);// View를 리턴하기 직전에 실행됨
	        DateFormat df = new SimpleDateFormat("HH:mm:ss"); // HH=24h, hh=12h
	        String Time = df.format(currentTime);
    		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	        String ip = req.getHeader("X-FORWARDED-FOR");
	        if (ip == null)
	            ip = req.getRemoteAddr();
	        log.info("======================================          START         ======================================");
	        System.out.println("\t\t\t Request URI \t:  " + request.getRequestURI());
	        System.out.println("\t\t\t Request 요청 ip \t: " +ip);
	        System.out.println("\t\t\t Request 요청시간 \t: " + Time);
        return super.preHandle(request, response, handler);
    }
     
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    	// 현재 시간을 구한다
	        long currentTime = System.currentTimeMillis();
	        // 요청이 시작된 시간을 가져온다
	        long beginTime = ((Long)request.getAttribute("bTime")).longValue();
	        // 현재 시간 - 요청이 시작된 시간 = 총 처리시간을 구한다
	        long processedTime = currentTime - beginTime;
	        DateFormat df = new SimpleDateFormat("HH:mm:ss"); // HH=24h, hh=12h
	        String Time = df.format(currentTime);
	        System.out.println("\t\t\t Request 처리시간 \t: " + processedTime);
	        System.out.println("\t\t\t Request 완료시간 \t: " + Time);
	        System.out.println("\t\t======================================           END          ======================================\n");
	        log.info("\n\n");
    }
}