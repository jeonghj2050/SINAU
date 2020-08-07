package com.sinau.dto;

import lombok.Data;

@Data
public class MyClassDto {
	private String mcl_code; //기본키 구분 코드
	private int mcl_state; //수강 상태 
	private String mcl_classcode; //강좌 코드
	private String mcl_m_email; //수강 회원 이메일
	private String mcl_ord_code;//수강회원의 주문 내역 코드(내가 신청한)

}
