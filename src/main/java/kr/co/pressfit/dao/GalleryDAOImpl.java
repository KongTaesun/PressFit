package kr.co.pressfit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.GalleryVO;
import kr.co.pressfit.vo.FileVO;
 
@Repository    // 현재 클래스를 dao bean으로 등록
public class GalleryDAOImpl implements GalleryDAO {
    @Inject
    SqlSession SqlSession;
    String name = "gallery";
    // 01. 게시글 작성
    @Override
    public void create(GalleryVO vo) throws Exception {
        SqlSession.insert(name+".insert", vo);
    }
    @Override
    public void createcmt(GalleryVO vo) throws Exception {
    	SqlSession.update(name+".cmt", vo);
        SqlSession.insert(name+".insertcmt", vo);
    }
    // 02. 게시글 상세보기
    @Override
    public GalleryVO read(int idx) throws Exception {
        return SqlSession.selectOne(name+".view", idx);
    }
    // 03. 게시글 수정
    @Override
    public void update(GalleryVO vo) throws Exception {
        SqlSession.update(name+".updateArticle", vo);
 
    }
    // 04. 게시글 삭제
    @Override
    public void delete(int idx) throws Exception {
        SqlSession.delete(name+".deleteArticle",idx);
 
    }
    // 05. 게시글 전체 목록
    @Override
    public List<GalleryVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
        // 검색옵션, 키워드 맵에 저장
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchOption", searchOption);
        map.put("keyword", keyword);
        // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
        map.put("start", start);
        map.put("end", end);
        return SqlSession.selectList(name+".listAll", map);
    }

    // 06. 게시글 조회수 증가
    @Override
    public void increaseViewcnt(int idx) throws Exception {
        SqlSession.update(name+".increaseViewcnt", idx);
    }
    // 07. 게시글 레코드 갯수
    @Override
    public int countArticle(String searchOption, String keyword) throws Exception {
    	// 검색옵션, 키워드 맵에 저장
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("searchOption", searchOption);
    	map.put("keyword", keyword);
    	return SqlSession.selectOne(name+".countArticle", map);
    }
    // 게시글 첨부파일 추가
    @Override
    public void addAttach(String fullName) {
    	FileVO file = new FileVO();
    	file.setFullname(fullName);
    	SqlSession.insert(name+".addAttach", file);
    }
    // 게시글 첨부파일 목록
    @Override
    public List<String> getAttach(int idx) {
        return SqlSession.selectList(name+".getAttach", idx);
    }

    // 게시글 첨부파일 수정처리
    @Override
    public void updateAttach(String fullName, int idx) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("fullName", fullName);
        map.put("idx", idx);
        SqlSession.insert(name+".updateAttach", map);
    }
    // 게시글 첨부파일 삭제처리
    @Override
    public void deleteFile(String fullname) {
    	SqlSession.delete(name+".deleteAttach", fullname);
    }
    @Override
    public void replycreate(ReplyVO vo) {
    	SqlSession.insert(name+".insertReply", vo);
    }
    @Override
    public void replycreatecmt(ReplyVO vo) {
    	SqlSession.update(name+".cmtreply", vo);
    	SqlSession.insert(name+".insertReplycmt", vo);
    }
    // 2. 댓글 목록
    @Override
    public List<ReplyVO> replylist(Integer boardno,  int start, int end) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardno", boardno);
        map.put("start", start);
        map.put("end", end);
        return SqlSession.selectList(name+".listReply", map);
    }
    // 3. 댓글 상세보기
    @Override
    public ReplyVO replydetail(Integer idx) {
        return SqlSession.selectOne(name+".detailReply", idx);
    }
    // 4. 댓글 수정
    @Override
    public void replyupdate(ReplyVO vo) {
    	SqlSession.update(name+".updateReply", vo);
    }
    // 5. 댓글 삭제
    @Override
    public void replydelete(Integer idx) {
    	SqlSession.delete(name+".deleteReply", idx);
    }
    // 6. 댓글 갯수
    @Override
    public int replycount(Integer boardno) {
        return SqlSession.selectOne(name+".countReply", boardno);
    }
}