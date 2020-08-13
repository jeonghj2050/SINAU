package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CreatorOffInfoDto {
	private String ofc_code;
	private String ofc_m_email;
	private String ofc_title;
	private String ofc_content;
	private int ofc_state;
	private int ofc_rstnum;
	private int ofc_stnum;
	private int ofc_sale;
	private String ofc_level;
	private String f_sysname;
	private String ofc_cts_code;
	private String scl_code;
	private String cts_name;
}
