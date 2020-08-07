package com.sinau.dto;

import lombok.Data;

@Data
public class OnlineLikeDto {
	private String l_code;
	private int l_count;
	private int l_state;
	private String m_email;
	private String onc_code;
	private String onc_title;
	private int onc_sale;
	private String cts_name;
	private String f_sysname;
}
