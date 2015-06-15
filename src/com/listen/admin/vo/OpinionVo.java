package com.listen.admin.vo;

public class OpinionVo {
	private int bbs_seq;
	private String bbs_contents;
	private String reg_email;
	private String reg_date;

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
