package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyClassInfoDto {
	private String mcl_code;
	private String mcl_ord_code;
	private int mcl_state;
	private String onc_code;
	private String onc_content;
	private String onc_title;
	private Timestamp onc_sdate;
	private Timestamp onc_edate;
}
