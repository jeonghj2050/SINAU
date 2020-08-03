package com.sinau.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.CreatorOffInfoDto;
import com.sinau.dto.CreatorOnInfoDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffClassDto;
import com.sinau.dto.OffLikeDto;
import com.sinau.dto.OffOrdersDto;
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


}
