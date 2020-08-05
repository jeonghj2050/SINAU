package com.sinau.dao;

import java.util.List;

import com.sinau.dto.AdOfflineClassDto;
import com.sinau.dto.AdOnlineClassDto;
import com.sinau.dto.AdPReviewDto;
import com.sinau.dto.AdPStoreDto;
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
}
