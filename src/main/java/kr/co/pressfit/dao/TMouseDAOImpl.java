package kr.co.pressfit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.pressfit.vo.ReplyVO;
import kr.co.pressfit.vo.FileVO;
import kr.co.pressfit.vo.TMouseVO;
 
@Repository    // �쁽�옱 �겢�옒�뒪瑜� dao bean�쑝濡� �벑濡�
public class TMouseDAOImpl implements TMouseDAO {
    @Inject
    SqlSession SqlSession;
    String name = "tmouse";
    // 01. 寃뚯떆湲� �옉�꽦
    @Override
    public void create(TMouseVO vo) throws Exception {
        SqlSession.insert(name+".insert", vo);
    }
    @Override
    public void createcmt(TMouseVO vo) throws Exception {
    	SqlSession.update(name+".cmt", vo);
        SqlSession.insert(name+".insertcmt", vo);
    }
    // 02. 寃뚯떆湲� �긽�꽭蹂닿린
    @Override
    public TMouseVO read(int idx) throws Exception {
        return SqlSession.selectOne(name+".view", idx);
    }
    // 03. 寃뚯떆湲� �닔�젙
    @Override
    public void update(TMouseVO vo) throws Exception {
        SqlSession.update(name+".updateArticle", vo);
 
    }
    // 04. 寃뚯떆湲� �궘�젣
    @Override
    public void delete(int idx) throws Exception {
        SqlSession.delete(name+".deleteArticle",idx);
 
    }
    // 05. 寃뚯떆湲� �쟾泥� 紐⑸줉
    @Override
    public List<TMouseVO> listAll(int start, int end, String searchOption, String keyword, int minPrice, int maxPrice, String id) throws Exception {
         // 寃��깋�샃�뀡, �궎�썙�뱶 留듭뿉 ���옣
         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("searchOption", searchOption);
         map.put("keyword", keyword);
         map.put("minPrice", minPrice);
         map.put("maxPrice", maxPrice);
         map.put("id", id);
         // BETWEEN #{start}, #{end}�뿉 �엯�젰�맆 媛믪쓣 留듭뿉 
         map.put("start", start);
         map.put("end", end);
         return SqlSession.selectList(name+".listAll", map);
     }

    // 06. 寃뚯떆湲� 議고쉶�닔 利앷�
    @Override
    public void increaseViewcnt(int idx) throws Exception {
        SqlSession.update(name+".increaseViewcnt", idx);
    }
    // 07. 寃뚯떆湲� �젅肄붾뱶 媛��닔
    @Override
    public int countArticle(String searchOption, String keyword, String id) throws Exception {
    	// 寃��깋�샃�뀡, �궎�썙�뱶 留듭뿉 ���옣
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("searchOption", searchOption);
    	map.put("keyword", keyword);
    	map.put("id", id);
    	return SqlSession.selectOne(name+".countArticle", map);
    }
    // 寃뚯떆湲� 泥⑤��뙆�씪 異붽�
    @Override
    public void addAttach(String fullName) {
    	FileVO file = new FileVO();
    	file.setFullname(fullName);
    	SqlSession.insert(name+".addAttach", file);
    }
    // 寃뚯떆湲� 泥⑤��뙆�씪 紐⑸줉
    @Override
    public List<String> getAttach(int idx) {
        return SqlSession.selectList(name+".getAttach", idx);
    }

    // 寃뚯떆湲� 泥⑤��뙆�씪 �닔�젙泥섎━
    @Override
    public void updateAttach(String fullName, int idx) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("fullName", fullName);
        map.put("idx", idx);
        SqlSession.update(name+".updateAttach", map);
    }
    // 寃뚯떆湲� 泥⑤��뙆�씪 �궘�젣泥섎━
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
    // 2. �뙎湲� 紐⑸줉
    @Override
    public List<ReplyVO> replylist(Integer boardno,  int start, int end) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardno", boardno);
        map.put("start", start);
        map.put("end", end);
        return SqlSession.selectList(name+".listReply", map);
    }
    // 3. �뙎湲� �긽�꽭蹂닿린
    @Override
    public ReplyVO replydetail(Integer idx) {
        return SqlSession.selectOne(name+".detailReply", idx);
    }
    // 4. �뙎湲� �닔�젙
    @Override
    public void replyupdate(ReplyVO vo) {
    	SqlSession.update(name+".updateReply", vo);
    }
    // 5. �뙎湲� �궘�젣
    @Override
    public void replydelete(Integer idx) {
    	SqlSession.delete(name+".deleteReply", idx);
    }
    // 6. �뙎湲� 媛��닔
    @Override
    public int replycount(Integer boardno) {
        return SqlSession.selectOne(name+".countReply", boardno);
    }
}