package com.sinau.dto;

public class MemberDto {
	private String m_email;//회원이메일
	private String m_name;//회원이름
	private String m_pwd;//회원 비밀번호
	private int m_phone;//회원 전화번호
	private String m_birth;//회원 생년월일
	private int m_license;//사업자번호
	private String m_group;//회원 구분(nm, cm, dm)
	private int m_state;//회원 가입 승인
	
	
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public int getM_phone() {
		return m_phone;
	}
	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public int getM_license() {
		return m_license;
	}
	public void setM_license(int m_license) {
		this.m_license = m_license;
	}
	public String getM_group() {
		return m_group;
	}
	public void setM_group(String m_group) {
		this.m_group = m_group;
	}
	public int getM_state() {
		return m_state;
	}
	public void setM_state(int m_state) {
		this.m_state = m_state;
	}
	
	
	
	
}
