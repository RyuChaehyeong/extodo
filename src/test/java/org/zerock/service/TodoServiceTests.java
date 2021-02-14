package org.zerock.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.TodoVO;
import org.zerock.mapper.TodoMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TodoServiceTests {

	@Setter(onMethod_ = @Autowired)
	private TodoService service;
	
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		TodoVO todo = new TodoVO();
		todo.setTitle("계획");
		todo.setWriter("뉴비");
		
		service.register(todo);
		
		log.info("생성된 할일 번호: " + todo.getNum());
	}
	
	/*
	@Test
	public void testGetList() {
		
		service.getList().forEach(todo -> log.info(todo));
	}
	*/
	
	@Test
	public void testGetListWithPaging() {
		Criteria cri = new Criteria(1, 10);
		List<TodoVO> list = service.getListWithPaging(cri);
		assertEquals(10, list.size());
	}
	
	
	@Test
	public void testRead() {
		log.info(service.get(23L));
	}
	
	@Test
	public void testDelete() {
		log.info("remove Result: " + service.remove(23L));
		
	}
	
	@Test
	public void testUpdate() {
		TodoVO todo = service.get(21L);
		
		if (todo == null) {
			return;
		}
		
		todo.setTitle("흠냐흠냐");
		
		log.info("MODIFY RESULT: " + service.modify(todo));
	}
}
