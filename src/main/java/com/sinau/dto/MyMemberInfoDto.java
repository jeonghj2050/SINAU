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
	
	
	
}
