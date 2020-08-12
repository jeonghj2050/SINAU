package com.sinau.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class AdOfflineClassDto {
	private int ofc_num;
	private String ofc_code;
	private String ofc_content;
	private String ofc_title;
	private String ofc_teacher;
	private Date ofc_update;
	private String ofc_m_email;
	private String ofc_cts_code;
}
