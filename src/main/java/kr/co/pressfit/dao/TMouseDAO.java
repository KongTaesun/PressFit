package kr.co.pressfit.dao;


import java.util.List;

import kr.co.pressfit.vo.TMouseVO;
import kr.co.pressfit.vo.ReplyVO;

public interface TMouseDAO {
	// 01. 寃뚯떆湲� �옉�꽦
    public void create(TMouseVO vo) throws Exception;
    public void createcmt(TMouseVO vo) throws Exception;
    // 02. 寃뚯떆湲� �긽�꽭蹂닿린
    public TMouseVO read(int idx) throws Exception;
    // 03. 寃뚯떆湲� �닔�젙
    public void update(TMouseVO vo) throws Exception;
    // 04. 寃뚯떆湲� �궘�젣
    public void delete(int idx) throws Exception;
    // 05. 寃뚯떆湲� �쟾泥� 紐⑸줉
    public List<TMouseVO> listAll(int start, int end, String searchOption, String keyword, int minPrice, int maxPrice, String id) throws Exception;
    // 06. 寃뚯떆湲� 議고쉶�닔 利앷�
    public void increaseViewcnt(int idx) throws Exception;
    // 07. 寃뚯떆湲� �젅肄붾뱶 媛��닔
    public int countArticle(String searchOption, String keyword, String id) throws Exception;
    // 寃뚯떆湲� 泥⑤��뙆�씪 異붽�
    public void addAttach(String fullName);
    // 寃뚯떆湲� 泥⑤��뙆�씪 紐⑸줉
    public List<String> getAttach(int idx);
    // 寃뚯떆湲� 泥⑤��뙆�씪 �닔�젙泥섎━
    public void updateAttach(String fullName, int idx);
    // 寃뚯떆湲� 泥⑤��뙆�씪 �궘�젣泥섎━
    public void deleteFile(String fullname);
    public void replycreate(ReplyVO vo);
    public void replycreatecmt(ReplyVO vo);
    // 2. �뙎湲� 紐⑸줉
    public List<ReplyVO> replylist(Integer boardno,  int start, int end);
    // 3. �뙎湲� �긽�꽭蹂닿린
    public ReplyVO replydetail(Integer idx);
    // 4. �뙎湲� �닔�젙
    public void replyupdate(ReplyVO vo);
    // 5. �뙎湲� �궘�젣
    public void replydelete(Integer idx);
    // 6. �뙎湲� 媛��닔
    public int replycount(Integer boardno);
    
}