package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OffInfoDto {
	private String ofc_code;
	private String ofc_cts_code;
	private String ofc_teacher;
	private String ofc_title;
	private String cts_name;
	private int ofc_sale;
	private int l_count;
	private int l_state;
	private int ofc_view;
	private String f_sysname;
	private String sc_place;
}
