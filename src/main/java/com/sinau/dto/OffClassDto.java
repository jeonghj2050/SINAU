package com.sinau.dto;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class OffClassDto {
	private String ofc_code;
	private String ofc_title;
	private String ofc_content;
	private String ofc_teacher;
	private int ofc_sale;
	private Timestamp ofc_update;
	private String ofc_level;
	private int ofc_view;	
	private int ofc_stnum;
	private int ofc_state;
	private Timestamp ofc_ofdate;
	private String ofc_place;
	private String ofc_m_email;
	private String ofc_cts_code;
}
