package com.sinau.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MyCouponDto {
	private String cp_code;
	private String m_email;
	private String cp_title;
	private int cp_discount;
	@JsonFormat(pattern = "YYYY-MM-dd")
	private Timestamp cp_date;
	private String cp_content;
}
