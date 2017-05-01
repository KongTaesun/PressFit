package kr.co.pressfit.service;

import java.util.List;

import kr.co.pressfit.vo.MemoVO;


public interface MemoService {
	public List<MemoVO> list();
	public void insert(MemoVO vo);
	public void insert(String writer, String memo);
	public MemoVO memo_view(int idx);
	public void update(MemoVO vo);
	public void delete(int idx);
}
