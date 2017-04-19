package kr.co.pressfit.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.pressfit.dao.FaqDAO;
import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.FaqVO;
 
 
@Service
public class FaqServiceImpl implements FaqService {
    
    @Inject
    FaqDAO faqDAO;
    
    // 01. 게시글쓰기
    @Transactional // 트랜잭션 처리 메서드로 설정
    @Override
    public void create(FaqVO vo) throws Exception {
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
        faqDAO.create(vo);
        System.out.println(vo);
        // 게시물의 첨부파일 정보 등록
        String[] files = vo.getFilelist(); // 첨부파일 배열
        if(files == null) return; // 첨부파일이 없으면 메서드 종료
        // 첨부파일들의 정보를 tbl_attach 테이블에 insert
        for(String name : files){ 
        	faqDAO.addAttach(name);
        }

    }
    // 01. 게시글쓰기
    @Transactional // 트랜잭션 처리 메서드로 설정
    @Override
    public void createcmt(FaqVO vo) throws Exception {
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
        faqDAO.createcmt(vo);
        System.out.println(vo);
        // 게시물의 첨부파일 정보 등록
        String[] files = vo.getFilelist(); // 첨부파일 배열
        if(files == null) return; // 첨부파일이 없으면 메서드 종료
        // 첨부파일들의 정보를 tbl_attach 테이블에 insert
        for(String name : files){ 
        	faqDAO.addAttach(name);
        }

    }
    // 02. 게시글 상세보기
    @Override
    public FaqVO read(int idx) throws Exception {
        return faqDAO.read(idx);
    }
    // 03. 게시글 수정
    @Override
    public void update(FaqVO vo) throws Exception {
    	faqDAO.update(vo);
    }
    // 04. 게시글 삭제
    @Override
    public void delete(int idx) throws Exception {
    	faqDAO.delete(idx);
    }
    // 05. 게시글 전체 목록 boardDAO.listAll메서드 호출
    @Override
    public List<FaqVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
        return faqDAO.listAll(start, end, searchOption, keyword);
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
        	faqDAO.increaseViewcnt(idx);
            // 세션에 시간을 저장 : "update_time_"+bno는 다른변수와 중복되지 않게 명명한 것
            session.setAttribute("update_time_"+idx, current_time);
            
        }
    }
    // 07. 게시글 레코드 갯수 boardDao.countArticle메서드 
    @Override
    public int countArticle(String searchOption, String keyword) throws Exception {
    	return faqDAO.countArticle(searchOption, keyword);
    }
    // 게시글의 첨부파일 목록
    @Override
    public void addAttach(String fullName) {
    	faqDAO.addAttach(fullName);
    }
    // 게시글의 첨부파일 목록
    @Override
    public List<String> getAttach(int idx) {
        return faqDAO.getAttach(idx);
    }
    // 게시글의 첨부파일 목록
    @Override
    public void updateAttach(String fullName, int idx) {
    	faqDAO.updateAttach(fullName,idx);
    }
    // 게시글의 첨부파일 삭제 처리
    @Override
    public void deleteFile(String fullname) {
    	faqDAO.deleteFile(fullname);
    }
    // 1. 댓글 입력
    @Override
    public void replycreate(ReplyVO vo) {
    	faqDAO.replycreate(vo);
    }
    // 1. 댓글 입력
    @Override
    public void replycreatecmt(ReplyVO vo) {
    	faqDAO.replycreatecmt(vo);
    }
    // 2. 댓글 목록
    @Override
    public List<ReplyVO> replylist(Integer boardno, int start, int end, HttpSession session) {
        List<ReplyVO> items = faqDAO.replylist(boardno, start, end);
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
        return faqDAO.replydetail(idx);
    }
    // 4. 댓글 수정
    @Override
    public void replyupdate(ReplyVO vo) {
    	faqDAO.replyupdate(vo); 
    }
    // 5. 댓글 삭제
    @Override
    public void replydelete(Integer boardno) {
    	faqDAO.replydelete(boardno);
    }
    // 6. 댓글 갯수
    @Override
    public int replycount(Integer boardno) {
        return faqDAO.replycount(boardno);
    }
}