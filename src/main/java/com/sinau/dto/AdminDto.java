package com.sinau.dto;
import java.sql.Date;
import lombok.Data;

@Data
public class AdminDto {
	   private String m_email;//회원이메일
	   private String m_name;//회원이름
	   private String m_pwd;//회원 비밀번호
	   private int m_phone;//회원 전화번호
	   private Date m_birth;//회원 생년월일
	   private int m_license;//사업자번호
	   private String m_group;//회원 구분(nm, cm, dm)
	   private int m_state;//회원 가입 승인
	   private int m_num;//회원 번호
	   private int m_nmnum;//일반회원순
	   private int m_cmnum;//크리에이터 순
	   private int m_dmnum;//판매자 순
}
