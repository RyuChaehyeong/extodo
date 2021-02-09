package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;
import org.zerock.mapper.TodoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	
	private TodoMapper mapper2;
	
	@Override
	@Transactional
	public int regiter(ReplyVO vo) {
		mapper2.updateReplyCnt(vo.getNum(), 1);
		return mapper.insert(vo);
		
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	@Transactional
	public int remove(Long rno) {
		ReplyVO vo = mapper.read(rno);
		mapper2.updateReplyCnt(vo.getNum(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getListWithPaging(Criteria cri, Long num) {
		return mapper.getListWithPaging(cri, num);
	}

}
