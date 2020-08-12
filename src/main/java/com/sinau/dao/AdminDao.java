package com.sinau.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.AdQnaInfoDto;
import com.sinau.dto.AdminDto;
import com.sinau.dto.FilesDto;
import com.sinau.dto.QuestionInfoDto;
import com.sinau.dto.YoutubeClassDto;

public interface AdminDao {
	
	public List<AdminDto> getList(Map<String, String> lmap);
	
	public int getListCount();
	
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
	//유튜브 이미지 등록
	public void fileInsert(Map<String, String> fmap);
	//유튜브 등록
	public void youtubeWrite(YoutubeClassDto youtube);


	
	//신고처리 승인(상태변경)
	public void getWState(String code);
	
	//qna 답글 update
	public void getQnaInsert(@Param("content")
	String content, @Param("code")String code);
	
	//회원 이미지파일 검색
	public String getMImgSel(String email);
	//회원 이미지파일 삭제
	public void getMImgDel(String email);
	
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
