package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OffScheduleDto {
	private String scl_ofc_code;
	private String sc_code;
	private String sc_scl_code;
	private String sc_loc;
	private String sc_date;
	private String sc_time;
}
