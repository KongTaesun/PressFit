package kr.co.pressfit.dao;

import java.util.List;

import kr.co.pressfit.vo.BusinessVO;

 

public interface BusinessDAO {
	public List<BusinessVO> businessList();
	public void insertBusiness(BusinessVO vo);
	public BusinessVO viewBusiness(String id); 
	public void deleteBusiness(String id);
	public void updateBusiness(BusinessVO vo);
	//비밀번호 체크
	public boolean checkPw(String id, String pw);
}

 




