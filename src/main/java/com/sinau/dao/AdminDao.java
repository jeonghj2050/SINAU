package com.sinau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.AdQnaInfoDto;
import com.sinau.dto.AdminDto;

public interface AdminDao {
	//회원 승인 구분
	public List<AdminDto> getMemStateNm(int state);
	public List<AdminDto> getMemStateDm(int state);
	public List<AdminDto> getMemStateCm(int state);
	//회원 카운트
	public List<AdminDto> getMemCount();
	//회원삭제
	public void getMemDel(String email);
	//강의삭제
	//온라인
	public void getLecDel(String code);
	//오프라인
	public void getOfDel(String code);
	//유튜브
	public void getYDel(String code);
	//판매글 삭제
	public void getSaleDel(String code);
	//리뷰글 삭제 
	public void getReDel(String code);
	//신고글 삭제
	public void getWDel(String code);
	
	//회원 승인(상태변경)
	public void getstate(String email);
	
	//신고처리 승인(상태변경)
	public void getWState(String code);
	
	//qna 답글 update
	public void getQnaInsert(@Param("content")
	String content, @Param("code")String code);
	
	//qna info
	


	//	//전체 회원 가져오는 리스트
	//	public List<AdminDto> getAllMem();
	//	//회원 삭제
	//	public String memberDelete(String m_email);
	//	//아이디체크
	//	public static String memberCheck(String m_email) {
	//		
	//		return null;
	//	}

}
