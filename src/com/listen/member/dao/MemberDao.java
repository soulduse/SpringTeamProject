package com.listen.member.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.listen.member.vo.MemberVo;

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
	public ArrayList getPassList(String pass)
	{
		return (ArrayList) smct.queryForList("getPassList", pass);
	}
	
	public ArrayList getInfoList(String id)
	{
		return (ArrayList) smct.queryForList("getInfoList", id);
	}
	public ArrayList loginAction() 
	{
		return (ArrayList) smct.queryForList("loginAction");
	}
	public void join(MemberVo memberVo)
	{
		smct.insert("join", memberVo);		
	}
	public void memberUpdate(MemberVo memberVo)
	{
		System.out.println(memberVo.getEmail());
		smct.update("memberUpdate", memberVo);
	}
	
	public void locationUpdate(MemberVo memberVo)
	{
		smct.update("locationUpdate", memberVo);
	}
	
	public ArrayList getCheckEmail(String id)
	{
		return (ArrayList) smct.queryForList("getCheckEmail", id);
	}
	public ArrayList getCheckPass(String pass)
	{
		return (ArrayList) smct.queryForList("getCheckPass", pass);
	}

}
