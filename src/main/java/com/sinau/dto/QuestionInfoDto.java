package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QuestionInfoDto {
	private int q_num;
	private String q_code;
	private String q_title;
	private String q_content;
	private Timestamp q_date;
	private String q_cts_code;
	private Timestamp q_andate;
	private String q_anfield;
	private String q_m_email;
	private String m_name;
	private String cts_name;
}
