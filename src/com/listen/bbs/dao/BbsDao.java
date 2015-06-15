package com.listen.bbs.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.bbs.dto.BbsLikeSwitchDto;
import com.listen.bbs.dto.BbsWriteDto;
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
	public void bbsWrite(BbsWriteDto bbsWriteDto){
		smct.insert("bbsTextWrite",bbsWriteDto);
	}
	
	// 글 볼때 Filter Insert
	
	// 글목록 보기
	public ArrayList bbsViewList()
	{
		return (ArrayList) smct.queryForList("bbsViewList");
	}
	
	// 인기있는 글 보기
	public ArrayList bbsDetailView(BbsVo bbsVo)
	{
		return (ArrayList) smct.queryForList("bbsDetailView",bbsVo);
	}
	
	// 파일 업로드
	public void updateRes_pic(BbsWriteDto bbsWriteDto)
	{
		smct.insert("bbsFileUpload", bbsWriteDto);
	}
	
	// 글 공감버튼 이벤트 처리 Ajax
	public void likeCountUpdate(BbsLikeSwitchDto bbsLikeSwitchDto)
	{
		smct.update("likeCountUpdate", bbsLikeSwitchDto);
	}
	
	// 마이 페이지
	public ArrayList bbsMyViewList(BbsVo vo)
	{
		return (ArrayList) smct.queryForList("bbsMyViewList", vo);
	}
	
	
	// 나이 별 글 보기
	public ArrayList bbsAgeList(BbsVo bbsVo)
	{
		return (ArrayList) smct.queryForList("bbsAgeList",bbsVo);
	}
	

	   
	   //메인 마이스토리
	   public ArrayList mainMyStory(BbsVo vo)
	   {
	      return (ArrayList) smct.queryForList("mainMyStory", vo);
	   }
	   
	   //마이스토리 배경화면 업로드
	   public void update_img(MyBackGroundVo myBgImg)
	   {
	      if(0 == smct.update("myBgFileUpload", myBgImg)){
	         smct.insert("myBgFileInsert", myBgImg);
	      }
	   }

	   // 마이 스토리 배경화면
	   public MyBackGroundVo bbsMybgimg(BbsVo vo)
	   {
	      return (MyBackGroundVo) smct.queryForObject("bbsMybgimg", vo);
	   }
	   
	   // 무한스크롤 글 보기
		public ArrayList bbsViewList2(BbsVo bbsVo)
		{
			return (ArrayList) smct.queryForList("bbsViewList2",bbsVo);
		}
	   
}
