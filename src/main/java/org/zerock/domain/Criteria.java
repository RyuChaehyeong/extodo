package org.zerock.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//type�� arr�� ������Ѽ� �迭�� ����
	//typeArr��� �ʵ�� ������ getTypeArr��� method�� �־ mapper.xml����
	//getListWithPaging���� typeArr�� foreach �±׿��� ����� �� ����
	//collection���ٰ� typeArr�� ��
	public String[] getTypeArr() {
		if (this.type == null) {
			return new String[] {};
		} else {
			return type.split("");
		}
	}
}
