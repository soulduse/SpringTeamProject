package com.listen.admin.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.bbs.dto.BbsAddWriteDto;

@Repository
public class AdminDao {
	
	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public AdminDao(){}
	
	// 댓글 쓰기
	public void bbsAddWrite(BbsAddWriteDto bbsAddWriteDto) {
		smct.insert("bbsAddWrite", bbsAddWriteDto);
	}

}
