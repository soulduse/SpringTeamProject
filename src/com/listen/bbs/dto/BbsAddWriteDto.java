package com.listen.bbs.dto;

public class BbsAddWriteDto {

	private int bbs_add_seq;
	private int bbs_seq;
	private String content;
	private String reg_email;
	private String reg_ip;
	private String reg_date;
	private int goodCount;

	public int getBbs_add_seq() {
		return bbs_add_seq;
	}

	public void setBbs_add_seq(int bbs_add_seq) {
		this.bbs_add_seq = bbs_add_seq;
	}

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
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

	public String getReg_ip() {
		return reg_ip;
	}

	public void setReg_ip(String reg_ip) {
		this.reg_ip = reg_ip;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}

}
