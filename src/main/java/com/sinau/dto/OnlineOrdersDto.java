package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OnlineOrdersDto {
	private String onc_code;
	private String ord_code;
	private String ord_m_email;
	private String onc_title;
	private int ord_price;
	private Timestamp ord_date;
	private int ord_amount;
	private int ord_state;
	
	
	
}
