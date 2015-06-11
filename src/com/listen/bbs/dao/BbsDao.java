package com.listen.bbs.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.bbs.dto.BbsWriteDto;
import com.listen.bbs.vo.BbsVo;

@Repository
public class BbsDao {

	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public BbsDao() {
	}

	/*
	public ArrayList getBbsFileList() {
		return (ArrayList) smct.queryForList("getBbsFileList");
	}
	*/
	
	// 글쓰기
	public void bbsWrite(BbsWriteDto bbsWriteDto){
		smct.insert("bbsTextWrite",bbsWriteDto);
	}
	
	// 글목록 보기
	public ArrayList bbsViewList()
	{
		return (ArrayList) smct.queryForList("bbsViewList");
	}
	
	public ArrayList bbsDetailView(BbsVo bbsVo)
	{
		return (ArrayList) smct.queryForList("bbsDetailView",bbsVo);
	}
	
	// 파일 업로드
	public void updateRes_pic(BbsWriteDto bbsWriteDto)
	{
		smct.insert("bbsFileUpload", bbsWriteDto);
	}
	
	// 게시판 seq 값 가져오기
	public BbsWriteDto getBbsNextSeq()
	{
		return (BbsWriteDto)smct.queryForObject("getNextSeq");
	}

}
