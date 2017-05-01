package kr.co.pressfit.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.pressfit.dao.GalleryDAO;
import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.GalleryVO;
 
 
@Service
public class GalleryServiceImpl implements GalleryService {
    
    @Inject
    GalleryDAO GalleryDAO;
    
    // 01. 寃뚯떆湲��벐湲�
    @Transactional // �듃�옖�옲�뀡 泥섎━ 硫붿꽌�뱶濡� �꽕�젙
    @Override
    public void create(GalleryVO vo) throws Exception {
        String title = vo.getTitle();
        String content = vo.getContent();
        String writer = vo.getWriter();
        title = title.replace("<", "&lt;");
        title = title.replace("<", "&gt;");
        writer = writer.replace("<", "&lt;");
        writer = writer.replace("<", "&gt;");
        title = title.replace("  ",    "&nbsp;&nbsp;");
        writer = writer.replace("  ",    "&nbsp;&nbsp;");
        content = content.replace("\n", "<br>");
        vo.setTitle(title);
        vo.setContent(content);
        vo.setWriter(writer); 
        GalleryDAO.create(vo);
        System.out.println(vo);
        // 寃뚯떆臾쇱쓽 泥⑤��뙆�씪 �젙蹂� �벑濡�
        String[] files = vo.getFilelist(); // 泥⑤��뙆�씪 諛곗뿴
        if(files == null) return; // 泥⑤��뙆�씪�씠 �뾾�쑝硫� 硫붿꽌�뱶 醫낅즺
        // 泥⑤��뙆�씪�뱾�쓽 �젙蹂대�� tbl_attach �뀒�씠釉붿뿉 insert
        for(String name : files){ 
        	GalleryDAO.addAttach(name);
        }

    }
    // 01. 寃뚯떆湲��벐湲�
    @Transactional // �듃�옖�옲�뀡 泥섎━ 硫붿꽌�뱶濡� �꽕�젙
    @Override
    public void createcmt(GalleryVO vo) throws Exception {
        String title = vo.getTitle();
        String content = vo.getContent();
        String writer = vo.getWriter();
        title = title.replace("<", "&lt;");
        title = title.replace("<", "&gt;");
        writer = writer.replace("<", "&lt;");
        writer = writer.replace("<", "&gt;");
        title = title.replace("  ",    "&nbsp;&nbsp;");
        writer = writer.replace("  ",    "&nbsp;&nbsp;");
        content = content.replace("\n", "<br>");
        vo.setTitle(title);
        vo.setContent(content);
        vo.setWriter(writer);
        GalleryDAO.createcmt(vo);
        System.out.println(vo);
        // 寃뚯떆臾쇱쓽 泥⑤��뙆�씪 �젙蹂� �벑濡�
        String[] files = vo.getFilelist(); // 泥⑤��뙆�씪 諛곗뿴
        if(files == null) return; // 泥⑤��뙆�씪�씠 �뾾�쑝硫� 硫붿꽌�뱶 醫낅즺
        // 泥⑤��뙆�씪�뱾�쓽 �젙蹂대�� tbl_attach �뀒�씠釉붿뿉 insert
        for(String name : files){ 
        	GalleryDAO.addAttach(name);
        }

    }
    // 02. 寃뚯떆湲� �긽�꽭蹂닿린
    @Override
    public GalleryVO read(int idx) throws Exception {
        return GalleryDAO.read(idx);
    }
    // 03. 寃뚯떆湲� �닔�젙
    @Override
    public void update(GalleryVO vo) throws Exception {
    	GalleryDAO.update(vo);
    }
    // 04. 寃뚯떆湲� �궘�젣
    @Override
    public void delete(int idx) throws Exception {
    	GalleryDAO.delete(idx);
    }
    // 05. 寃뚯떆湲� �쟾泥� 紐⑸줉 boardDAO.listAll硫붿꽌�뱶 �샇異�
    @Override
    public List<GalleryVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
        return GalleryDAO.listAll(start, end, searchOption, keyword);
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
        	GalleryDAO.increaseViewcnt(idx);
            // �꽭�뀡�뿉 �떆媛꾩쓣 ���옣 : "update_time_"+bno�뒗 �떎瑜몃��닔�� 以묐났�릺吏� �븡寃� 紐낅챸�븳 寃�
            session.setAttribute("update_time_"+idx, current_time);
            
        }
    }
    // 07. 寃뚯떆湲� �젅肄붾뱶 媛��닔 boardDao.countArticle硫붿꽌�뱶 
    @Override
    public int countArticle(String searchOption, String keyword) throws Exception {
    	return GalleryDAO.countArticle(searchOption, keyword);
    }
    // 寃뚯떆湲��쓽 泥⑤��뙆�씪 紐⑸줉
    @Override
    public void addAttach(String fullName) {
        GalleryDAO.addAttach(fullName);
    }
    // 寃뚯떆湲��쓽 泥⑤��뙆�씪 紐⑸줉
    @Override
    public List<String> getAttach(int idx) {
        return GalleryDAO.getAttach(idx);
    }
    // 寃뚯떆湲��쓽 泥⑤��뙆�씪 紐⑸줉
    @Override
    public void updateAttach(String fullName, int idx) {
        GalleryDAO.updateAttach(fullName,idx);
    }
    // 寃뚯떆湲��쓽 泥⑤��뙆�씪 �궘�젣 泥섎━
    @Override
    public void deleteFile(String fullname) {
    	GalleryDAO.deleteFile(fullname);
    }
    // 1. �뙎湲� �엯�젰
    @Override
    public void replycreate(ReplyVO vo) {
    	GalleryDAO.replycreate(vo);
    }
    // 1. �뙎湲� �엯�젰
    @Override
    public void replycreatecmt(ReplyVO vo) {
    	GalleryDAO.replycreatecmt(vo);
    }
    // 2. �뙎湲� 紐⑸줉
    @Override
    public List<ReplyVO> replylist(Integer boardno, int start, int end, HttpSession session) {
        List<ReplyVO> items = GalleryDAO.replylist(boardno, start, end);
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
        return GalleryDAO.replydetail(idx);
    }
    // 4. �뙎湲� �닔�젙
    @Override
    public void replyupdate(ReplyVO vo) {
    	GalleryDAO.replyupdate(vo);
    }
    // 5. �뙎湲� �궘�젣
    @Override
    public void replydelete(Integer boardno) {
    	GalleryDAO.replydelete(boardno);
    }
    // 6. �뙎湲� 媛��닔
    @Override
    public int replycount(Integer boardno) {
        return GalleryDAO.replycount(boardno);
    }
}