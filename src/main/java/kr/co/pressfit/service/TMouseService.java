package kr.co.pressfit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.TMouseVO;
 
public interface TMouseService {
    public void create(TMouseVO vo) throws Exception;
    public TMouseVO read(int idx) throws Exception;
    public void update(TMouseVO vo) throws Exception;
    public void delete(int idx) throws Exception;
    public List<TMouseVO> listAll(int start, int end, String searchOption, String keyword, int minPrice, int maxPrice, String id) throws Exception;
    public void increaseViewcnt(int bno, HttpSession session) throws Exception;
    public int countArticle(String searchOption, String keyword, String id) throws Exception;
    public void addAttach(String fullName);
    public List<String> getAttach(int idx);
    public void updateAttach(String fullName, int idx);
    public void deleteFile(String fullname);
    public void replycreate(ReplyVO vo);
    public void replycreatecmt(ReplyVO vo);
    public List<ReplyVO> replylist(Integer boardno, int start, int end, HttpSession session);
    public ReplyVO replydetail(Integer idx);
    public void replyupdate(ReplyVO vo);
    public void replydelete(Integer boardno);
    public int replycount(Integer boardno);
	public void buy(TMouseVO vo) throws Exception;
}