package com.listen.bbs.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.listen.base.controller.BaseController;
import com.listen.base.util.TotalDate;
import com.listen.bbs.dao.BbsAddDao;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.dto.BbsAddWriteDto;
import com.listen.bbs.dto.BbsLikeSwitchDto;
import com.listen.bbs.dto.BbsWriteDto;
import com.listen.bbs.vo.BbsAddVo;
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

	// 글 공감 버튼처리 Ajax
	@RequestMapping("/ajax/bbsLikeCount.listen")
	public void likeCount(BbsLikeSwitchDto bbsLikeSwitchDto)
	{
		bbsDao.likeCountUpdate(bbsLikeSwitchDto);
	}
	
	// 댓글 Ajax 입력
	@RequestMapping("/ajax/bbsAdd.listen")
	public void writeAddPage(BbsAddWriteDto bbsAddWriteDto, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		if(bbsAddWriteDto.getContent() != "" && bbsAddWriteDto.getContent().length()>0)
		{
			bbsAddDao.bbsAddWrite(bbsAddWriteDto);
		}
		ArrayList bbsAddList = (ArrayList)bbsAddDao.bbsAddList(bbsAddWriteDto);
		response.setCharacterEncoding("utf-8");
		if(bbsAddList.size()>0)
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.print("<root>");
			for(int i=0; i<bbsAddList.size(); i++)
			{
				BbsAddVo bbsAddVo = (BbsAddVo) bbsAddList.get(i);
				String content = URLDecoder.decode(bbsAddVo.getContent(), "UTF-8");	// 한글처리부분
				String reg_date = bbsAddVo.getReg_date();
				int goodCount = bbsAddVo.getGoodCount();
				out.println("<items>");
				out.println("<content>"+content+"</content>");
				out.println("<reg_date>"+reg_date+"</reg_date>");
				out.println("<goodcount>"+goodCount+"</goodcount>");
				out.println("</items>");
			}
			out.println("</root>");
			out.close();
		}
		else
		{
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		}
	}

	@RequestMapping("/writeSave.listen")
	public String writePage(BbsWriteDto bbsWriteDto, HttpServletRequest request) {
		
		// 글쓰기 부분 
		try{
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
	
}
