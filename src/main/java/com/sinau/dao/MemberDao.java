package com.sinau.dao;

import com.sinau.dto.MemberDto;

import com.sinau.dto.MemberDto;
import com.sinau.dto.MemberImg;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sinau.dto.MyMemberInfoDto;

public interface MemberDao {

	int idCheck(String memail);

	void memberInsert(MemberDto member);

	//email에 해당하는 회원의 구분을 반환한다.
	String getGroup(String email);
	
	//email에 해당하는 회원의 정보를 가져온다.
	MyMemberInfoDto getMemberInfo(String email);

	//변경 된 비밀번호로 회원 정보를 수정한다.
	int updateMemberPwd(@Param("email")String email,@Param("encodePwd")String encodePwd);

	String getPwd(String m_email);

	MemberDto getMemInfo(String m_email);

	void fileInsert(Map<String, String> fmap);

	int newPwd(@Param("email")String email,@Param("encPwd")String encPwd);

	
	
	/*
	 * public void memberImgInsert(MultipartHttpServletRequest multi);
	 */

}
