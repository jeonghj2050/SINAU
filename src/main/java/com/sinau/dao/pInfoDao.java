package com.sinau.dao;

import java.util.List;

import com.sinau.dto.PReviewDto;

public interface pInfoDao {
	
	public List<PReviewDto> getReviewList(String prv_p_code);
	
	//댓글 저장 메소드
	public void reviewInsert(PReviewDto review);

	
	

	
}
