package com.listen.bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.listen.base.controller.BaseController;
import com.listen.bbs.vo.BbsFileVo;

@Controller
public class BbsController extends BaseController{
	
	@Autowired
	private FileSystemResource fsResource;
	
	@RequestMapping(value="fileupload", method=RequestMethod.GET)
	public String uoloadCompleted(BbsFileVo bbsFileVo, BindingResult result)
	
}
