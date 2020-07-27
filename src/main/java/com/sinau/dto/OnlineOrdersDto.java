package com.sinau.dto;

import java.sql.Timestamp;


public class OnlineOrdersDto {
	private String onc_code;
	private String ord_code;
	private String ord_m_email;
	private String onc_title;
	private int onc_sale;
	private Timestamp ord_date;
	private int ord_amount;
	private int ord_state;
	public String getOnc_code() {
		return onc_code;
	}
	public void setOnc_code(String onc_code) {
		this.onc_code = onc_code;
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
	public String getOnc_title() {
		return onc_title;
	}
	public void setOnc_title(String onc_title) {
		this.onc_title = onc_title;
	}
	public int getOnc_sale() {
		return onc_sale;
	}
	public void setOnc_sale(int onc_sale) {
		this.onc_sale = onc_sale;
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
