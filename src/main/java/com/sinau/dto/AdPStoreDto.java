package com.sinau.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class AdPStoreDto {
	private int p_num;
	private String p_m_email;
	private String p_title;
	private String p_dealer;
	private Date p_date;
	private String p_price;
	private String p_code;
}
