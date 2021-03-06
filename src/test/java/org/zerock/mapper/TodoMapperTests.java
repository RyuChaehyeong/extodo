package org.zerock.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
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
	public void testSearch1() {
		Criteria cri = new Criteria();
		cri.setType("T");
		cri.setKeyword("test");
		mapper.getListWithPaging(cri);
	}
	
	@Test
	public void testSearch2() {
		Criteria cri = new Criteria();
		cri.setType("W");
		cri.setKeyword("test");
		mapper.getListWithPaging(cri);
	}
	
	@Test
	public void testSearch3() {
		Criteria cri = new Criteria();
		cri.setType("TW");
		cri.setKeyword("user");
		mapper.getListWithPaging(cri);
	}
	
	//검색 조건이 없는 경우에 잘 돌아가는 것 확인! 
	@Test
	public void testPaging() {
		Criteria cri = new Criteria(1, 5);
		List<TodoVO> list = mapper.getListWithPaging(cri);
		
		assertEquals(5, list.size());
		
		cri = new Criteria(1, 10);
		list = mapper.getListWithPaging(cri);
		
		assertEquals(10, list.size());
		
		cri = new Criteria(2, 5);
		list = mapper.getListWithPaging(cri);
		
		list.forEach(todo -> log.info("번호:" + todo.getNum()));
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
