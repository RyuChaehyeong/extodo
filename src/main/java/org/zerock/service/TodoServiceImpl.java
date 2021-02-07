package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.TodoVO;
import org.zerock.mapper.TodoMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class TodoServiceImpl implements TodoService {

	public TodoMapper mapper;
	
	@Override
	public void register(TodoVO todo) {
		
		log.info("register..." + todo);
		mapper.insertSelectKey(todo);
	}

	@Override
	public TodoVO get(Long num) {
		
		log.info("get..... :" + num);
		return mapper.read(num);
	}

	@Override
	public boolean modify(TodoVO todo) {
		log.info("update...." + todo);
		return mapper.update(todo) == 1;
	}

	@Override
	public boolean remove(Long num) {
		log.info("remove..." + num);
		return mapper.delete(num) == 1;
	}

	@Override
	public List<TodoVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
/*
	@Override
	public List<TodoVO> getList() {
		return mapper.getList();
	}
*/
	
	
}
