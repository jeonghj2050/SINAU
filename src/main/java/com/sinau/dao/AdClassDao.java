package com.sinau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.AdOfflineClassDto;
import com.sinau.dto.AdOnlineClassDto;
import com.sinau.dto.AdPCtsDto;
import com.sinau.dto.AdPReviewDto;
import com.sinau.dto.AdPStoreDto;
import com.sinau.dto.AdQFileDto;
import com.sinau.dto.AdQnaInfoDto;
import com.sinau.dto.AdSQnaDto;
import com.sinau.dto.AdSWDto;
import com.sinau.dto.AdYouClassDto;

public interface AdClassDao {
	//온라인 게시글
	public List<AdOnlineClassDto>getOnline();
	//오프라인게시글
	public List<AdOfflineClassDto>getOffline();
	//유튜브 게시글
	public List<AdYouClassDto> getYoutube();
	//판매 게시글
	public List<AdPStoreDto> getStore();
	//리뷰 게시글
	public List<AdPReviewDto> getReview();
	
	//고객센터
	//qna 글
	public List<AdSQnaDto>getQna();
	//신고 게시글
	public List<AdSWDto> getWarning();
	
	//cts 카테고리 받는 메서드
	public List<AdOnlineClassDto> getCts(String cts);
	
	//카테고리 가져오는 메소드
	public List<AdPCtsDto> getcate();
	
	//qna info 상세내용 받아오는 메소드
	public AdSQnaDto getQnaInfo(String code);
	//qna file 받아오는 메소드
	public AdQFileDto getQnaFile(String code);
	//file 다운로드
	public String getOriName(String sysFileName);
	
	
}
