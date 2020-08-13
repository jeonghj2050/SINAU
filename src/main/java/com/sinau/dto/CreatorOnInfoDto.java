package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CreatorOnInfoDto {
	private String onc_code;
	private String onc_m_email;
	private String onc_title;
	private String onc_content;
	private int onc_rstnum;
	private int onc_stnum;
	private int onc_sale;
	private String onc_level;
	private Timestamp onc_sdate;
	private Timestamp onc_edate;
	private String f_sysname;
	private String onc_cts_code;
	private String v_code;
	private String cts_name;
}
