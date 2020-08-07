package com.sinau.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

<<<<<<< HEAD
import com.sinau.dto.MemberDto;
import com.sinau.dto.MyClassDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffCtsDto;
import com.sinau.dto.OffImgDto;
import com.sinau.dto.OffInfoDto;
=======
>>>>>>> parent of f495396... Merge branch 'master' into eunkyung
import com.sinau.dto.ClassroomDto;
import com.sinau.dto.CreatorOffInfoDto;
import com.sinau.dto.CreatorOnInfoDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffLikeDto;
import com.sinau.dto.OffOrdersDto;
<<<<<<< HEAD
import com.sinau.dto.OffScheduleDto;
import com.sinau.dto.OnListDto;
import com.sinau.dto.OnlineLikeDto;
import com.sinau.dto.OnlineOrdersDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.PayCouponDto;
import com.sinau.dto.ScheduleDto;
=======
import com.sinau.dto.OnListDto;
>>>>>>> parent of f495396... Merge branch 'master' into eunkyung
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

	
	//onc_code에 해당하는 강좌 정보를 가져온다.
	CreatorOnInfoDto getClassInfo(String onc_code);
	//v_code에 저장된 동영상 파일을 모두 가져온다.
	List<VideoFileDto> getVideoList(String v_code);
	
	//onc_code의 강좌를 삭제한다.
	void deleteClass(String onc_code);
	
	//크리에이터의 모든 강좌의 피드백 목록을 가져온다.
	List<VideoFeedDto> getFeedListAll(String m_email);
	
//은경파트	
	//온라인 강의 섬네일용 정보를 가져옴
	//전체보기 목록 가져오기
	List<OnListDto> getOnList();
	//카테고리별 목록 가져오기
	List<OnListDto> getOnListCa(String cate);
	
	//인기강좌 탑10 목록 가져오기
	List<OnListDto> getTopOnList();
	
	//내 클래스룸 강좌 정보 가져오기
	List<ClassroomDto> getCR(@Param("onc_code")String onc_code,@Param("email")String email);
	
	//내 온라인 강의목록 뷰에서 요청 강의가 목록에 있는지 확인하기
	String getHerClass(String name);
	
	//내가 결제한 강의 유/무 확인하기
	OrderDto checkOrderList(@Param("onc_code")String onc_code,@Param("email")String email);
	
	//로그인한 크리에이터의 강의인지 확인하기
	OnlineClassDto checkOnClass(@Param("onc_code")String onc_code,@Param("email")String email);
<<<<<<< HEAD
	
	//ClassroomDto getCR(HashMap<String, Object> hashMap);
	
	void deleteOffClass(String p_code);
	List<OnListDto> getTopOnList();
	List<OnListDto> getOnList();
	List<OnListDto> getOnListCa(String cate);


=======
>>>>>>> parent of f495396... Merge branch 'master' into eunkyung
}
