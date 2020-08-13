package com.sinau.dto;
import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AdSQnaDto {
	private int q_num;
	private String title;
	private String content;
	private String email;
	private String name;
	private Date dates;
	private String code;
	private String q_anfield;
	@JsonFormat(pattern = "YYYY-MM-dd HH:MI")
	private Timestamp q_andate;
}
