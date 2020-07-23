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
	public String getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(String ord_code) {
		this.ord_code = ord_code;
	}
	public String getOrd_name() {
		return ord_name;
	}
	public void setOrd_name(String ord_name) {
		this.ord_name = ord_name;
	}
	public String getOrd_addr() {
		return ord_addr;
	}
	public void setOrd_addr(String ord_addr) {
		this.ord_addr = ord_addr;
	}
	public int getOrd_phone() {
		return ord_phone;
	}
	public void setOrd_phone(int ord_phone) {
		this.ord_phone = ord_phone;
	}
	public String getOrd_memo() {
		return ord_memo;
	}
	public void setOrd_memo(String ord_memo) {
		this.ord_memo = ord_memo;
	}
	public int getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(int ord_price) {
		this.ord_price = ord_price;
	}
	public String getOrd_diposit() {
		return ord_diposit;
	}
	public void setOrd_diposit(String ord_diposit) {
		this.ord_diposit = ord_diposit;
	}
	public Timestamp getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Timestamp ord_date) {
		this.ord_date = ord_date;
	}
	public int getOrd_state() {
		return ord_state;
	}
	public void setOrd_state(int ord_state) {
		this.ord_state = ord_state;
	}
	public String getOrd_pcode() {
		return ord_pcode;
	}
	public void setOrd_pcode(String ord_pcode) {
		this.ord_pcode = ord_pcode;
	}
	public int getOrd_kind() {
		return ord_kind;
	}
	public void setOrd_kind(int ord_kind) {
		this.ord_kind = ord_kind;
	}
	public int getOrd_amount() {
		return ord_amount;
	}
	public void setOrd_amount(int ord_amount) {
		this.ord_amount = ord_amount;
	}
	public String getOrd_m_email() {
		return ord_m_email;
	}
	public void setOrd_m_email(String ord_m_email) {
		this.ord_m_email = ord_m_email;
	}
	
	
	
}
