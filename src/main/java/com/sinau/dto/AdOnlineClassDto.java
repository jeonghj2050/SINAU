package com.sinau.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class AdOnlineClassDto {
	private String onc_code;
	private String onc_title;
	private String onc_content;
	private String onc_teacher;
	private String onc_sale;
	private Date onc_update;
	private String onc_level;
	private int onc_stnum;
	private int onc_state;
	private Date onc_sdate;
	private Date onc_edate;
	private String onc_m_email;
	private String onc_cts_code;
	private int onc_num;
}
