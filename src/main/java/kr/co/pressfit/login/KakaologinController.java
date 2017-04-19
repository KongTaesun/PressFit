package kr.co.pressfit.login;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaologinController {

	Kakao kakao = new Kakao();
	
	@RequestMapping(value="/kakaoGetCode", method=RequestMethod.GET)
	public String kakao() throws Exception{ 
		Kakao kakao = new Kakao();
		System.out.println("kakao.getCode() : "+kakao.getCode());
		
		return "redircet:"+kakao.getCode();
	}
	
	 @RequestMapping(value="/kakaologin", method=RequestMethod.GET)
	 public String kakaoLogin(@RequestParam("code") String code)throws Exception{ 
		 
		 System.out.println("code :"+code);
	   
		 String data = (String)Kakao.getHtml((kakao.getAccesToken(code)));
		  
		 System.out.println("data :"+data);
		 
		 Map<String, String> map = kakao.JsonStringMap(data);
		 System.out.println("map"+map);
		 System.out.println("access_token:"+map.get("access_token"));
		 System.out.println("refresh_token:"+map.get("refresh_token"));
		 System.out.println("scope:"+map.get("scope"));
		 System.out.println("token_type"+map.get("token_type"));
		 System.out.println("expires_in:"+map.get("expires_in"));
		 
		 
		 
		 
		 
		 
		 return "kakaologin";  //login
	 }
}
