package com.sinau.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.LikesDto;
import com.sinau.dto.OnInfoDto;
import com.sinau.dto.SpecListDto;

public interface ClassInfoDao {

	//spec 이미지 가져오기
	List<SpecListDto> SpecList(String onc_code);

	//상세페이지 내용 가져오기
	List<OnInfoDto> onInfo(String onc_code);

	//상세페이지 좋아요 정보 수정
//	void updateLikes(HashMap<String, Object> hashMap);
	
	//상세페이지 좋아요 정보 가져오기
	LikesDto getLikes(@Param("onc_code")String onc_code,@Param("email")String email);
	
	//좋아요 값 1증가 시키기
	//void inputLCnt(HashMap<String, Object> hashMap);

	//좋아요 한게 있는지 확인하기
//	LikesDto checkLike(HashMap<String, Object> hashMap);

	//좋아요 상태 수정
	void like_check(@Param("onc_code")String onc_code,@Param("email")String email);

	//좋아요 카운트 증가
	void like_up(String onc_code);

	//좋아요 취소 상태 수정
	void dislike_check(@Param("onc_code")String onc_code,@Param("email")String email);

	//좋아요 취소 카운트 감소
	void dislike_down(String onc_code);

	//좋아요 기록 검색
	String searchLike(@Param("onc_code")String onc_code,@Param("email")String email);

	//처음 좋아요 누를 시 좋아요 입력
	void like_input(LikesDto likes);

	//아이디에 따른 좋아요 상태 가져오기
	List<OnInfoDto> onLInfo(HashMap<String, Object> hashMap);

	//상세화면 접속시 조회수 증가 
	void viewUpdate(String onc_code);


	
}
