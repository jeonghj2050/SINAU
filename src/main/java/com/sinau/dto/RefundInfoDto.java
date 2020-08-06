package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RefundInfoDto {
	private int rownum;
	private int ord_kind;
	private Timestamp ord_date;
	private int ord_amount;
	private String ref_reason;
	private int ord_price;
	private Timestamp ref_date;
	private int ref_state;
	private String m_email;
	private String ofc_title;
	private String p_title;
	private String onc_title;
	
}
