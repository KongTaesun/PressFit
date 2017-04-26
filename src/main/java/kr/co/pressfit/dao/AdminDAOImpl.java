package kr.co.pressfit.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.PageVO;

//현재 클래스를 dao bean으로 등록시킴
@Repository  
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void create(AdminVO vo) {
		sqlSession.insert("admin.create");
	}
	@Override
	public AdminVO read(AdminVO vo) {
		return sqlSession.selectOne("admin.read");
	}
	@Override
	public List<AdminVO> adminList() {
		return sqlSession.selectOne("admin.readlist");
	}
	@Override
	public void update(AdminVO vo) {
		sqlSession.update("admin.update");
	}
	@Override
	public void delete(AdminVO vo) {
		sqlSession.delete("admin.delete");
	}
	@Override
	public boolean passwordCheck(AdminVO vo) {
		int check = sqlSession.selectOne("admin.passwordcheck");
		return (check == 1) ? false : true;
	}
	@Override
	public List<CommunityVO> communityList(PageVO vo) {
		return sqlSession.selectList("admin.community", vo);
	}
}







