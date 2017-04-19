package kr.co.pressfit.dao;


import java.util.List;

import kr.co.pressfit.vo.TMouseVO;
import kr.co.pressfit.vo.ReplyVO;

public interface TMouseDAO {
	// 01. 게시글 작성
    public void create(TMouseVO vo) throws Exception;
    public void createcmt(TMouseVO vo) throws Exception;
    // 02. 게시글 상세보기
    public TMouseVO read(int idx) throws Exception;
    // 03. 게시글 수정
    public void update(TMouseVO vo) throws Exception;
    // 04. 게시글 삭제
    public void delete(int idx) throws Exception;
    // 05. 게시글 전체 목록
    public List<TMouseVO> listAll(int start, int end, String searchOption, String keyword, int minPrice, int maxPrice, String id) throws Exception;
    // 06. 게시글 조회수 증가
    public void increaseViewcnt(int idx) throws Exception;
    // 07. 게시글 레코드 갯수
    public int countArticle(String searchOption, String keyword, String id) throws Exception;
    // 게시글 첨부파일 추가
    public void addAttach(String fullName);
    // 게시글 첨부파일 목록
    public List<String> getAttach(int idx);
    // 게시글 첨부파일 수정처리
    public void updateAttach(String fullName, int idx);
    // 게시글 첨부파일 삭제처리
    public void deleteFile(String fullname);
    public void replycreate(ReplyVO vo);
    public void replycreatecmt(ReplyVO vo);
    // 2. 댓글 목록
    public List<ReplyVO> replylist(Integer boardno,  int start, int end);
    // 3. 댓글 상세보기
    public ReplyVO replydetail(Integer idx);
    // 4. 댓글 수정
    public void replyupdate(ReplyVO vo);
    // 5. 댓글 삭제
    public void replydelete(Integer idx);
    // 6. 댓글 갯수
    public int replycount(Integer boardno);
}