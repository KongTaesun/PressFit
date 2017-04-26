package kr.co.pressfit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// �씤�꽣�뀎�꽣 : �슂泥� �쟾�썑�뿉 �옄�룞�쑝濡� 泥섎━(寃쎌쑀)�릺�뒗 �겢�옒�뒪
//  preHandle() =>  return true => write.do => postHandle()
//              =>  return false; 
public class AdminInterceptor 
	extends HandlerInterceptorAdapter{
	//�슂泥� �쟾�뿉 泥섎━
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//�꽭�뀡 媛앹껜 �깮�꽦 
		HttpSession session=request.getSession();
		if(session.getAttribute("admin")==null){
			response.sendRedirect(request.getContextPath()+"/");
			return false; //�슂泥��쓣 �뜑�씠�긽 �떎�뻾�븯吏� �븡�쓬
		}else{
			return true; //�슂泥��쓣 �떎�뻾�븿
		}
	}
	// �슂泥��씠 �걹�궃 �썑�뿉 泥댄겕
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
}





