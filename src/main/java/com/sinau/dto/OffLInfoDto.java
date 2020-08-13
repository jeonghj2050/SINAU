package com.sinau.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OffLInfoDto {
	private String  f_content;
	private String  f_sysname;
	private String  cts_code;
	private String  cts_name;
	private String  ofc_teacher;
	private String  ofc_title;
	private String ofc_content;
	private int  l_count;
	private int  l_state;
	private int ofc_sale;
	private Date ofc_update;
	private String ofc_code;
	private String l_m_email;
}
