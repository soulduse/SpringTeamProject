package com.listen.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listen.base.controller.BaseController;
import com.listen.bbs.dao.BbsDao;
import com.listen.bbs.vo.BbsTest;

@Controller
public class BbsController extends BaseController{
	
	private BbsDao bbsDao;
	
	public void setBbsDao(BbsDao bbsDao) {
		this.bbsDao = bbsDao;
	}

	@RequestMapping("/writeSave.listen")
	public String writePage(BbsTest bbsTest) {

		System.out.println("writePage 들어옴");
		Object obj  =bbsDao.bbsWrite(bbsTest);
		
		return frame;
	}
}
