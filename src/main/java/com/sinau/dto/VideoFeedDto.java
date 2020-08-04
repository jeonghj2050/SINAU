package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class VideoFeedDto {
	private String m_email;
	private String onc_code;
	private String vf_code;
	private String v_code;
	private String fb_code;
	private String fb_content;
	private Timestamp fb_date;
	private String fb_reply;
	private String fb_m_email;
}
