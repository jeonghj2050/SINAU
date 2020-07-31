package com.sinau.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class PReviewDto {
	
	private String prv_code;
	private Date prv_date;
	private String prv_content;
	private String prv_m_email;
	private String prv_p_code;
	
}
