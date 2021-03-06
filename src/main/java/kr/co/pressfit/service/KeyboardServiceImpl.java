package kr.co.pressfit.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.pressfit.dao.KeyboardDAO;
import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.KeyboardVO;
 
 
@Service
public class KeyboardServiceImpl implements KeyboardService {
    
    @Inject
    KeyboardDAO keyboardDAO;
    
    // 01. 게시글쓰기
    @Transactional // 트랜잭션 처리 메서드로 설정
    @Override
    public void create(KeyboardVO vo) throws Exception {
    	keyboardDAO.create(vo);
    }
    // 02. 게시글 상세보기
    @Override
    public KeyboardVO read(int idx) throws Exception {
        return keyboardDAO.read(idx);
    }
    // 03. 게시글 수정
    @Override
    public void update(KeyboardVO vo) throws Exception {
    	keyboardDAO.update(vo);
    }
    // 04. 게시글 삭제
    @Override
    public void delete(int idx) throws Exception {
    	keyboardDAO.delete(idx);
    }
    // 05. 게시글 전체 목록 boardDAO.listAll메서드 호출
    @Override
    public List<KeyboardVO> listAll(int start, int end, String searchOption, String keyword, int minPrice, int maxPrice, String id) throws Exception {
        return keyboardDAO.listAll(start, end, searchOption, keyword, minPrice, maxPrice, id);
    }
    // 06. 게시글 조회수 증가
    @Override
    public void increaseViewcnt(int idx, HttpSession session) throws Exception {
    	float update_time = 0;
        // 세션에 저장된 조회시간 검색
        // 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
        if(session.getAttribute("update_time_"+idx) != null){
                                // 세션에서 읽어오기
            update_time = Float.parseFloat(String.valueOf(session.getAttribute("update_time_"+idx)));
        }
        // 시스템의 현재시간을 current_time에 저장
        long current_time = System.currentTimeMillis();
        // 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
        // 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
        if(current_time - update_time > 5*1000){
        	keyboardDAO.increaseViewcnt(idx);
            // 세션에 시간을 저장 : "update_time_"+bno는 다른변수와 중복되지 않게 명명한 것
            session.setAttribute("update_time_"+idx, current_time);
            
        }
    }
    // 07. 게시글 레코드 갯수 boardDao.countArticle메서드 
    @Override
    public int countArticle(String searchOption, String keyword, String id) throws Exception {
    	return keyboardDAO.countArticle(searchOption, keyword, id);
    }
    // 게시글의 첨부파일 목록
    @Override
    public void addAttach(String fullName) {
        keyboardDAO.addAttach(fullName);
    }
    // 게시글의 첨부파일 목록
    @Override
    public List<String> getAttach(int idx) {
        return keyboardDAO.getAttach(idx);
    }
    // 게시글의 첨부파일 목록
    @Override
    public void updateAttach(String fullName, int idx) {
        keyboardDAO.updateAttach(fullName,idx);
    }
    // 게시글의 첨부파일 삭제 처리
    @Override
    public void deleteFile(String fullname) {
    	keyboardDAO.deleteFile(fullname);
    }
    // 1. 댓글 입력
    @Override
    public void replycreate(ReplyVO vo) {
    	keyboardDAO.replycreate(vo);
    }
    // 1. 댓글 입력
    @Override
    public void replycreatecmt(ReplyVO vo) {
    	keyboardDAO.replycreatecmt(vo);
    }
    // 2. 댓글 목록
    @Override
    public List<ReplyVO> replylist(Integer boardno, int start, int end, HttpSession session) {
        List<ReplyVO> items = keyboardDAO.replylist(boardno, start, end);
        // 세션에서 현재 사용자 id값 저장
        String id = (String) session.getAttribute("id");

        for(ReplyVO vo : items){
            // 댓글 목록중에 중에 비밀 댓글이 있을 경우
            if(vo.getSecret_reply().equals("y")){
                if(id == null){ // 비로그인 상태면 비밀 댓글로 처리
                    vo.setReplytext("비밀 댓글입니다.");
                } else { // 로그인 상태일 경우
                    String replyer = vo.getReplayer(); // 댓글 작성자 저장
                    // 로그인한 사용자가 게시물의 작성자X 댓글 작성자도 X 비밀댓글로 처리
                    if(!id.equals(replyer)) {
                        vo.setReplytext("비밀 댓글입니다.");
                    }
                }
            }
        }
        return items; 
    }
    // 3. 댓글 상세보기
    @Override
    public ReplyVO replydetail(Integer idx) {
        return keyboardDAO.replydetail(idx);
    }
    // 4. 댓글 수정
    @Override
    public void replyupdate(ReplyVO vo) {
    	keyboardDAO.replyupdate(vo);
    }
    // 5. 댓글 삭제
    @Override
    public void replydelete(Integer boardno) {
    	keyboardDAO.replydelete(boardno);
    }
    // 6. 댓글 갯수
    @Override
    public int replycount(Integer boardno) {
        return keyboardDAO.replycount(boardno);
    }
}