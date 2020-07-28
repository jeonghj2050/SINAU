package com.sinau.dto;

import lombok.Data;

@Data
public class OffLikeDto {
	private String l_code;
	private int l_count;
	private int l_state;
	private String m_email;
	private String ofc_code;
	private String ofc_title;
	private int ofc_sale;
	private String cts_name;
	private String f_oriname;
	public String getL_code() {
		return l_code;
	}
	public void setL_code(String l_code) {
		this.l_code = l_code;
	}
	public int getL_count() {
		return l_count;
	}
	public void setL_count(int l_count) {
		this.l_count = l_count;
	}
	public int getL_state() {
		return l_state;
	}
	public void setL_state(int l_state) {
		this.l_state = l_state;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getOfc_code() {
		return ofc_code;
	}
	public void setOfc_code(String ofc_code) {
		this.ofc_code = ofc_code;
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
	public String getCts_name() {
		return cts_name;
	}
	public void setCts_name(String cts_name) {
		this.cts_name = cts_name;
	}
	public String getF_oriname() {
		return f_oriname;
	}
	public void setF_oriname(String f_oriname) {
		this.f_oriname = f_oriname;
	}
	
	
}
