package com.listen.admin.dto;

public class OpinionDto {
	private String bbs_contents;
	private String reg_email;
	private String reg_ip;

	public String getBbs_contents() {
		return bbs_contents;
	}

	public void setBbs_contents(String bbs_contents) {
		this.bbs_contents = bbs_contents;
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

}
