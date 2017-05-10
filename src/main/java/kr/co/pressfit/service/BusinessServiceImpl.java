package kr.co.pressfit.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.pressfit.dao.BusinessDAOImpl;
import kr.co.pressfit.vo.BusinessVO;
import kr.co.pressfit.vo.CartVO;
import kr.co.pressfit.vo.GraphVO;
import kr.co.pressfit.vo.KeyboardVO;
import kr.co.pressfit.vo.TMouseVO;

 


//현재 클래스를 스프링에서 관리하는 service bean으로 등록
@Service
public class BusinessServiceImpl implements BusinessService {

	// MemberDAOImpl 객체를 스프링에서 생성하여 주입시킴
	@Inject
	BusinessDAOImpl BusinessDao;
	 
	@Override  
	public List<BusinessVO> businessList() {
		List<BusinessVO> list= BusinessDao.businessList();
		String str="";
		for(BusinessVO vo : list){
			str = vo.getId().replace("<", "&lt;");
			str = vo.getId().replace(">", "&gt;");
			vo.setId(str);
			str = vo.getPw().replace("<", "&lt;");
			str = vo.getPw().replace(">", "&gt;");
			vo.setPw(str); 
			str = vo.getName().replace("<", "&lt;");
			str = vo.getName().replace(">", "&gt;");
			vo.setName(str);	
			str = vo.getEmail().replace("<", "&lt;");
			str = vo.getEmail().replace(">", "&gt;");
			vo.setEmail(str);				
		}
		return list; 
	}

	@Override
	public void insertBusiness(BusinessVO vo) {
		BusinessDao.insertBusiness(vo); 
	} 

	@Override
	public BusinessVO viewBusiness(String id) {
		System.out.println("서비스"+id);
		return BusinessDao.viewBusiness(id); 
	} 

	@Override
	public void deleteBusiness(String id) {
		BusinessDao.deleteBusiness(id);
	} 

	@Override
	public void updateBusiness(BusinessVO vo) { 
		BusinessDao.updateBusiness(vo); 
	} 

	@Override
	public boolean checkPw(String id, String pw) {
		return BusinessDao.checkPw(id, pw); 
	}
	
	@Override
    public List<CartVO> orderList(String startDate, String endDate,  String searchOption, String id) throws Exception {
        return BusinessDao.orderList(startDate, endDate, searchOption, id);
    }
    // 5. ��ٱ��� �ݾ� �հ�
    @Override
    public int sumMoney(String id) throws Exception {
        return BusinessDao.sumMoney(id);
    }
    //결제
    @Override
	public void payment(List<String> List, String searchOption) throws Exception {
		BusinessDao.payment(List, searchOption);
	}

	@Override
	public int countArticle(String searchOption, String keyword, String id) throws Exception {
		return BusinessDao.countArticle(searchOption, keyword, id);
	}

	@Override
	public GraphVO mainGraphData(String id) throws Exception {
		return BusinessDao.mainGraphData(id);
	}

	@Override
	public TMouseVO mouseRank(String id) throws Exception {
		return BusinessDao.mouseRank(id);
	}

	@Override
	public KeyboardVO keyboardRank(String id) throws Exception {
		return BusinessDao.keyboardRank(id);
	}

	@Override
	public List<GraphVO> monthData(String id, String kind) throws Exception {
		return BusinessDao.monthData(id, kind);
	}
    
    
}
