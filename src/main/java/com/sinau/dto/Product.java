package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Product {
	private String p_code;
	private String p_title;
	private int p_amount;
	private int p_price;
	private Timestamp p_date;
	private int p_salmount;
	private String p_dealer;
	private int p_view;
	
	
	
	
	
	
}
