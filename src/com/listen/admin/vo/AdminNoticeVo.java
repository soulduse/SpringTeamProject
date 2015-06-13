package com.listen.admin.vo;

public class AdminNoticeVo {

	private int bbs_seq;
	private String bbs_title;
	private String bbs_count;
	private String reg_email;
	private String reg_date;
	private int bbs_hitCount;
	
	public String getBbs_count() {
		return bbs_count;
	}

	public void setBbs_count(String bbs_count) {
		this.bbs_count = bbs_count;
	}

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public String getBbs_title() {
		return bbs_title;
	}

	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
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

	public int getBbs_hitCount() {
		return bbs_hitCount;
	}

	public void setBbs_hitCount(int bbs_hitCount) {
		this.bbs_hitCount = bbs_hitCount;
	}

}
