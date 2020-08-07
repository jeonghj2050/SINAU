package com.sinau.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QuestionInfoDto {
	private int q_num;
	private String q_code;
	private String q_title;
	private String q_content;
	@JsonFormat(pattern = "YYYY-MM-dd")
	private Timestamp q_date;
	private String q_cts_code;
	private String q_anfield;
	private Timestamp q_andate;
	private String q_m_email;
	private String m_name;
	private String cts_name;
}
