package com.listen.bbs.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.listen.base.controller.BaseController;
import com.listen.base.util.TotalDate;
import com.listen.bbs.dao.BbsAddDao;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.dto.BbsAddWriteDto;
import com.listen.bbs.dto.BbsWriteDto;
import com.listen.bbs.vo.BbsVo;

@Controller
public class BbsController extends BaseController{
	
	@Autowired
	private ServletContext servletContext;
	
	private BbsDao bbsDao;
	private BbsAddDao bbsAddDao;
	
	
	public void setBbsDao(BbsDao bbsDao) {
		this.bbsDao = bbsDao;
	}
	
	public void setBbsAddDao(BbsAddDao bbsAddDao) {
		this.bbsAddDao = bbsAddDao;
	}

	@RequestMapping("/bbsAdd.listen")
	public String writeAddPage(BbsAddWriteDto bbsAddWriteDto, HttpServletRequest request)
	{
		bbsAddDao.bbsAddWrite(bbsAddWriteDto);
		return frame;
	}
	

	@RequestMapping("/writeSave.listen")
	public String writePage(BbsWriteDto bbsWriteDto, HttpServletRequest request) {
		
		// 글쓰기 부분 
		try{
			// 글쓸때 SEQ 값 증분
			/*
			BbsWriteDto getBbsSeq  = bbsDao.getBbsNextSeq();
			String seq = getBbsSeq.getNext_bbs_seq();
			bbsWriteDto.setNext_bbs_seq(seq);
			System.out.println("게시판 BBS_SEQ 값 : "+seq);
			*/
			
			bbsDao.bbsWrite(bbsWriteDto);
			message="작성완료";
			request.setAttribute("message", message);
		}catch(Exception e){
			e.printStackTrace();
			message="작성에 실패 했습니다.";
			request.setAttribute("message", message);
		}
		
		String confRoot = servletContext.getRealPath("/"); // WebContent경로
		String path = "/upfile/bbs_file/"+TotalDate.getToday("yyyy/MM/dd");
		String bbsFileUploadPath = confRoot + path;
		
		System.out.println("첫번째 경로 : "+bbsFileUploadPath);

		File dayFile = new File(bbsFileUploadPath);
		if (!dayFile.exists()) {
			dayFile.mkdirs();
		}

		String savePath = dayFile.getAbsolutePath();
		
		
		MultipartFile resPic = bbsWriteDto.getUpload();
		if(resPic.getSize() > 0)
		{
			String fileName = resPic.getOriginalFilename();														// 파일의 이름
			String imgExt = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());			// 파일 확장자
			long fileSize = resPic.getSize();		// 파일 사이즈
			
			bbsWriteDto.setOrg_name(fileName);
			bbsWriteDto.setPath(path);
			bbsWriteDto.setSave_name(System.currentTimeMillis() + "_" +bbsWriteDto.getOrg_name());
			bbsWriteDto.setFile_size(fileSize);
			
			// upload 가능한 파일 타입 지정
			// equalsIgnoreCase 의 경우 대소문자 구분하지 않고 비교함
			if(imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("PNG") || imgExt.equalsIgnoreCase("GIF"))
			{
				File outFileName = new File(savePath+"\\"+fileName);
				System.out.println("두번째 경로 : "+savePath+"\\"+fileName);
				try
				{
					resPic.transferTo(outFileName);
					bbsDao.updateRes_pic(bbsWriteDto);
				} catch(IllegalStateException e) {
					e.printStackTrace();
				} catch(IOException e) {
					e.printStackTrace();
				}
			}else {
				System.err.println("파일 형식이 올바르지 않습니다.");
				message = "파일 형식이 올바르지 않습니다.";
			}
		}
		System.out.println("writePage 들어옴");
		System.out.println(bbsWriteDto.getBbs_contents());

		return frame;
	}
	
	@RequestMapping("/bbsPopList.listen")
	public String bbsPopListPage(BbsVo bbsVo, HttpServletRequest request, HttpSession session) {
		
		
		String selectItem="bbs_hitCount";
		
		if((String)request.getParameter("selectItem")!="")
		{
			selectItem = (String)request.getParameter("selectItem");
			System.out.println("여기");
		}
		
		bbsVo.setSelectItem(selectItem);
		ArrayList bbsPopList = bbsDao.bbsDetailView(bbsVo);
		System.out.println("asdf");
		request.setAttribute("page", "popList");
		request.setAttribute("bbsPopList",  bbsPopList);
		request.setAttribute("mainUrl", prefix + "bbs/BbsPopList.jsp");
		return frame;
		
	}
	
}
