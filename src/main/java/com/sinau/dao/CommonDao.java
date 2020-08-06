package com.sinau.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.FilesDto;
import com.sinau.dto.MemberImg;
import com.sinau.dto.MyCouponDto;
import com.sinau.dto.MyOffInfoDto;
import com.sinau.dto.MyOnlineInfoDto;
import com.sinau.dto.OffLikeDto;
import com.sinau.dto.OffOrdersDto;
import com.sinau.dto.OnlineLikeDto;
import com.sinau.dto.OnlineOrdersDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.RefundDto;
import com.sinau.dto.ScheduleDto;
import com.sinau.dto.ScheduleListDto;
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

	//onc_code에 해당하는 v_code를 가져온다.
	String getVCode(String onc_code);

	//vf에서 v_code에 해당하는 파일 목록 삭제
	void deleteVideoFile(String v_code);

	//vf에서 vf_code에 해당하는 파일 삭제
	void deleteVideoOne(String vf_code);

	//vf_code에 해당하는 파일을 변경하다.
	void updateVideoOne(VideoFileDto video);

	//수정 후 다시 데이터를 보내기 위해 vf_code에 해당하는 동영상 정보를 가져온다.
	VideoFileDto getVideoOne(String vf_code);

	//v_code에 해당하는 모든 파일을 가져온다.
	List<VideoFileDto> getVideoList(String v_code);

	//v_code에 해당하는 목록을 삭제한다.
	void deleteVideo(String v_code);

	//onc_code에 해당하는 이미지들을 모두 삭제한다.
	void deleteClassImages(String f_pcode);

	void insertScl(ScheduleListDto scList);

	void insertSchedule(ScheduleDto schedule);

	void updateMemImg(MemberImg memImg);

	//up_p_code에 해당하는 일정 목록의 코드를 가져온다.
	String getSclCode(String up_p_code);

	List<ScheduleDto> getScheduleList(String scl_code);

	void updateSchedule(String sc_code);
}
