package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String id);
	
	public int register(MemberVO vo);
	
	public int registerAuth(AuthVO authVo);
	
	public String get(String email);
}
