package kr.co.pressfit.common;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.LoggerVO;

@Repository
public class LoggerDB {
	
	@Inject
	SqlSession sqlSession;
	
	public void requesttime(String ip,String Time,boolean login,String id,String kind,String uri) {
		LoggerVO vo = new LoggerVO();
		vo.setIp(ip);
		vo.setStart(Time);
		vo.setUri(uri);
		if(login){
			vo.setLogin(1);
			vo.setId(id);
			vo.setKind(kind);
		}
		else{
			vo.setLogin(0);
			vo.setId("no");
			vo.setKind("no");
		}
		sqlSession.insert("logger.requesttime",vo);
	}
	public void responsetime(String str,String Time) {
		
		LoggerVO vo = new LoggerVO();
		vo.setProcesstime(Float.parseFloat(str));
		vo.setEnd(Time);
		System.out.println(vo);
		sqlSession.update("logger.responsetime",vo);
	}
}
