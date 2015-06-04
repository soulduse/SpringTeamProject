package com.listen.bbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.dto.BbsDto;

@Controller
public class BbsController extends BaseController{
	
	private BbsDao bbsDao;
	
	public void setBbsDao(BbsDao bbsDao) {
		this.bbsDao = bbsDao;
	}

	@RequestMapping("/writeSave.listen")
	public String writePage(BbsDto bbsDto, HttpServletRequest request) {
		
		
		// 1. String bbs_contents = (String)request.getAttribute("bbs_contents");
		

		System.out.println("writePage 들어옴");
		System.out.println(bbsDto.getBbs_contents());

		try{
			bbsDao.bbsWrite(bbsDto);
			message="작성완료";
			request.setAttribute("message", message);
		}catch(Exception e){
			message="작성에 실패 했습니다.";
			request.setAttribute("message", message);
		}
		return frame;
	}
}
