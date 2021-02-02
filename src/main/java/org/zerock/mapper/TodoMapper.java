package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.TodoVO;

public interface TodoMapper {
	
	//@Select("SELECT * FROM tbl_todo WHERE num > 0")
	public List<TodoVO> getList();
	
	public void insert(TodoVO todo);
	
	public void insertSelectKey(TodoVO todo);
	
	public TodoVO read(Long num);
	
	public int delete(Long num);
	
	public int update(TodoVO todo);
	
}
