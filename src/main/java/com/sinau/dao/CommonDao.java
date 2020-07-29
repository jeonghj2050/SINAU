package com.sinau.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.FilesDto;
import com.sinau.dto.MyCouponDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffLikeDto;
import com.sinau.dto.OffOrdersDto;
import com.sinau.dto.OnlineLikeDto;
import com.sinau.dto.OnlineOrdersDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.RefundDto;
import com.sinau.dto.VideoFileDto;

public interface CommonDao {
	//회원의 쿠폰 목록을 가져온다.
	List<MyCouponDto> getCouponList(String email);

	//등록한 코드가 존재하는 코드인지 확인
	int selectCoupon(String cp_code);

	//회원 쿠폰 목록에 새로운 쿠폰을 추가
	void inputMyCoupon(@Param("email")String email, @Param("cp_code")String cp_code);

	//환불 내역을 추가한다.
	void refundOrder(RefundDto refund);

	void videoInsert(VideoFileDto video);

	void imageInsert(FilesDto file);
	
	
}
