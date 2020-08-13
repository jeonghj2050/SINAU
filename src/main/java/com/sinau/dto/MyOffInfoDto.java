package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyOffInfoDto {
	private String mcl_code;
	private String mcl_ord_code;
	private String m_name;
	private int mcl_state;
	private String ofc_code;
	private int ofc_state;
	private String ofc_content;
	private String ofc_title;
	private String cts_name;
	private Timestamp ofc_ofdate;
	private String f_sysname;
	private Timestamp sc_time;
	private String sc_place;
}


