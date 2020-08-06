package com.sinau.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OnListDto {
	private String  f_sysname;
	private String  cts_code;
	private String  cts_name;
	private String  onc_teacher;
	private String  onc_title;
	private int  l_count;
	private int onc_sale;
	private Date onc_sdate;
	private String onc_code;
}
