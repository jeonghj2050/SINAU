package com.sinau.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffCtsDto;
import com.sinau.dto.OffInfoDto;
import com.sinau.dto.OffInfoSpecDto;
import com.sinau.dto.CategoryDto;
import com.sinau.dto.ClassroomDto;
import com.sinau.dto.CreatorOffInfoDto;
import com.sinau.dto.CreatorOnInfoDto;
import com.sinau.dto.FilterCtsDto;
import com.sinau.dto.OffLikeDto;
import com.sinau.dto.OffListDto;
import com.sinau.dto.OffOrdersDto;
import com.sinau.dto.OffScheduleDto;
import com.sinau.dto.OnListDto;
import com.sinau.dto.OnPayInfoDto;
import com.sinau.dto.OnlineLikeDto;
import com.sinau.dto.OnlineOrdersDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.TotalInfo;
import com.sinau.dto.OnlineClassDto;
import com.sinau.dto.VideoDto;
import com.sinau.dto.VideoFeedDto;
import com.sinau.dto.VideoFileDto;
import com.sinau.dto.VideoListDto;
import com.sinau.dto.YoutubeDto;

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

	//환불 시 나의 클래스 상태를 변경
	void mclUpdateState(OrderDto order);

	//온라인 클래스 등록
	void insertOnClassInfo(OnlineClassDto online);
	//등록된 클래스의 비디오 목록을 등록
	void insertVideoList(VideoDto vList);
	void updateOnClassInfo(OnlineClassDto online);

	//오프라인 클래스 등록
	void insertOffClassInfo(OffClassDto offine);
	void updateOffClassInfo(OffClassDto offline);

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
	OffInfoSpecDto getOffInfoSpec(String ofc_code);

	// 오프라인 강좌 시간 장소 가져오는 메소드 - off
	List<OffInfoDto> getOffInfoDate(String ofc_code);

	//서브 카테고리 가져오는 메소드
	List<OffCtsDto> getOffCate();

	//서브 카테고리에 해당하는 강좌 가져오는 메소드 - off
	List<OffListDto> getOffCateList(String cts_code);

	//현제 카테고리 코드, 이름 가져오는 메소드 - off
	CategoryDto getCateInfo(String cts_code);

	//오프라인 강좌 날짜 시간 장소 가져오는 메소드 - off
	List<OffScheduleDto> getOffScehdule(String ofc_code);

	// 선택한 오프라인 스케줄 가져오는 메소드 - off
	List<OffScheduleDto> getOffScheduleSel(String sc_code);

	OffScheduleDto getOffSchedultPay(String sc_code);


	///////////////////////////////////////////////////////////////
	//onc_code에 해당하는 강좌 정보를 가져온다.
	CreatorOnInfoDto getClassInfo(String onc_code);
	//각 코드에 해당하는 강좌 정보를 가져온다.
	CreatorOnInfoDto getCreatorOnlineInfo(String onc_code);
	CreatorOffInfoDto getCreatorOffInfo(String ofc_code);

	//v_code에 저장된 동영상 파일을 모두 가져온다.
	List<VideoFileDto> getVideoList(String v_code);

	//onc_code의 강좌를 삭제한다.
	void deleteClass(String onc_code);

	//크리에이터의 모든 강좌의 피드백 목록을 가져온다.
	List<VideoFeedDto> getFeedListAll(String m_email);

	//apply.jsp 강좌 목록 가져오는 메소드 - off
	OffListDto getOffApplyInfo(String ofc_code);


	//내 클래스룸 강좌 정보 가져오기
	ClassroomDto getCR(HashMap<String, Object> hashMap);

	void deleteOffClass(String p_code);

	//필터 카테고리 불러오기
	List<FilterCtsDto> getFilter1List();
	List<FilterCtsDto> getFilter2List();
	List<FilterCtsDto> getFilter3List();

	//필터 값에 따라 정렬 값 불러오기
	// List<OffListDto> getOffCateFilterList(String cts_code, String filter1, String filter2, String filter3);

	//	//
	//	List<OffListDto> getOffCateFilterList(String cts_code);

	OnListDto getOnInfoPay(String onc_code);

	// payment로 넘어가는 online 클래스 정보 가져오기
	OnPayInfoDto getOnApplyInfo(String pay_pcode);

	/*은경 파트*/
	//온라인 강의 섬네일용 정보를 가져옴: online_main
	//전체보기 목록 가져오기
	List<OnListDto> getOnList();
	//카테고리별 목록 가져오기
	List<OnListDto> getOnListCa(String cate);

	//인기강좌 탑10 목록 가져오기
	List<OnListDto> getTopOnList();

	//내 클래스룸 강좌 정보 가져오기:online_classroom
	List<ClassroomDto> getCR(@Param("onc_code")String onc_code);

	//내 온라인 강의목록 뷰에서 요청 강의가 목록에 있는지 확인하기
	//   String getHerClass(String name);

	//내가 결제한 강의 유/무 확인하기
	//   OrderDto checkOrderList(@Param("onc_code")String onc_code,@Param("email")String email);

	//로그인한 크리에이터의 강의인지 확인하기
	OnlineClassDto checkOnClass(@Param("onc_code")String onc_code,@Param("email")String email);

	//비디오 강의 별로 가져오기
	List<VideoListDto> getVideoLists(@Param("onc_code")String onc_code,@Param("email")String email);

	//해당 강의 정보 가져오기
	VideoListDto getvideoChange(@Param("vf_code")String vf_code,@Param("onc_code")String onc_code,@Param("email")String email);
	/*은경 파트*/

}





















