package com.sinau.dao;

import com.sinau.dto.Member;

public interface MemberDao {
	//�̸��� �̿��Ͽ� ��й�ȣ ��������
	public String getPwd(String m_email);
	//�α����� ȸ������ ��������
	public Member getMemInfo(String m_email);
	
	public void memberInsert(Member member);
	

}
