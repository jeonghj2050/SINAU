package com.sinau.dto;

import java.sql.Timestamp;


public class ProdOrdersDto {
	private String p_code;
	private String ord_code;
	private String ord_m_email;
	private String p_title;
	private int p_price;
	private Timestamp ord_date;
	private int ord_amount;
	private int ord_state;
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(String ord_code) {
		this.ord_code = ord_code;
	}
	public String getOrd_m_email() {
		return ord_m_email;
	}
	public void setOrd_m_email(String ord_m_email) {
		this.ord_m_email = ord_m_email;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public Timestamp getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Timestamp ord_date) {
		this.ord_date = ord_date;
	}
	public int getOrd_amount() {
		return ord_amount;
	}
	public void setOrd_amount(int ord_amount) {
		this.ord_amount = ord_amount;
	}
	public int getOrd_state() {
		return ord_state;
	}
	public void setOrd_state(int ord_state) {
		this.ord_state = ord_state;
	}
	
	
}
