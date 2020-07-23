package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProdOrdersDto {
	private String p_code;
	private String ord_code;
	private String ord_m_email;
	private String p_title;
	private int p_price;
	private Timestamp ord_date;
	private int ord_amount;
	private int ord_state;
}
