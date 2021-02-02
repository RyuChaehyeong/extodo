package org.zerock.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.TodoVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TodoMapperTests {

	@Setter(onMethod_ = @Autowired)
	private TodoMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(todo -> log.info(todo));
	}
	
	@Test
	public void testInsert() {
		TodoVO todo = new TodoVO();
		todo.setTitle("새할릴");
		todo.setWriter("용가리");
		mapper.insert(todo);
		log.info(todo);
	}
	
	@Test
	public void testInsertSelectKey() {
		TodoVO todo = new TodoVO();
		todo.setTitle("새할릴 select key");
		todo.setWriter("쓰니 select key");
		mapper.insertSelectKey(todo);
		
		log.info(todo);
		
	}
	
	@Test
	public void testRead() {
		TodoVO todo = mapper.read(22L);
		log.info(todo);
	}

	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(22L));
	}
	
	@Test
	public void testUpdate() {
		TodoVO todo = mapper.read(21L);
		todo.setTitle("수정된 할일");
		todo.setWriter("김수정입니다.");
		
		log.info("UPDATE COUNT: " + mapper.update(todo));
		
		
		
	} 
}
