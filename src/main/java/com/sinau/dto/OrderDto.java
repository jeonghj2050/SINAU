package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderDto {
	private String ord_code;
	private String ord_name;
	private String ord_addr;
	private int ord_phone;
	private String ord_memo;
	private int ord_price;
	private String ord_diposit;
	private Timestamp ord_date;
	private int ord_state;
	private String ord_pcode;
	private int ord_kind;
	private int ord_amount;
	private String ord_m_email;
	
	
	
	
}
