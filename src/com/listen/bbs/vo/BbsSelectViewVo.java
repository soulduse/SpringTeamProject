package com.listen.bbs.vo;

public class BbsSelectViewVo {

	private int bbs_seq;
	private String bbs_contents;
	private int bbs_hitcount;
	private int goodcount;
	private String reg_email;
	private String reg_date;
	private String path;
	private String save_name;
	private String bbs_good_yn;
	private String bbs_add_good_yn;

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

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

	public int getBbs_hitcount() {
		return bbs_hitcount;
	}

	public void setBbs_hitcount(int bbs_hitcount) {
		this.bbs_hitcount = bbs_hitcount;
	}

	public int getGoodcount() {
		return goodcount;
	}

	public void setGoodcount(int goodcount) {
		this.goodcount = goodcount;
	}

	public String getReg_email() {
		return reg_email;
	}

	public void setReg_email(String reg_email) {
		this.reg_email = reg_email;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getSave_name() {
		return save_name;
	}

	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}

	public String getBbs_good_yn() {
		return bbs_good_yn;
	}

	public void setBbs_good_yn(String bbs_good_yn) {
		this.bbs_good_yn = bbs_good_yn;
	}

	public String getBbs_add_good_yn() {
		return bbs_add_good_yn;
	}

	public void setBbs_add_good_yn(String bbs_add_good_yn) {
		this.bbs_add_good_yn = bbs_add_good_yn;
	}

}
