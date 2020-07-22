package com.sinau.dto;

import java.sql.Timestamp;

public class Product {
	private String p_code;
	private String p_title;
	private int p_amount;
	private int p_price;
	private Timestamp p_date;
	private int p_salmount;
	private String p_dealer;
	private int p_view;
	
	
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public Timestamp getP_date() {
		return p_date;
	}
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}
	public int getP_salmount() {
		return p_salmount;
	}
	public void setP_salmount(int p_salmount) {
		this.p_salmount = p_salmount;
	}
	public String getP_dealer() {
		return p_dealer;
	}
	public void setP_dealer(String p_dealer) {
		this.p_dealer = p_dealer;
	}
	public int getP_view() {
		return p_view;
	}
	public void setP_view(int p_view) {
		this.p_view = p_view;
	}
	
	
	
	
	
}
