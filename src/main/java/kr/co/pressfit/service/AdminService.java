package kr.co.pressfit.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.PageVO;

public interface AdminService {
	public void create(AdminVO vo);
	public AdminVO read(AdminVO vo);
	public List<AdminVO> adminList();
	public void update(AdminVO vo);
	public void delete(AdminVO vo);
    public boolean passwordCheck(AdminVO vo);
    public boolean loginCheck(HttpSession session);
    public List<CommunityVO> communityList(PageVO vo);
} 