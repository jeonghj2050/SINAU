package com.sinau.dao;

import java.util.List;

import com.sinau.dto.MemberDto;
import com.sinau.dto.MyClassDto;
import com.sinau.dto.OffListDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.PayCouponDto;

public interface PaymentDao {

	//결제창에 회원이 가진 쿠폰 목록 가져온다.
	List<PayCouponDto> getPayCouponList(String email);
	
	//쿠폰 사용 모달에서 회원이 선택한 쿠폰 정보를 가져온다.
	PayCouponDto getPayCoupon(String cpcode);
	
	// payment에서 회원 정보 가져오는 메소드
	MemberDto getMemPayInfo(String m_email);
	
	// 주문 내역 입력하는 메소드
	// void payInsert(OrderDto order);
	
	// 마이클래스 강좌 입력하는 메소드
	void mclInsert(MyClassDto myClass);

	// 주문 내역 입력하는 메소드
	void orderInsert(OrderDto order);
}
