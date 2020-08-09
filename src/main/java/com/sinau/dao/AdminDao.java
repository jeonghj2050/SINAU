package com.sinau.dao;

import java.util.List;
import java.util.Map;

import com.sinau.dto.AdminDto;
import com.sinau.dto.FilesDto;
import com.sinau.dto.QuestionInfoDto;
import com.sinau.dto.YoutubeClassDto;

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
	public void getLecDel(String code);
	//판매글 삭제
	public void getSaleDel(String code);
	//리뷰글 삭제 
	//온라인
	public void getReDel(String code);
	//오프라인
	public void getOfDel(String code);
	//유튜브
	public void getYDel(String code);
	//유튜브 이미지 등록
	public void fileInsert(Map<String, String> fmap);
	//유튜브 등록
	public void youtubeWrite(YoutubeClassDto youtube);


	
	
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
