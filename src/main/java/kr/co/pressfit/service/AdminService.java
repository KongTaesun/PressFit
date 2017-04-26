package kr.co.pressfit.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.FaqVO;
import kr.co.pressfit.vo.GalleryVO;
import kr.co.pressfit.vo.KeyboardVO;
import kr.co.pressfit.vo.MemberVO;
import kr.co.pressfit.vo.PageVO;
import kr.co.pressfit.vo.TMouseVO;

public interface AdminService {
	public void create(AdminVO vo);
	public AdminVO read(AdminVO vo);
	public List<AdminVO> adminList();
	public void update(AdminVO vo);
	public void delete(AdminVO vo);
    public boolean passwordCheck(AdminVO vo);
    public boolean loginCheck(HttpSession session);	
    public List<CommunityVO> communityList(PageVO vo);
	public List<FaqVO> faqList(PageVO vo);
	public List<GalleryVO> galleryList(PageVO vo);
	public List<TMouseVO> tmouseList(PageVO vo);
	public List<KeyboardVO> keyboardList(PageVO vo);
	public List<BusinessVO> businessList(PageVO vo);
	public List<MemberVO> memberList(PageVO vo);
} 