package com.sinau.dao;

import java.util.List;

import com.sinau.dto.MyClassInfoDto;
import com.sinau.dto.OrderDto;

public interface ClassDao {
	//email에 해당하는 회원의 주문 내역을 가져온다.
	List<OrderDto> getOrderList(String email);
	//ord_pcode에 해당하는 강좌의 상세 정보를 가져온다.
	MyClassInfoDto getMyClassInfoOne(String ord_pcode);

}
