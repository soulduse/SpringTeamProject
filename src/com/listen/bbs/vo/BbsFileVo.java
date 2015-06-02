package com.listen.bbs.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BbsFileVo {
	private String content;	  // 내용
	private String path;		  // 경로
	private String orgName;	  // 원래의 파일이름
	private String saveName;  // 저장된 이름
	private String fileSize;		  // 파일 사이즈
	
	private String name;
	private CommonsMultipartFile fileData;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public CommonsMultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
	
	/*
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getOrgName() {
		return orgName;
	}
	
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	public String getSaveName() {
		return saveName;
	}
	
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	
	public String getFileSize() {
		return fileSize;
	}
	
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	//*/
}
