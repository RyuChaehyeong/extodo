package org.zerock.service;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public int register(MemberVO vo);
	
	public int registerAuth(AuthVO authVo);

	public String get(String email);
}
