package com.sinau.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OnInfoDto {
	private String  f_content;
	private String  f_sysname;
	private String  cts_code;
	private String  cts_name;
	private String  onc_teacher;
	private String  onc_title;
	private String onc_content;
	private int  l_count;
	private int  l_state;
	private int onc_sale;
	private Date onc_sdate;
	private String onc_code;
	private String l_m_email;
}
