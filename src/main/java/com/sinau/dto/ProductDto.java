package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductDto {
	private String p_code;
	private String p_title;
	private int p_amount;
	private int p_price;
	private Timestamp p_date;
	private int p_salmount;
	private String p_dealer;
	private int p_view;
	private String p_m_email;
	private String p_cts_code;
	private int p_state;
}
