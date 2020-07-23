package com.sinau.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MyMemberInfoDto {
	private String m_email;
	private String m_name;
	private String m_phone;
	@JsonFormat(pattern = "YYYY-MM-dd")
	private Timestamp m_birth;
	private String mimg_code;
	private String mimg_oriname;
	private String mimg_sysname;
	
	
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
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public Timestamp getM_birth() {
		return m_birth;
	}
	public void setM_birth(Timestamp m_birth) {
		this.m_birth = m_birth;
	}
	public String getMimg_code() {
		return mimg_code;
	}
	public void setMimg_code(String mimg_code) {
		this.mimg_code = mimg_code;
	}
	public String getMimg_oriname() {
		return mimg_oriname;
	}
	public void setMimg_oriname(String mimg_oriname) {
		this.mimg_oriname = mimg_oriname;
	}
	public String getMimg_sysname() {
		return mimg_sysname;
	}
	public void setMimg_sysname(String mimg_sysname) {
		this.mimg_sysname = mimg_sysname;
	}
	
	
	
}
