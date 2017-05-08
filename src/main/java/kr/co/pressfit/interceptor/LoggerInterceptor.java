package kr.co.pressfit.interceptor;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.pressfit.common.LoggerDB;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
    protected Log log = LogFactory.getLog(LoggerInterceptor.class);

	@Inject
	LoggerDB db;
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    		HttpSession session = request.getSession();
	        //시간을 가져온다
	        long currentTime = System.currentTimeMillis(); 
	        //현재시간을 모델에 넣는다.
	        request.setAttribute("bTime", currentTime);// View를 리턴하기 직전에 실행됨
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // HH=24h, hh=12h
	        String Time = df.format(currentTime);
    		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	        String ip = req.getHeader("X-FORWARDED-FOR");
	        if (ip == null){
	            ip = req.getRemoteAddr();}
	        boolean login = false;	        	
	        String id = null;
	        String kind = null;
	        if(session.getAttribute("id")!=null){
	        	id = (String)session.getAttribute("id");
	        	kind = (String)session.getAttribute("kind");
	        	login = true;
	        }
	        String uri = request.getRequestURI();
	        log.info("======================================          START         ======================================");
	        System.out.println("\t\t\t Request URI 	\t: " + uri);
	        System.out.println("\t\t\t Request 요청 ip 	\t: " + ip);
	        System.out.println("\t\t\t Request 요청시간 	\t: " + Time);
	        System.out.println("\t\t\t Request 로그인여부	\t: " + login);
	        if(login==true){
		        System.out.println("\t\t\t Request 로그인id	\t: " + id);
		        System.out.println("\t\t\t Request 로그인등급	\t: " + kind); 
	        }
	        
	        db.requesttime(ip,Time,login,id,kind,uri);
	        
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
	        DecimalFormat format = new DecimalFormat("#.###");
	        String str = format.format(processedTime*0.001);
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // HH=24h, hh=12h
	        String Time = df.format(currentTime);
	        System.out.println("\t\t\t Request 처리시간 	\t: " + str+"(단위:s)");
	        System.out.println("\t\t\t Request 완료시간 	\t: " + Time);
	        System.out.println("\t\t======================================           END          ======================================\n");
	        log.info("\n\n");
	        db.responsetime(str, Time);
    }
}