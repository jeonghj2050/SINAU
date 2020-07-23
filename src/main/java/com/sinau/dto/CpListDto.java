package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CpListDto {
	private String cp_code;
	private String m_email;
	private String cp_title;
	private int cp_discount;
	private Timestamp cp_date;
	private String cp_content;
}
