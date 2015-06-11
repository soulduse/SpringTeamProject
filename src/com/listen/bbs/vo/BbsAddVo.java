package com.listen.bbs.vo;

import javax.xml.bind.annotation.XmlRootElement;

public class BbsAddVo {
	
	private String bbs_add_seq;
	private String bbs_seq;
	private String content;
	private String reg_email;
	private String reg_date;
	private String reg_ip;
	private int badCount;
	private int goodCount;

	public String getBbs_add_seq() {
		return bbs_add_seq;
	}

	public void setBbs_add_seq(String bbs_add_seq) {
		this.bbs_add_seq = bbs_add_seq;
	}

	public String getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(String bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_email() {
		return reg_email;
	}

	public void setReg_email(String reg_email) {
		this.reg_email = reg_email;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getReg_ip() {
		return reg_ip;
	}

	public void setReg_ip(String reg_ip) {
		this.reg_ip = reg_ip;
	}

	public int getBadCount() {
		return badCount;
	}

	public void setBadCount(int badCount) {
		this.badCount = badCount;
	}

	public int getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	
}
