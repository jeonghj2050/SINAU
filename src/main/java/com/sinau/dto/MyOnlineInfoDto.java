package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyOnlineInfoDto {
	private String mcl_code;
	private String mcl_ord_code;
	private String m_name;
	private int mcl_state;
	private String onc_code;
	private String onc_content;
	private String onc_title;
	private String cts_name;
	private Timestamp onc_sdate;
	private Timestamp onc_edate;
	private String f_oriname;
	
	
	public String getMcl_code() {
		return mcl_code;
	}
	public void setMcl_code(String mcl_code) {
		this.mcl_code = mcl_code;
	}
	public String getMcl_ord_code() {
		return mcl_ord_code;
	}
	public void setMcl_ord_code(String mcl_ord_code) {
		this.mcl_ord_code = mcl_ord_code;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getMcl_state() {
		return mcl_state;
	}
	public void setMcl_state(int mcl_state) {
		this.mcl_state = mcl_state;
	}
	public String getOnc_code() {
		return onc_code;
	}
	public void setOnc_code(String onc_code) {
		this.onc_code = onc_code;
	}
	public String getOnc_content() {
		return onc_content;
	}
	public void setOnc_content(String onc_content) {
		this.onc_content = onc_content;
	}
	public String getOnc_title() {
		return onc_title;
	}
	public void setOnc_title(String onc_title) {
		this.onc_title = onc_title;
	}
	public String getCts_name() {
		return cts_name;
	}
	public void setCts_name(String cts_name) {
		this.cts_name = cts_name;
	}
	public Timestamp getOnc_sdate() {
		return onc_sdate;
	}
	public void setOnc_sdate(Timestamp onc_sdate) {
		this.onc_sdate = onc_sdate;
	}
	public Timestamp getOnc_edate() {
		return onc_edate;
	}
	public void setOnc_edate(Timestamp onc_edate) {
		this.onc_edate = onc_edate;
	}
	public String getF_oriname() {
		return f_oriname;
	}
	public void setF_oriname(String f_oriname) {
		this.f_oriname = f_oriname;
	}
	
	
}
