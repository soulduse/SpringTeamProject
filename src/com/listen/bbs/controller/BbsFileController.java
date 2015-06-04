package com.listen.bbs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.listen.base.controller.BaseController;
import com.listen.base.util.TotalDate;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.vo.BbsFileVo;

@Controller
public class BbsFileController extends BaseController{

	/*
	@Autowired
	private FileSystemResource fsResource;
	*/
	@Autowired
	private ServletContext servletContext;
	
	private BbsDao bbsDao;
	
	public void setBbsDao(BbsDao bbsDao) {
		this.bbsDao = bbsDao;
	}

	// 파일 업로드
	@RequestMapping(value="/saveImage.listen", method = RequestMethod.POST)
	public String writePage(HttpServletRequest request, HttpSession session, BbsFileVo bbsFileVo) {
		
		String confRoot = servletContext.getRealPath("/"); // WebContent경로
		String path = "upfile/bbs_file/"+TotalDate.getToday("yyyy/MM/dd");
		String bbsFileUploadPath = confRoot + path;

		File dayFile = new File(bbsFileUploadPath);
		if (!dayFile.exists()) {
			dayFile.mkdirs();
		}

		String savePath = dayFile.getAbsolutePath();
		
		
		MultipartFile resPic = bbsFileVo.getUpload();
		if(resPic.getSize() > 0)
		{
			String fileName = resPic.getOriginalFilename();														// 파일의 이름
			String imgExt = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());			// 파일 확장자
			long fileSize = resPic.getSize();		// 파일 사이즈
			
			bbsFileVo.setOrg_name(fileName);
			bbsFileVo.setPath(path);
			bbsFileVo.setSave_name(System.currentTimeMillis() + "_" +bbsFileVo.getOrg_name());
			bbsFileVo.setFile_size(fileSize);
			
			// upload 가능한 파일 타입 지정
			// equalsIgnoreCase 의 경우 대소문자 구분하지 않고 비교함
			if(imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("PNG") || imgExt.equalsIgnoreCase("GIF"))
			{
				File outFileName = new File(savePath+"\\"+fileName);
				try
				{
					resPic.transferTo(outFileName);
					//bbsDao.updateRes_pic(bbsFileVo);
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
		
		//int uploadFile = bbsDao.uploadFile();
		//ArrayList itemList  = itemDao.getItemList();
		
		//request.setAttribute("itemList", itemList); 
		request.setAttribute("page", "write");
		request.setAttribute("mainUrl", prefix + "bbs/BbsWrite.jsp");
		
		return frame;
	}
	//*/
}
