
package com.sinau.dto;


public class MyClassDto {
	private String mcl_code; //기본키 구분 코드
	private int mcl_state; //수강 상태 
	private String mcl_classcode; //강좌 코드
	private String mcl_m_email; //수강 회원 이메일
	private String mcl_ord_code;//수강회원의 주문 내역 코드(내가 신청한)
	
	
	public String getMcl_code() {
		return mcl_code;
	}
	public void setMcl_code(String mcl_code) {
		this.mcl_code = mcl_code;
	}
	public int getMcl_state() {
		return mcl_state;
	}
	public void setMcl_state(int mcl_state) {
		this.mcl_state = mcl_state;
	}
	public String getMcl_classcode() {
		return mcl_classcode;
	}
	public void setMcl_classcode(String mcl_classcode) {
		this.mcl_classcode = mcl_classcode;
	}
	public String getMcl_m_email() {
		return mcl_m_email;
	}
	public void setMcl_m_email(String mcl_m_email) {
		this.mcl_m_email = mcl_m_email;
	}
	public String getMcl_ord_code() {
		return mcl_ord_code;
	}
	public void setMcl_ord_code(String mcl_ord_code) {
		this.mcl_ord_code = mcl_ord_code;
	}
	
	
}
