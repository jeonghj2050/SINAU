package com.sinau.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sinau.dto.OffOrdersDto;
import com.sinau.dto.ProdLikeDto;
import com.sinau.dto.ProdOrdersDto;

public interface StoreDao {
	//회원의 상품 주문내역을 가져온다.
	List<ProdOrdersDto> getProdOrderList(String email);
	//회원의 상품 좋아요 내역을 가져온다.
	List<ProdLikeDto> getProdLikeList(String email);

}
