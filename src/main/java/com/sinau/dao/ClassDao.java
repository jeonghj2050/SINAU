package com.sinau.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.MemberDto;
import com.sinau.dto.MyClassDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffCtsDto;
import com.sinau.dto.OffImgDto;
import com.sinau.dto.OffInfoDto;
import com.sinau.dto.CreatorOffInfoDto;
import com.sinau.dto.CreatorOnInfoDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffLikeDto;
import com.sinau.dto.OffListDto;
import com.sinau.dto.OffOrdScDto;
import com.sinau.dto.OffOrdersDto;
import com.sinau.dto.OffScheduleDto;
import com.sinau.dto.OnlineLikeDto;
import com.sinau.dto.OnlineOrdersDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.PayCouponDto;
import com.sinau.dto.ScheduleDto;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.OnlineLikeDto;
import com.sinau.dto.OnlineOrdersDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.VideoDto;
import com.sinau.dto.VideoFeedDto;
import com.sinau.dto.VideoFileDto;

public interface ClassDao {
	//email에 해당하는 회원의 주문 내역을 가져온다.
	List<OrderDto> getOrderList(@Param("email")String email,@Param("precode")String precode);
	//ord_pcode에 해당하는 온라인강좌의 상세 정보를 가져온다.
	MyOnlineInfoDto getMyOnlineInfoOne(String ord_pcode);
	//ord_pcode에 해당하는 오프라인강좌의 상세 정보를 가져온다.
	MyOffInfoDto getMyOffInfoOne(String ord_pcode);
	
	//회원의 강좌(온라인/오프라인) 주문 정보를 가져온다.
	List<OnlineOrdersDto> getOnlineOrderList(String email);
	List<OffOrdersDto> getOffOrderList(String email);
	
	List<OnlineClassDto> getList(Map<String, String> lmap);
	//회원의 강좌(온라인/오프라인) 좋아요 정보를 가져온다.
	List<OnlineLikeDto> getOnLikeList(String email);
	List<OffLikeDto> getOffLikeList(String email);
	
	void mclUpdateState(OrderDto order);
	
	void insertOnClassInfo(OnlineClassDto online);
	void insertVideoList(VideoDto vList);
	void updateOnClassInfo(OnlineClassDto online);
	
	void insertOffClassInfo(OffClassDto offine);

	
	//크리에이터가 등록한 강좌의 정보를 가져온다.
	List<CreatorOnInfoDto> getCreatorOnList(String m_email);
	List<CreatorOffInfoDto> getCreatorOffList(String m_email);

	
	////////////////////////////////////////////////////
	//오프라인 강좌 전체 카테고리에 해당하는 강좌 리스트 정보를 가져온다. - off
	List<OffListDto> getOffList();
	
	//조회수 증가 메소드 - off
	void viewUpdate(String ofc_code);
	
	//강좌 상세 가져오는 메소드 - off
	OffInfoDto getOffInfo(String ofc_code);

	//장소 가져오는 메소드 - off
	String getOffLoc(String ofc_code);
	
	//디테일 사진 가져오는 메소드 - off
	String getInfoSpec1(String ofc_code);
	String getInfoSpec2(String ofc_code);
	String getInfoSpec3(String ofc_code);
	
	// 오프라인 강좌 시간 장소 가져오는 메소드 - off
	List<OffInfoDto> getOffInfoDate(String ofc_code);
	
	//서브 카테고리 가져오는 메소드
	List<OffCtsDto> getOffCate();
	
	//서브 카테고리에 해당하는 강좌 가져오는 메소드 - off
	List<OffListDto> getOffCateList(String cts_code);
	
	//현제 카테고리 명 가져오는 메소드 - off
	String getCateName(String cts_code);
	
	//오프라인 강좌 날짜 시간 장소 가져오는 메소드 - off
	List<OffScheduleDto> getOffScehdule(String ofc_code);
	
	// 선택한 오프라인 스케줄 가져오는 메소드 - off
	List<OffScheduleDto> getOffScheduleSel(String sc_code);
	
	//onc_code에 해당하는 강좌 정보를 가져온다.
	CreatorOnInfoDto getClassInfo(String onc_code);
	//v_code에 저장된 동영상 파일을 모두 가져온다.
	List<VideoFileDto> getVideoList(String v_code);
	
	//onc_code의 강좌를 삭제한다.
	void deleteClass(String onc_code);
	
	//크리에이터의 모든 강좌의 피드백 목록을 가져온다.
	List<VideoFeedDto> getFeedListAll(String m_email);
	
	//apply.jsp 강좌 목록 가져오는 메소드 - off
	OffListDto getOffApplyInfo(String ofc_code);

	
}
