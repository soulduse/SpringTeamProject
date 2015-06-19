package com.listen.bbs.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
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
}
