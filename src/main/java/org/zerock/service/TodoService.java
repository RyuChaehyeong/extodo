package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.TodoVO;

public interface TodoService {
	
	public void register(TodoVO todo);
	
	public TodoVO get(Long num);
	
	public boolean modify(TodoVO todo);
	
	public boolean remove(Long num);
	
	//public List<TodoVO> getList();
	
	public List<TodoVO> getListWithPaging(Criteria cri);

	public int getTotal(Criteria cri);
}
