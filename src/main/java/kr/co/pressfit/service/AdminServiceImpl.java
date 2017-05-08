package kr.co.pressfit.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;

import kr.co.pressfit.dao.AdminDAO;
import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.FaqVO;
import kr.co.pressfit.vo.GalleryVO; 
import kr.co.pressfit.vo.KeyboardVO;
import kr.co.pressfit.vo.MemberVO;
import kr.co.pressfit.vo.PageVO;
import kr.co.pressfit.vo.TMouseVO;

 
@Service
public class AdminServiceImpl implements AdminService {
    
    @Inject
    AdminDAO adminDao;

	@Override
	public void create(AdminVO vo) {
		adminDao.create(vo);
	}

	@Override
	public AdminVO read(AdminVO vo) {
		// TODO Auto-generated method stub
		return adminDao.read(vo);
	}

	@Override
	public List<AdminVO> adminList() {
		// TODO Auto-generated method stub
		return adminDao.adminList();
	}

	@Override
	public void update(AdminVO vo) {
		// TODO Auto-generated method stub
		adminDao.update(vo);
	}

	@Override
	public void delete(AdminVO vo) {
		// TODO Auto-generated method stub
		adminDao.delete(vo);
	}

	@Override
	public AdminVO passwordCheck(AdminVO vo) {
		// TODO Auto-generated method stub
		return adminDao.passwordCheck(vo);
	}

	@Override
	public boolean loginCheck(HttpSession session) {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public List<CommunityVO> communityList(PageVO vo) {
		return adminDao.communityList(vo);
	}
	@Override
	public List<FaqVO> faqList(PageVO vo) {
		return adminDao.faqList(vo);
	}
	@Override
	public List<GalleryVO> galleryList(PageVO vo) {
		return adminDao.galleryList(vo);
	}
	@Override
	public List<TMouseVO> tmouseList(PageVO vo) {
		return adminDao.tmouseList(vo);
	}
	@Override
	public List<KeyboardVO> keyboardList(PageVO vo) {
		return adminDao.keyboardList(vo);
	}
	@Override
	public List<BusinessVO> businessList(PageVO vo) {
		return adminDao.businessList(vo);
	}
	@Override
	public List<MemberVO> memberList(PageVO vo) {
		return adminDao.memberList(vo);
	}
	@Override
	public void update1(String board, int idx, String pw) {
		MemberVO vo = new MemberVO();
		vo.setId(board);
		vo.setIdx(idx);
		vo.setPw(pw);
		adminDao.update1(vo);
	}
	@Override
	public void update2(String board, int idx) {
		MemberVO vo = new MemberVO();
		vo.setId(board);
		vo.setIdx(idx);
		adminDao.update2(vo);
	}
	@Override
	public void delete1(String board, int idx) {
		MemberVO vo = new MemberVO();
		vo.setId(board);
		vo.setIdx(idx);
		adminDao.delete1(vo);
	}
}
