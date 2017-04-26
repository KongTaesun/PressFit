package kr.co.pressfit.dao;

import java.util.List;

import kr.co.pressfit.vo.AdminVO;
import kr.co.pressfit.vo.CommunityVO;
import kr.co.pressfit.vo.PageVO;

public interface AdminDAO {
	public void create(AdminVO vo);
	public AdminVO read(AdminVO vo);
	public List<AdminVO> adminList();
	public void update(AdminVO vo);
	public void delete(AdminVO vo);
    public boolean passwordCheck(AdminVO vo);
    public List<CommunityVO> communityList(PageVO vo);
}

 




