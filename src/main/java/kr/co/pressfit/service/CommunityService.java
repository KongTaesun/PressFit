package kr.co.pressfit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.CommunityVO;
 
public interface CommunityService {
    // 01. 게시글 작성
    public void create(CommunityVO vo) throws Exception;
    public void createcmt(CommunityVO vo) throws Exception ;
    // 02. 게시글 상세보기
    public CommunityVO read(int idx) throws Exception;
    // 03. 게시글 수정
    public void update(CommunityVO vo) throws Exception;
    // 04. 게시글 삭제
    public void delete(int idx) throws Exception;
    // 05. 게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
    public List<CommunityVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
    // 06. 게시글 조회
    public void increaseViewcnt(int bno, HttpSession session) throws Exception;
    // 07. 게시글 레코드 갯수 메서드 추가
    public int countArticle(String searchOption, String keyword) throws Exception;
    //파일
    public void addAttach(String fullName);
    public List<String> getAttach(int idx);
    public void updateAttach(String fullName, int idx);
    public void deleteFile(String fullname);
    
    // 1. 댓글 입력
    public void replycreate(ReplyVO vo);
    public void replycreatecmt(ReplyVO vo);
    // 2. 댓글 목록
    public List<ReplyVO> replylist(Integer boardno, int start, int end, HttpSession session);
    // 3. 댓글 상세보기
    public ReplyVO replydetail(Integer idx);
    // 4. 댓글 수정
    public void replyupdate(ReplyVO vo);
    // 5. 댓글 삭제
    public void replydelete(Integer boardno);
    // 6. 댓글 갯수
    public int replycount(Integer boardno);
}