package com.sinau.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class AdPReviewDto {
	private int prv_num;
	private String prv_m_email;
	private String prv_content;
	private String m_name;
	private Date prv_date;
	private String prv_code;
}
