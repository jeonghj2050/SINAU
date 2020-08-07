package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayCouponDto {
	private String cpl_cp_code;
	private String cpl_code;
	private String cp_title;
	private int cp_discount;
	private String cp_content;
	private String cpl_m_email;
	private Timestamp cp_date;
}
