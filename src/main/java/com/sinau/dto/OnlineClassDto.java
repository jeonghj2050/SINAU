package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OnlineClassDto {
	private String onc_code;
	private String onc_title;
	private String onc_content;
	private String onc_teacher;
	private String onc_sale;
	private Timestamp onc_update;
	private String onc_level;
	private int onc_stnum;
	private int onc_state;
	private Timestamp onc_sdate;
	private Timestamp onc_edate;
	private String onc_m_email;
	private String onc_cts_code;

	
	
}
