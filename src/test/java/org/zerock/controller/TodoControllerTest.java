package org.zerock.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.zerock.service.TodoServiceTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class TodoControllerTest {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	/*
	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/todo/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	*/
	@Test
	public void testListPaging() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/todo/list")
				.param("pageNum", "1")
				.param("amount", "10"))
		.andReturn()
		.getModelAndView()
		.getModelMap());

	}
	
	@Test
	public void testRegister() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.post("/todo/register")
				.param("title", "테스트 새글0204")
				.param("writer", "user00"))
				.andReturn().getModelAndView().getViewName();
		
	}
	
	@Test
	public void testGet() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/todo/get")
				.param("num", "41"))
		.andReturn().getModelAndView().getModelMap();
		
	}
	
	@Test
	public void testModify() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/todo/modify")
				.param("num", "41")
				.param("title", "수수정이수정")
				.param("writer", "수수수수수정")
				)
		.andReturn().getModelAndView().getModelMap();
		
	}

	@Test
	public void testRemove() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/todo/remove")
				.param("num", "1"))
		.andReturn().getModelAndView().getModel();
	}
}
