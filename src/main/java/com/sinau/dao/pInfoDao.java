package com.sinau.dao;

import java.util.List;
import com.sinau.dto.PReviewDto;

public interface pInfoDao {
	
	public List<PReviewDto> getReviewList(String prv_p_code);
	
	//댓글 저장 메소드
	public void reviewInsert(PReviewDto review);
	
//(월요일 학원가서 물어보기)
	//아이디체크
	public String replyUserIdCheck(String prv_code);

	//댓글 삭제
	public void deleteReply(String prv_code);
//여기까지

	public PReviewDto getReview(String prv_code);
	
	
	
	

	
}
