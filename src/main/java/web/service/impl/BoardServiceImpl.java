package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BoardDao;
import web.dto.Board;
import web.service.face.BoardService;
import web.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired private BoardDao boardDao;

	@Override
	public Paging getPaging(Paging curPage) {
		
		//전체 게시글 수 조회
		int totalCount = boardDao.selectCntAll();
		
		//페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage.getCurPage());
				
		return paging;
	}
	
	@Override
	public List<Board> list(Paging paging) {
		
		return boardDao.selectList(paging);
	}

	@Override
	public Board boardView(Board viewBoard) {
		
		boardDao.updateHit(viewBoard);
		
		return boardDao.selectBoardByBoardNo(viewBoard);
	}

	@Override
	public void write(Board board) {
		boardDao.write(board);
	}
	
	@Override
	public void update(Board board) {
		boardDao.update(board);
	}

	@Override
	public void delete(Board board) {
		boardDao.delete(board);
	}

}















