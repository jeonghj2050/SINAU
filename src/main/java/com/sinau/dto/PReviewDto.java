package com.sinau.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PReviewDto {
	
	private String prv_code;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date prv_date;
	private String prv_content;
	private String prv_m_email;
	private String prv_p_code;
	private String w_code;
	private String w_state;
	
}
