package kr.co.pressfit.dao;

import java.util.List;

import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.FaqVO;
import kr.co.pressfit.vo.GalleryVO;
import kr.co.pressfit.vo.KeyboardVO;
import kr.co.pressfit.vo.MemberVO;
import kr.co.pressfit.vo.PageVO;
import kr.co.pressfit.vo.TMouseVO;

public interface AdminDAO {
	public void create(AdminVO vo);
	public AdminVO read(AdminVO vo);
	public List<AdminVO> adminList();
	public void update(AdminVO vo);
	public void delete(AdminVO vo);
    public boolean passwordCheck(AdminVO vo);
    public List<CommunityVO> communityList(PageVO vo);
	public List<FaqVO> faqList(PageVO vo);
	public List<GalleryVO> galleryList(PageVO vo);
	public List<TMouseVO> tmouseList(PageVO vo);
	public List<KeyboardVO> keyboardList(PageVO vo);
	public List<BusinessVO> businessList(PageVO vo);
	public List<MemberVO> memberList(PageVO vo);
	public void update1(MemberVO vo);
	public void update2(MemberVO vo);
	public void delete1(MemberVO vo);
}

 




