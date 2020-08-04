package com.sinau.dto;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ScheduleDto {
	private String sc_code;
	@DateTimeFormat(pattern = "YYYY-MM-DD HH:mm")
	private Date sc_time;
	private String sc_place;
	private String sc_scl_code;
}
