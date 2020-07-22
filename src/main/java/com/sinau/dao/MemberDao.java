package com.sinau.dao;

import com.sinau.dto.MyMemberInfoDto;

public interface MemberDao {
	//email에 해당하는 회원의 구분을 반환한다.
	String getGroup(String email);
	
	//email에 해당하는 회원의 정보를 가져온다.
	MyMemberInfoDto getMemberInfo(String email);

}
