package com.sinau.dao;


import com.sinau.dto.MemberDto;
	
import org.apache.ibatis.annotations.Param;

import com.sinau.dto.MyMemberInfoDto;

public interface MemberDao {

	public int idCheck(String memail);

	public void memberInsert(MemberDto member);

	//email에 해당하는 회원의 구분을 반환한다.
	String getGroup(String email);
	
	//email에 해당하는 회원의 정보를 가져온다.
	MyMemberInfoDto getMemberInfo(String email);

	//변경 된 비밀번호로 회원 정보를 수정한다.
	int updateMemberPwd(@Param("email")String email,@Param("encodePwd")String encodePwd);

	public String getPwd(String m_email);

	public MemberDto getMemInfo(String m_email);


}
