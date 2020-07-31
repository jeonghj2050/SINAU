package com.sinau.dao;

import java.util.List;

import com.sinau.dto.PInfoPaymentsDto;

public interface pInfoPaymentDao {

	PInfoPaymentsDto getpInfoPay(String p_code);

}
