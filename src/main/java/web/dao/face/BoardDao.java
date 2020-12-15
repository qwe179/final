package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface BoardDao {

	public int selectCntAll();
	
	public List<Board> selectList(Paging paging);
	
	public void updateHit(Board viewBoard);
	
	public Board selectBoardByBoardNo(Board viewBoard);

	public void write(Board board);
	
	public void update(Board board);

	public void delete(Board board);

}
