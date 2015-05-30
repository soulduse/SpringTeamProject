package com.listen.main.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class ItemDao {

	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public ItemDao() {
	}


	public ArrayList getItemList() {
		return (ArrayList) smct.queryForList("getItemList");// xml로 가서 "getItemList"인 id를 찾습니다.
	}

}
