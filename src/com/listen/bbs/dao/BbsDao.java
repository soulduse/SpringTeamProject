package com.listen.bbs.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDao {

	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public BbsDao() {
	}

	public ArrayList getBbsFileList() {
		return (ArrayList) smct.queryForList("getBbsFileList");
	}
	
	public int uploadFile()
	{
		smct.update
		return (int)smct.insert("ddd");
	}
}
