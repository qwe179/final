package web.dao.face;

import web.dto.Member;

public interface MemberDao {

	public void join(Member writer);
	
	public int selectByUserid(Member writer);
	
	public int login(Member writer);
	
	public String getUsernick(Member writer);
}












