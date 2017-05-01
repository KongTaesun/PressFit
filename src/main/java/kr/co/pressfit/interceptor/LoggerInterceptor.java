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
	        //�떆媛꾩쓣 媛��졇�삩�떎
	        long currentTime = System.currentTimeMillis(); 
	        //�쁽�옱�떆媛꾩쓣 紐⑤뜽�뿉 �꽔�뒗�떎.
	        request.setAttribute("bTime", currentTime);// View瑜� 由ы꽩�븯湲� 吏곸쟾�뿉 �떎�뻾�맖
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
	        System.out.println("\t\t\t Request �슂泥� ip 	\t: " + ip);
	        System.out.println("\t\t\t Request �슂泥��떆媛� 	\t: " + Time);
	        System.out.println("\t\t\t Request 濡쒓렇�씤�뿬遺�	\t: " + login);
	        if(login==true){
		        System.out.println("\t\t\t Request 濡쒓렇�씤id	\t: " + id);
		        System.out.println("\t\t\t Request 濡쒓렇�씤�벑湲�	\t: " + kind);
	        }
	        
	        db.requesttime(ip,Time,login,id,kind,uri);
	        
        return super.preHandle(request, response, handler);
    }
     
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    	// �쁽�옱 �떆媛꾩쓣 援ы븳�떎
	        long currentTime = System.currentTimeMillis();
	        // �슂泥��씠 �떆�옉�맂 �떆媛꾩쓣 媛��졇�삩�떎
	        long beginTime = ((Long)request.getAttribute("bTime")).longValue();
	        // �쁽�옱 �떆媛� - �슂泥��씠 �떆�옉�맂 �떆媛� = 珥� 泥섎━�떆媛꾩쓣 援ы븳�떎
	        long processedTime = currentTime - beginTime;
	        DecimalFormat format = new DecimalFormat("#.###");
	        String str = format.format(processedTime*0.001);
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // HH=24h, hh=12h
	        String Time = df.format(currentTime);
	        System.out.println("\t\t\t Request 泥섎━�떆媛� 	\t: " + str+"(�떒�쐞:s)");
	        System.out.println("\t\t\t Request �셿猷뚯떆媛� 	\t: " + Time);
	        System.out.println("\t\t======================================           END          ======================================\n");
	        log.info("\n\n");
	        db.responsetime(str, Time);
    }
}