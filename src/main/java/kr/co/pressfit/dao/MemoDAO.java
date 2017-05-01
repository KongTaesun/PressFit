package kr.co.pressfit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.pressfit.vo.MemoVO;


// interface+구현 ?��?��?��+mapper
//@Repository // ?��붙여?�� ?��
public interface MemoDAO {
	String list_memo = "select * from memo order by idx desc";	
	String insert_memo = "insert into memo (writer,memo) "
			+ "values (#{writer}, #{memo} )";
	
	@Select(list_memo)
	public List<MemoVO> list();
	
//	@Insert(insert_memo)
//	public void insert(MemoVO vo);
	
	@Insert(insert_memo)
	public void insert(
@Param("writer") String writer, @Param("memo") String memo);
	
	@Select("select * from memo where idx=#{idx}")
	public MemoVO memo_view(@Param("idx") int idx);
	
	@Update(
"update memo set writer=#{writer}, memo=#{memo} where idx=#{idx}")
	public void memo_update(MemoVO vo);
	
	@Delete("delete memo where idx=#{idx}")
	public void memo_delete(@Param("idx") int idx);
}












