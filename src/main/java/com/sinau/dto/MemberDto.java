package com.sinau.dto;

import lombok.Data;

@Data
public class MemberDto {
   private String m_email;//회원이메일
   private String m_name;//회원이름
   private String m_pwd;//회원 비밀번호
   private int m_phone;//회원 전화번호
   private String m_birth;//회원 생년월일
   private int m_license;//사업자번호
   private String m_group;//회원 구분(nm, cm, dm)
   private int m_state;//회원 가입 승인

   
   
}
