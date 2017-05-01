package kr.co.pressfit.memo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.pressfit.vo.MemoVO;



@Service
public class MemoServiceImpl implements MemoService {

	@Inject 
	MemoDAO memoDao;
	
	
	@Override
	public List<MemoVO> list() {
		return memoDao.list();
	}
	@Override
	public void insert(MemoVO vo) {
		//memoDao.insert(vo); 
	}
	@Override
	public void insert(String writer, String memo) {
		memoDao.insert(writer, memo); 
	}
	@Override
	public MemoVO memo_view(int idx) {
		return memoDao.memo_view(idx);
	}
	@Override
	public void update(MemoVO vo) {
		memoDao.memo_update(vo); 
	}
	@Override
	public void delete(int idx) {
		memoDao.memo_delete(idx); 
	}

}






