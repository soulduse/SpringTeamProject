package com.listen.bbs.vo;

public class BbsVo {

	private int bbs_seq; // SEQ
	private int bg_img_seq; // 배경 SEQ
	private int bbs_info_seq; // info SEQ
	private int bbs_file_seq; // file SEQ
	private String bbs_contents; // 게시글 내용
	private int bbs_hitCount; // 조회수
	private String reg_email; // 이메일
	private String reg_date; // 등록일짜
	private String reg_ip; // 등록한 IP
	private String latitude; // 위도
	private String longtitude; // 경도
	private int badCount; // 나빠요
	private int goodCount; // 좋아요
	private char dispYn; // 게시판 공개여부
	private char chat_Yn; // 채팅 사요 여부
	private String path;
	private String save_name;
	// 채팅 사용여부
	private String selectItem;

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public int getBg_img_seq() {
		return bg_img_seq;
	}

	public void setBg_img_seq(int bg_img_seq) {
		this.bg_img_seq = bg_img_seq;
	}

	public int getBbs_info_seq() {
		return bbs_info_seq;
	}

	public void setBbs_info_seq(int bbs_info_seq) {
		this.bbs_info_seq = bbs_info_seq;
	}

	public int getBbs_file_seq() {
		return bbs_file_seq;
	}

	public void setBbs_file_seq(int bbs_file_seq) {
		this.bbs_file_seq = bbs_file_seq;
	}

	public String getBbs_contents() {
		return bbs_contents;
	}

	public void setBbs_contents(String bbs_contents) {
		this.bbs_contents = bbs_contents;
	}

	public int getBbs_hitCount() {
		return bbs_hitCount;
	}

	public void setBbs_hitCount(int bbs_hitCount) {
		this.bbs_hitCount = bbs_hitCount;
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

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
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

	public char getDispYn() {
		return dispYn;
	}

	public void setDispYn(char dispYn) {
		this.dispYn = dispYn;
	}

	public char getChat_Yn() {
		return chat_Yn;
	}

	public void setChat_Yn(char chat_Yn) {
		this.chat_Yn = chat_Yn;
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

	public String getSelectItem() {
		return selectItem;
	}

	public void setSelectItem(String selectItem) {
		this.selectItem = selectItem;
	}
}
