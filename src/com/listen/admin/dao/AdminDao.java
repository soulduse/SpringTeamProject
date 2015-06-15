package com.listen.admin.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.admin.dto.NoticeDto;
import com.listen.admin.dto.OpinionDto;
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
	
	// 공지사항 글 수정
	public void noticeUpdate(NoticeDto noticeDto)
	{
		smct.update("noticeUpdate", noticeDto);
	}
	
	// 공지사항 글 삭제
	public void noticeDelete(int bbs_seq) {
		smct.update("noticeDelete", bbs_seq);
	}
	
	// 공지사항 다중글 삭제
	public void noticeArrayDelete(int[] bbs_seq) {
		smct.update("noticeDelete", bbs_seq);
	}
	
	// 조회수 증가
	public void hitPlus(int bbs_seq)
	{
		smct.update("hitPlus", bbs_seq);
	}

	// 의견 보내기
	public void opinionWrite(OpinionDto opinionDto) {
		smct.insert("opinionWrite", opinionDto);
	}
	
	// 의견보기
	public ArrayList opinionList() {
		return (ArrayList)smct.queryForList("opinionList");
	}

	// 배경그림 관리 페이지 목록 보기
	public ArrayList backgroundList() {
		return (ArrayList)smct.queryForList("backgroundList");
	}

}
