package kr.co.pressfit.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.MalformedInputException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Kakao {
 
	
	private static final String RestApiKey = "5a64502276ff74fd32b2263f101279ac";

	private static final String Redirect_URL = "http://192.168.1.26:8080/pressfit/kakaologin";
	
	private static final String keyHost = "http://kauth.kakao.com";

	
	public static String getCode(){
		
		String getcode = keyHost;
				getcode += "/oauth/authorize?client_id="+RestApiKey;
				getcode += "&redirect_uri="+Redirect_URL;
				getcode += "&response_type=code";
						 
		return getcode;
	}
	
	
	
	public static String getAccesToken(String authorize_code){
		
		
	/*	String getAccesToken = "keyHost";
		       getAccesToken += "/oauth/token?grant_type=authorization_code";
	*/	       
		String getAccesToken = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code";       
		       getAccesToken += "&client_id="+RestApiKey;	   
		       getAccesToken += "&redirect_uri="+Redirect_URL;
		       getAccesToken += "&code="+authorize_code;
		
		return getAccesToken;
	}
	
	public static String getHtml(String accestoken){
		 
		HttpURLConnection urlconn = null;
		String returnresult = null;
		
		try {
			URL url = new URL(null);
			
			urlconn = (HttpURLConnection) url.openConnection();			
			urlconn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");			
			urlconn.setRequestMethod("POST");			
			urlconn.setDoOutput(true);	
			urlconn.connect();
			
			BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream(), "UTF-8"));			
			StringBuffer sb = new StringBuffer();			
			String result = null;
			
			while ((result = in.readLine()) != null){
				
				sb.append(result);
				sb.append("\n");
				
			}
				returnresult = sb.toString();
			
		} catch (MalformedInputException e) {
		
			e.printStackTrace();
		
		} catch (IOException e){
		
			e.printStackTrace();
		
		}
		return returnresult;
	}
	
	public static Map<String, String> JsonStringMap(){
		
		Map<String, String> map = new HashMap<String, String>();
		
		ObjectMapper mapper = new ObjectMapper();
		
		return null;
	}
	
	public static Map<String, String> JsonStringMap(String data){
		Map<String, String> map = new HashMap<String, String>();
		
		ObjectMapper  mapper = new ObjectMapper();
		
		try {
			map = mapper.readValue(data, new TypeReference<HashMap<String, String>>() {
			});
			
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		} 
	return map;
	}
	
}
 