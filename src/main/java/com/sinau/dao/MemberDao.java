package com.sinau.dao;

import com.sinau.dto.Member;

public interface MemberDao {

	public int idCheck(String memail);

	public void memberInsert(Member member);

}
