package org.zerock.mapper;

import static org.junit.Assert.*;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] numArr = {189L, 188L, 187L, 186L, 185L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	
	@Test
	public void testExist() {
		assertNotNull(mapper);
	}

	@Test
	public void testCreate() {
		ReplyVO vo = new ReplyVO();
		vo.setNum(221L);
		vo.setReply("대레대레댓글");
		vo.setReplyer("행인");
		
		log.info(mapper.insert(vo));
		
		//실패해야 테스트 성공
		try {
			vo.setNum(220L);
			mapper.insert(vo);
			fail();
		} catch (Exception e) {
			log.warn("테스트 성공");
		}
	}
	
	@Test
	public void testCreateBook() {
		IntStream.range(1, 70).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			vo.setNum(numArr[i % 5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);
			mapper.insert(vo);
			
		});
	}
	
	@Test
	public void testRead() {
		log.warn(mapper.read(76L));
	}
	
	@Test
	public void testDelete() {
		log.warn(mapper.delete(75L));
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = mapper.read(71L);
		vo.setReply("updated reply");
		log.warn(mapper.update(vo));
	}
	
	@Test
	public void testGetListWithPaging() {
		mapper.getListWithPaging(null, 221L);
	}
}
