package kr.co.pressfit.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


//현재 클래스를 dao bean으로 등록시킴
@Repository  
public class LoggerDAOImpl implements LoggerDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public int allvisit() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.allvisit");
	}

	@Override
	public int dayvisit() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.dayvisit");
	}

	@Override
	public int allsearch() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.allsearch");
	}

	@Override
	public int daysearch() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.daysearch");
	}
	@Override
	public float processtime() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.processtime");
	}
	@Override
	public int allresponsecount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.allresponsecount");
	}

	@Override
	public int dayresponsecount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.dayresponsecount");
	}

	@Override
	public int alloreder() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.alloreder");
	}

	@Override
	public int dayoreder() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("logger.dayoreder");
	}
}







