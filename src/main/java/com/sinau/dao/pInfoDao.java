package com.sinau.dao;

import java.util.HashMap;
import java.util.List;

<<<<<<< HEAD
=======
import org.apache.ibatis.annotations.Param;

import com.sinau.dto.LikesDto;
import com.sinau.dto.OnInfoDto;
>>>>>>> parent of 28d43fa... 0810sl2
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
