package org.zerock.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.mapper.TodoMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	
	public MemberMapper mapper;

	@Override
	public int register(MemberVO vo) {
		return mapper.register(vo);
	}

	@Override
	public int registerAuth(AuthVO authVo) {
		return mapper.registerAuth(authVo);
	}
	


	
	
}
