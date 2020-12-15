package web.service.face;

import web.dto.Member;

public interface MemberService {
	
	public boolean join(Member writer);

	public boolean login(Member writer);

	public String getUsernick(Member writer);

}
