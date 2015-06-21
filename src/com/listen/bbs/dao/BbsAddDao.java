package com.listen.bbs.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.bbs.dto.BbsAddWriteDto;

@Repository
public class BbsAddDao {

	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public BbsAddDao() {
	}
/////////////////////////////// 형준이가 사용했어요 bbsAddWrite
	// 댓글 쓰기
	public void bbsAddWrite(BbsAddWriteDto bbsAddWriteDto) {
		smct.insert("bbsAddWrite", bbsAddWriteDto);
	}

	// 댓글 보기
	public ArrayList bbsAddList(BbsAddWriteDto bbsAddWriteDto) {
		return (ArrayList) smct.queryForList("bbsAddList", bbsAddWriteDto);
	}

	public ArrayList m_bbsAddList(BbsAddWriteDto bbsAddWriteDto) {
		// TODO Auto-generated method stub
		return (ArrayList) smct.queryForList("bbsAddList", bbsAddWriteDto);
	}

	public void CloverEvent(BbsAddWriteDto bbsAddWriteDto) {
		smct.update("memberCloverUpdate", bbsAddWriteDto);
		System.out.println("..............MEMBERS Table 클로버+ Update Complet");
		smct.update("bbsAddCountUpdate", bbsAddWriteDto);
		System.out.println("..............BBS_ADD Table GoodCount+ Update Complet");
		smct.update("ynFilterAddInsert", bbsAddWriteDto);
		System.out.println("..............YN_FILTER Table INSERT Complet");
	}
}
