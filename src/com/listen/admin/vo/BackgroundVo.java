package com.listen.admin.vo;

public class BackgroundVo {
	private int bg_img_seq;
	private String path;
	private String org_name;
	private String save_name;
	private int file_size;
	private String reg_email;
	private String reg_date;

	public int getBg_img_seq() {
		return bg_img_seq;
	}

	public void setBg_img_seq(int bg_img_seq) {
		this.bg_img_seq = bg_img_seq;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getSave_name() {
		return save_name;
	}

	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
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
