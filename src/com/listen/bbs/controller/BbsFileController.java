package com.listen.bbs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.listen.base.controller.BaseController;
import com.listen.base.util.TotalDate;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.vo.BbsFileVo;

@Controller
public class BbsFileController extends BaseController{
/*	
	@Autowired
	private FileSystemResource fsResource;
	
	BbsDao bbsDao;
	
	public void setBbsDao(BbsDao bbsDao) {
		this.bbsDao = bbsDao;
	}

	// 파일 업로드
	@RequestMapping(value="/saveImage.listen", method = RequestMethod.POST)
	public String writePage(HttpServletRequest request, HttpSession session, BbsFileVo bbsFileVo) {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		String fileName = bbsFileVo.getUpload().getOriginalFilename(); 									// 파일의 이름
		String imgExt = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());			// 파일 확장자
		
		// upload 가능한 파일 타입 지정
		// equalsIgnoreCase 의 경우 대소문자 구분하지 않고 비교함
		if(imgExt.equalsIgnoreCase("JPG") || imgExt.equalsIgnoreCase("JPEG") || imgExt.equalsIgnoreCase("PNG") || imgExt.equalsIgnoreCase("GIF"))
		{
			try
			{
				byte[] bytes = bbsFileVo.getUpload().getBytes();
				File outFileName = new File(fsResource.getPath()+"/"+TotalDate.getToday("yyyy/MM/dd")+"/"+fileName);
				if(!outFileName.exists())
				{
					outFileName.mkdirs();
				}

				FileOutputStream fileOutputStream = new FileOutputStream(outFileName);
				fileOutputStream.write(bytes);
				fileOutputStream.close();
			}
			catch(IOException ioe)
			{
				System.err.println("파일 업로드 실패");
			} 
		}else {
			System.err.println("파일 업로드 성공");
		}
		System.out.println("writePage 들어옴");
		
		//int uploadFile = bbsDao.uploadFile();
		//ArrayList itemList  = itemDao.getItemList();
		
		//request.setAttribute("itemList", itemList); 
		request.setAttribute("page", "write");
		request.setAttribute("mainUrl", prefix + "bbs/BbsWrite.jsp");
		
		return frame;
	}
	*/
}
