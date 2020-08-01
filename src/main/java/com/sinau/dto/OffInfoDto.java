package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OffInfoDto {
	private String ofc_code;
	private String f_oriname;
	private String ofc_teacher;
	private String ofc_title;
	private String ofc_cts_name;
	private int ofc_views;
	private int ofc_sale;
	private int l_count;
	private Timestamp ofc_ofdate;

}
