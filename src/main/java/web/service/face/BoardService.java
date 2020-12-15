package web.service.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface BoardService {

	public Paging getPaging(Paging curPage);
	
	public List<Board> list(Paging paging);

	public Board boardView(Board viewBoard);

	public void write(Board board);
	
	public void update(Board board);

	public void delete(Board board);

}
