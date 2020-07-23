package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyOnlineInfoDto {
	private String mcl_code;
	private String mcl_ord_code;
	private String m_name;
	private int mcl_state;
	private String onc_code;
	private String onc_content;
	private String onc_title;
	private String cts_name;
	private Timestamp onc_sdate;
	private Timestamp onc_edate;
	private String f_oriname;
}
