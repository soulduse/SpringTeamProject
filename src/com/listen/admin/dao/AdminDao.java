package com.listen.admin.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.admin.dto.NoticeDto;
import com.listen.admin.vo.AdminNoticeVo;

@Repository
public class AdminDao {
	
	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public AdminDao(){}

	// 공지사항 등록
	public void noticeWrite(NoticeDto noticeDto) {
		smct.insert("noticeWrite", noticeDto);
	}
	
	// 공지사항 리스트 보기
	public ArrayList noticeList() {
		return (ArrayList)smct.queryForList("noticeList");
	}
	
	// 공지사항 글 보기
	public AdminNoticeVo noticeView(int bbs_seq) {
		return (AdminNoticeVo)smct.queryForObject("noticeView", bbs_seq);
	}
	
	// 조회수 증가
	public void hitPlus(int bbs_seq)
	{
		smct.update("hitPlus", bbs_seq);
	}

}
