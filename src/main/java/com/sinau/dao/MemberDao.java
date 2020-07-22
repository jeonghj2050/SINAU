package com.sinau.dao;

import com.sinau.dto.Member;

public interface MemberDao {
	//이메일 이용하여 비밀번호 가져오기
	public String getPwd(String m_email);
	//로그인한 회원정보 가져오기
	public Member getMemInfo(String m_email);
	
	public void memberInsert(Member member);
	

}
