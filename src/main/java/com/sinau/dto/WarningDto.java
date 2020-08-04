package com.sinau.dto;

import java.sql.Date;

import lombok.Data;
@Data
public class WarningDto {
		
	private String w_code;
	private int w_contentNum;
	private String w_content;
	private int w_state;
	private String w_m_email;
	private String w_prv_code;
	private Date w_update;

}
