package kr.co.pressfit.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository  
public class LoggerDB {
	
	@Inject
	SqlSession sqlSession;
	
	public void create() {
		sqlSession.insert("admin.create");
	}
}
