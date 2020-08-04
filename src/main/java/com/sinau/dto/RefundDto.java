package com.sinau.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RefundDto {
	private String ref_code;
	private Timestamp ref_date;
	private String ref_banknum;
	private String ref_bank;
	private String ref_bankname;
	private String ref_reson;
	private String ref_state;
	private String ref_ord_code;
}
