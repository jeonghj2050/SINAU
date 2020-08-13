package com.sinau.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class FeedbackDto {
	private String fb_code;
	private String fb_content;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date fb_date;
	private String fb_reply;
	private String fb_m_email;
	private String fb_vf_code;

}
