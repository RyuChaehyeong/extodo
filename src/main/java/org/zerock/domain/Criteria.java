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
	
	//type을 arr로 변경시켜서 배열로 리턴
	//typeArr라는 필드는 없지만 getTypeArr라는 method가 있어서 mapper.xml에서
	//getListWithPaging에서 typeArr를 foreach 태그에서 사용할 수 있음
	//collection에다가 typeArr를 씀
	public String[] getTypeArr() {
		if (this.type == null) {
			return new String[] {};
		} else {
			return type.split("");
		}
	}
}
