package com.listen.bbs.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.bbs.dto.BbsLikeSwitchDto;
import com.listen.bbs.dto.BbsViewFilterDto;
import com.listen.bbs.dto.BbsWriteDto;
import com.listen.bbs.vo.BbsSelectViewVo;
import com.listen.bbs.vo.BbsVo;
import com.listen.bbs.vo.MyBackGroundVo;

@Repository
public class BbsDao {

	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public BbsDao() {
	}

	// 글쓰기
	public void bbsWrite(BbsWriteDto bbsWriteDto) {
		smct.insert("bbsTextWrite", bbsWriteDto);
	}

	// 글 볼때 Filter Insert

	// 글목록 보기
	public ArrayList bbsViewList() {
		return (ArrayList) smct.queryForList("bbsViewList");
	}

	// 인기있는 글 보기
	public ArrayList bbsDetailView(BbsVo bbsVo) {
		return (ArrayList) smct.queryForList("bbsDetailView", bbsVo);
	}

	// 파일 업로드
	public void updateRes_pic(BbsWriteDto bbsWriteDto) {
		smct.insert("bbsFileUpload", bbsWriteDto);
	}

	// 파일이 있을때 BBS TABLE의 BBS_FILE_SEQ 값을 UPDATE 해줌
	public void fileSeqUpdate(BbsWriteDto bbsWriteDto) {
		smct.update("fileSeqUpdate", bbsWriteDto);
	}

	// 글 공감버튼 이벤트 처리 Ajax
	public void likeCountUpdate(BbsLikeSwitchDto bbsLikeSwitchDto) {
		smct.update("likeCountUpdate", bbsLikeSwitchDto);
		System.out.println("게시글의 GOODCOUNT UPDATE 됨");
		int updCheck = (int) smct.update("checkYnFilter", bbsLikeSwitchDto);
		if (updCheck == 0) {
			smct.insert("BbsLikeYnFilter", bbsLikeSwitchDto);
			System.out.println("YN_FILTER UPDATE의 조건이 없어 INSERT 실행");
		}
	}

	// 글 보기시 Ajax 처리
	public BbsSelectViewVo bbsSelectView(BbsViewFilterDto bbsViewFilterDto) {
		int updCheck = (int) smct.update("bbsViewUpdateFilter",
				bbsViewFilterDto);
		System.out.println("업데이트 성공!");
		if (updCheck == 0) {
			smct.insert("bbsViewInsertFilter", bbsViewFilterDto);
			System.out.println("업데이트 값이 없어서 INSERT 실행!");
		}
		BbsSelectViewVo bbsSelectViewVo = (BbsSelectViewVo) smct
				.queryForObject("bbsSelectView", bbsViewFilterDto);
		System.out.println("XML 데이터를 만들기위한 SELECT 작업 완료 ! ");

		return bbsSelectViewVo;
	}

	// 마이 페이지
	public ArrayList bbsMyViewList(BbsVo vo) {
		return (ArrayList) smct.queryForList("bbsMyViewList", vo);
	}

	// 나이 별 글 보기
	public ArrayList bbsAgeList(BbsVo bbsVo) {
		return (ArrayList) smct.queryForList("bbsAgeList", bbsVo);
	}

	// 메인 마이스토리
	public ArrayList mainMyStory(BbsVo vo) {
		return (ArrayList) smct.queryForList("mainMyStory", vo);
	}

	// 마이스토리 배경화면 업로드
	public void update_img(MyBackGroundVo myBgImg) {
		if (0 == smct.update("myBgFileUpload", myBgImg)) {
			smct.insert("myBgFileInsert", myBgImg);
		}
	}

	// 마이 스토리 배경화면
	public MyBackGroundVo bbsMybgimg(BbsVo vo) {
		return (MyBackGroundVo) smct.queryForObject("bbsMybgimg", vo);
	}
	
	// 마이스토리 비공개글 -->공개
	public void dispSave(BbsVo bv) {
		smct.update("dispUpload", bv);
	}

	// 관심있는 글 보기
	public ArrayList bbsInterestView(BbsVo bbsVo) {
		return (ArrayList) smct.queryForList("bbsInterestView", bbsVo);
	}
	
	public void myStoryDispY(BbsVo bbsVo) {
		smct.update("myStoryDispY", bbsVo);
	}

	// 무한스크롤 글 보기
	public ArrayList bbsViewList2(BbsVo bbsVo) {
		return (ArrayList) smct.queryForList("bbsViewList2", bbsVo);
	}

	
///////////////////////////////////////모바일 부분

	public ArrayList m_bbsViewList() {
		return (ArrayList) smct.queryForList("m_bbsViewList");
	}
	
	public ArrayList m_myBbsList(BbsVo bbsVo) {
		return (ArrayList) smct.queryForList("m_myBbsList", bbsVo);
	}

	public ArrayList m_bbsTopStoriesList() {
		return (ArrayList) smct.queryForList("m_bbsTopStoriesList");
	}
	
	public ArrayList m_bbsinit(BbsVo bbsVo) {
		return (ArrayList) smct.queryForList("m_bbsinit", bbsVo);
	}

	public void myStoryDispN(BbsVo bbsVo) {
		// TODO Auto-generated method stub
		smct.update("myStoryDispN", bbsVo);
		
	}


}
