package com.sinau.dao;

import java.util.List;

import com.sinau.dto.ProductListDto;


public interface ProductListDao {
	
	//상품목록	
	public List<ProductListDto> getProductList(int rnum);

	public List<ProductListDto> getpArtList(String cts_code);

	public List<ProductListDto> getpEleList(String cts_code);

	public List<ProductListDto> getpHList(String cts_code);

	public List<ProductListDto> getpMusicList(String cts_code);

	public List<ProductListDto> getpFoodList(String cts_code);

	public String getPspec(String p_code);

}
