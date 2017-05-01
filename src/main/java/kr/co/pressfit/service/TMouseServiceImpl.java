package kr.co.pressfit.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.pressfit.dao.TMouseDAO;
import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.TMouseVO;
 
 
@Service
public class TMouseServiceImpl implements TMouseService {
    
    @Inject
    TMouseDAO TMouseDAO;
    
    // 01. 寃뚯떆湲��벐湲�
    @Transactional // �듃�옖�옲�뀡 泥섎━ 硫붿꽌�뱶濡� �꽕�젙
    @Override
    public void create(TMouseVO vo) throws Exception {
    	TMouseDAO.create(vo);
    }
    // 02. 寃뚯떆湲� �긽�꽭蹂닿린
    @Override
    public TMouseVO read(int idx) throws Exception {
        return TMouseDAO.read(idx);
    }
    // 03. 寃뚯떆湲� �닔�젙
    @Override
    public void update(TMouseVO vo) throws Exception {
    	TMouseDAO.update(vo);
    }
    // 04. 寃뚯떆湲� �궘�젣
    @Override
    public void delete(int idx) throws Exception {
    	TMouseDAO.delete(idx);
    }
    // 05. 寃뚯떆湲� �쟾泥� 紐⑸줉 boardDAO.listAll硫붿꽌�뱶 �샇異�
    @Override
    public List<TMouseVO> listAll(int start, int end, String searchOption, String keyword, int minPrice, int maxPrice, String id) throws Exception {
        return TMouseDAO.listAll(start, end, searchOption, keyword, minPrice, maxPrice, id);
    }
    // 06. 寃뚯떆湲� 議고쉶�닔 利앷�
    @Override
    public void increaseViewcnt(int idx, HttpSession session) throws Exception {
    	float update_time = 0;
        // �꽭�뀡�뿉 ���옣�맂 議고쉶�떆媛� 寃��깋
        // 理쒖큹濡� 議고쉶�븷 寃쎌슦 �꽭�뀡�뿉 ���옣�맂 媛믪씠 �뾾湲� �븣臾몄뿉 if臾몄� �떎�뻾X
        if(session.getAttribute("update_time_"+idx) != null){
                                // �꽭�뀡�뿉�꽌 �씫�뼱�삤湲�
            update_time = Float.parseFloat(String.valueOf(session.getAttribute("update_time_"+idx)));
        }
        // �떆�뒪�뀥�쓽 �쁽�옱�떆媛꾩쓣 current_time�뿉 ���옣
        long current_time = System.currentTimeMillis();
        // �씪�젙�떆媛꾩씠 寃쎄낵 �썑 議고쉶�닔 利앷� 泥섎━ 24*60*60*1000(24�떆媛�)
        // �떆�뒪�뀥�쁽�옱�떆媛� - �뿴�엺�떆媛� > �씪�젙�떆媛�(議고쉶�닔 利앷�媛� 媛��뒫�븯�룄濡� 吏��젙�븳 �떆媛�)
        if(current_time - update_time > 5*1000){
        	TMouseDAO.increaseViewcnt(idx);
            // �꽭�뀡�뿉 �떆媛꾩쓣 ���옣 : "update_time_"+bno�뒗 �떎瑜몃��닔�� 以묐났�릺吏� �븡寃� 紐낅챸�븳 寃�
            session.setAttribute("update_time_"+idx, current_time);
            
        }
    }
    // 07. 寃뚯떆湲� �젅肄붾뱶 媛��닔 boardDao.countArticle硫붿꽌�뱶 
    @Override
    public int countArticle(String searchOption, String keyword, String id) throws Exception {
    	return TMouseDAO.countArticle(searchOption, keyword, id);
    }
    // 寃뚯떆湲��쓽 泥⑤��뙆�씪 紐⑸줉
    @Override
    public void addAttach(String fullName) {
        TMouseDAO.addAttach(fullName);
    }
    // 寃뚯떆湲��쓽 泥⑤��뙆�씪 紐⑸줉
    @Override
    public List<String> getAttach(int idx) {
        return TMouseDAO.getAttach(idx);
    }
    // 寃뚯떆湲��쓽 泥⑤��뙆�씪 紐⑸줉
    @Override
    public void updateAttach(String fullName, int idx) {
        TMouseDAO.updateAttach(fullName,idx);
    }
    // 寃뚯떆湲��쓽 泥⑤��뙆�씪 �궘�젣 泥섎━
    @Override
    public void deleteFile(String fullname) {
    	TMouseDAO.deleteFile(fullname);
    }
    // 1. �뙎湲� �엯�젰
    @Override
    public void replycreate(ReplyVO vo) {
    	TMouseDAO.replycreate(vo);
    }
    // 1. �뙎湲� �엯�젰
    @Override
    public void replycreatecmt(ReplyVO vo) {
    	TMouseDAO.replycreatecmt(vo);
    }
    // 2. �뙎湲� 紐⑸줉
    @Override
    public List<ReplyVO> replylist(Integer boardno, int start, int end, HttpSession session) {
        List<ReplyVO> items = TMouseDAO.replylist(boardno, start, end);
        // �꽭�뀡�뿉�꽌 �쁽�옱 �궗�슜�옄 id媛� ���옣
        String id = (String) session.getAttribute("id");

        for(ReplyVO vo : items){
            // �뙎湲� 紐⑸줉以묒뿉 以묒뿉 鍮꾨� �뙎湲��씠 �엳�쓣 寃쎌슦
            if(vo.getSecret_reply().equals("y")){
                if(id == null){ // 鍮꾨줈洹몄씤 �긽�깭硫� 鍮꾨� �뙎湲�濡� 泥섎━
                    vo.setReplytext("鍮꾨� �뙎湲��엯�땲�떎.");
                } else { // 濡쒓렇�씤 �긽�깭�씪 寃쎌슦
                    String replyer = vo.getReplayer(); // �뙎湲� �옉�꽦�옄 ���옣
                    // 濡쒓렇�씤�븳 �궗�슜�옄媛� 寃뚯떆臾쇱쓽 �옉�꽦�옄X �뙎湲� �옉�꽦�옄�룄 X 鍮꾨��뙎湲�濡� 泥섎━
                    if(!id.equals(replyer)) {
                        vo.setReplytext("鍮꾨� �뙎湲��엯�땲�떎.");
                    }
                }
            }
        }
        return items; 
    }
    // 3. �뙎湲� �긽�꽭蹂닿린
    @Override
    public ReplyVO replydetail(Integer idx) {
        return TMouseDAO.replydetail(idx);
    }
    // 4. �뙎湲� �닔�젙
    @Override
    public void replyupdate(ReplyVO vo) {
    	TMouseDAO.replyupdate(vo);
    }
    // 5. �뙎湲� �궘�젣
    @Override
    public void replydelete(Integer boardno) {
    	TMouseDAO.replydelete(boardno);
    }
    // 6. �뙎湲� 媛��닔
    @Override
    public int replycount(Integer boardno) {
        return TMouseDAO.replycount(boardno);
    }
	
    
    
}