package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TodoVO {
	private Long num;
	private String title;
	private String writer;
	private Date dueDate;
}
