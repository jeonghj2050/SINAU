package com.sinau.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class AdYouClassDto {
	private int y_num;
	private String y_code;
	private String y_title;
	private String y_profile;
	private Date y_update;
	private String y_m_email;
}
