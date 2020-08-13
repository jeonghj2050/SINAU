package com.sinau.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.LikesDto;
import com.sinau.dto.OffInfoDto;
import com.sinau.dto.OffLInfoDto;
import com.sinau.dto.OnInfoDto;

public interface ClassInfoOffDao {
	   //상세페이지 좋아요 정보 가져오기
	   LikesDto off_getLikes(@Param("ofc_code")String onc_code,@Param("email")String email);
	   
	   //좋아요 상태 수정
	   void off_like_check(@Param("ofc_code")String onc_code,@Param("email")String email);

	   //좋아요 카운트 증가
	   void off_like_up(String ofc_code);

	   //좋아요 취소 상태 수정
	   void off_dislike_check(@Param("ofc_code")String onc_code,@Param("email")String email);

	   //좋아요 취소 카운트 감소
	   void off_dislike_down(String ofc_code);

	   //좋아요 기록 검색
	   String off_searchLike(@Param("ofc_code")String onc_code,@Param("email")String email);

	   //처음 좋아요 누를 시 좋아요 입력
	   void off_like_input(LikesDto likes);

	   //아이디에 따른 좋아요 상태 가져오기
	   List<OffInfoDto> offLInfo(HashMap<String, Object> hashMap);

	   
	   List<OffLInfoDto> cInfoOff(String ofc_code);

}
