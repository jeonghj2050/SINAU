package com.sinau.dao;

import java.util.List;

import com.sinau.dto.DealerProductInfoDto;
import com.sinau.dto.OrderDto;
import com.sinau.dto.ProdLikeDto;
import com.sinau.dto.ProdOrdersDto;
import com.sinau.dto.ProductDto;

public interface StoreDao {
	//회원의 상품 주문내역을 가져온다.
	List<ProdOrdersDto> getProdOrderList(String email);
	//회원의 상품 좋아요 내역을 가져온다.
	List<ProdLikeDto> getProdLikeList(String email);
	//ord_code에 해당하는  주문 내역의 상태를 변경한다.
	void updateOrderState(OrderDto order);
	void insertNewProd(ProductDto prod);
	
	List<DealerProductInfoDto> getMyProdList(String m_email);
	
	//상품의 재고를 수정하는 메소드
	void updateProd(ProductDto prod);
	//상품 삭제 요청하는 메소드
	void delRequestProd(String p_code);
}
