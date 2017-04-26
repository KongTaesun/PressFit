package kr.co.pressfit.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.FaqVO;
import kr.co.pressfit.vo.GalleryVO;
import kr.co.pressfit.vo.KeyboardVO;
import kr.co.pressfit.vo.MemberVO;
import kr.co.pressfit.vo.PageVO;
import kr.co.pressfit.vo.TMouseVO;

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
	@Override
	public List<FaqVO> faqList(PageVO vo) {
		return sqlSession.selectList("admin.faq", vo);
	}
	@Override
	public List<GalleryVO> galleryList(PageVO vo) {
		return sqlSession.selectList("admin.gallery", vo);
	}
	@Override
	public List<TMouseVO> tmouseList(PageVO vo) {
		return sqlSession.selectList("admin.tmouse", vo);
	}
	@Override
	public List<KeyboardVO> keyboardList(PageVO vo) {
		return sqlSession.selectList("admin.keyboard", vo);
	}
	@Override
	public List<BusinessVO> businessList(PageVO vo) {
		return sqlSession.selectList("admin.businesslist", vo);
	}
	@Override
	public List<MemberVO> memberList(PageVO vo) {
		return sqlSession.selectList("admin.memberlist", vo);
	}
	
}







