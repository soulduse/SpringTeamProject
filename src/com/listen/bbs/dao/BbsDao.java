package com.listen.bbs.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.bbs.dto.BbsLikeSwitchDto;
import com.listen.bbs.dto.BbsViewFilterDto;
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
	
	// 글쓰기
	public void bbsWrite(BbsWriteDto bbsWriteDto){
		smct.insert("bbsTextWrite",bbsWriteDto);
	}
	
	// 글 볼때 Filter Insert
	
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
	
	// 파일이 있을때 BBS TABLE의 BBS_FILE_SEQ 값을 UPDATE 해줌
	public void fileSeqUpdate(BbsWriteDto bbsWriteDto)
	{
		smct.update("fileSeqUpdate", bbsWriteDto);
	}
	
	// 글 공감버튼 이벤트 처리 Ajax
	public void likeCountUpdate(BbsLikeSwitchDto bbsLikeSwitchDto)
	{
		smct.update("likeCountUpdate", bbsLikeSwitchDto);
		System.out.println("게시글의 GOODCOUNT UPDATE 됨");
		int updCheck = (int)smct.update("checkYnFilter",bbsLikeSwitchDto);
		if(updCheck == 0)
		{
			smct.insert("BbsLikeYnFilter", bbsLikeSwitchDto);
			System.out.println("YN_FILTER UPDATE의 조건이 없어 INSERT 실행");
		}
	}
	
	// 글 보기시 Ajax 처리 
	public String bbsSelectView(BbsViewFilterDto bbsViewFilterDto){
		ArrayList updCheck = (ArrayList)smct.queryForList("bbsViewSelectFilter", bbsViewFilterDto);
		if(updCheck.size() == 0)
		{
			smct.insert("bbsViewInsertFilter",bbsViewFilterDto);
		}
		smct.queryForObject("bbsSelectView",bbsViewFilterDto);
		return "";
	}
	
	// 마이 페이지
	public ArrayList bbsMyViewList(BbsVo vo)
	{
		return (ArrayList) smct.queryForList("bbsMyViewList", vo);
	}

}
