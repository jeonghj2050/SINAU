package com.sinau.dto;

import java.sql.Timestamp;

public class QuestionDto {
	private String q_code;
	private String q_title;
	private String q_content;
	private Timestamp q_date;
	private String q_anfield;
	private Timestamp q_andate;
	private String q_cts_code;
	private String q_m_email;
	private String m_name;
	
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getQ_code() {
		return q_code;
	}
	public void setQ_code(String q_code) {
		this.q_code = q_code;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Timestamp getQ_date() {
		return q_date;
	}
	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}
	public String getQ_anfield() {
		return q_anfield;
	}
	public void setQ_anfield(String q_anfield) {
		this.q_anfield = q_anfield;
	}
	public Timestamp getQ_andate() {
		return q_andate;
	}
	public void setQ_andate(Timestamp q_andate) {
		this.q_andate = q_andate;
	}
	public String getQ_cts_code() {
		return q_cts_code;
	}
	public void setQ_cts_code(String q_cts_code) {
		this.q_cts_code = q_cts_code;
	}
	public String getQ_m_email() {
		return q_m_email;
	}
	public void setQ_m_email(String q_m_email) {
		this.q_m_email = q_m_email;
	}
	
	
	
	
}
