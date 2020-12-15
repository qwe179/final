package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired private MemberDao memberDao;
	
	@Override
	public boolean join(Member writer) {
		if(memberDao.selectByUserid(writer)>0)
			return false;
		
		memberDao.join(writer);
		
		if(memberDao.selectByUserid(writer)>0)
			return true;
		else return false;
	}

	@Override
	public boolean login(Member writer) {
		int loginChk = memberDao.login(writer);
		
		if(loginChk > 0)	return true;
		else return false;
	}

	@Override
	public String getUsernick(Member writer) {
		return memberDao.getUsernick(writer);
	}
	
}
