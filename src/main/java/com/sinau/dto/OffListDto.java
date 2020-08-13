package com.sinau.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OffListDto {
		private String ofc_code;
		private String ofc_cts_code;
		private String cts_name;
		private String ofc_title;
		private String ofc_teacher;
		@JsonFormat(shape = JsonFormat.Shape.NUMBER, pattern="###,###,###")
		private int ofc_sale;
		private int l_count;
		private String f_sysname;
}
