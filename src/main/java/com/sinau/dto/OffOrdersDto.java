package com.sinau.dto;

import java.sql.Timestamp;


public class OffOrdersDto {
	private String ofc_code;
	private String ord_code;
	private String ord_m_email;
	private String ofc_title;
	private int ofc_sale;
	private Timestamp ord_date;
	private int ord_amount;
	private int ord_state;
	
	
	public String getOfc_code() {
		return ofc_code;
	}
	public void setOfc_code(String ofc_code) {
		this.ofc_code = ofc_code;
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
	public String getOfc_title() {
		return ofc_title;
	}
	public void setOfc_title(String ofc_title) {
		this.ofc_title = ofc_title;
	}
	public int getOfc_sale() {
		return ofc_sale;
	}
	public void setOfc_sale(int ofc_sale) {
		this.ofc_sale = ofc_sale;
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
