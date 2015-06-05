package com.listen.member.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class MemberDao 
{
	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public MemberDao() {}
	public ArrayList getEmailList(String id)
	{
		return (ArrayList) smct.queryForList("getEmailList", id);
	}
	public ArrayList loginAction() 
	{
		return (ArrayList) smct.queryForList("loginAction");
	}

}
