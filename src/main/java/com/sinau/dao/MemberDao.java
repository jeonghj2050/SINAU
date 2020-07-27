package com.sinau.dao;

public interface MemberDao {
	//email에 해당하는 회원의 구분을 반환한다.
	String getGroup(String email);

}
