package com.sinau.dto;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class OnlineClassDto {
	private String onc_code;
	private String onc_title;
	private String onc_content;
	private String onc_teacher;
	private String onc_sale;
	private Timestamp onc_update;
	private String onc_level;
	private int onc_stnum;
	private int onc_state;
	private Timestamp onc_sdate;
	private Timestamp onc_edate;
	private String onc_m_email;
	private String onc_cts_code;
	public String getOnc_code() {
		return onc_code;
	}
	public void setOnc_code(String onc_code) {
		this.onc_code = onc_code;
	}
	public String getOnc_title() {
		return onc_title;
	}
	public void setOnc_title(String onc_title) {
		this.onc_title = onc_title;
	}
	public String getOnc_content() {
		return onc_content;
	}
	public void setOnc_content(String onc_content) {
		this.onc_content = onc_content;
	}
	public String getOnc_teacher() {
		return onc_teacher;
	}
	public void setOnc_teacher(String onc_teacher) {
		this.onc_teacher = onc_teacher;
	}
	public String getOnc_sale() {
		return onc_sale;
	}
	public void setOnc_sale(String onc_sale) {
		this.onc_sale = onc_sale;
	}
	public Timestamp getOnc_update() {
		return onc_update;
	}
	public void setOnc_update(Timestamp onc_update) {
		this.onc_update = onc_update;
	}
	public String getOnc_level() {
		return onc_level;
	}
	public void setOnc_level(String onc_level) {
		this.onc_level = onc_level;
	}
	public int getOnc_stnum() {
		return onc_stnum;
	}
	public void setOnc_stnum(int onc_stnum) {
		this.onc_stnum = onc_stnum;
	}
	public int getOnc_state() {
		return onc_state;
	}
	public void setOnc_state(int onc_state) {
		this.onc_state = onc_state;
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
	public String getOnc_m_email() {
		return onc_m_email;
	}
	public void setOnc_m_email(String onc_m_email) {
		this.onc_m_email = onc_m_email;
	}
	public String getOnc_cts_code() {
		return onc_cts_code;
	}
	public void setOnc_cts_code(String onc_cts_code) {
		this.onc_cts_code = onc_cts_code;
	}
	
	
}
