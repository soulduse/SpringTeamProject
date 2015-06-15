package com.listen.notice.vo;

public class NoticeVo {
	private int notifications_seq;
	private int bbs_seq;
	private int noti_state_seq;
	private String content;
	private String state_name;
	private int members_seq;
	private int rec_seq;
	private int bbs_add_seq;
	private String email;
	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	public int getNotifications_seq() {
		return notifications_seq;
	}
	public void setNotifications_seq(int notifications_seq) {
		this.notifications_seq = notifications_seq;
	}
	public int getBbs_seq() {
		return bbs_seq;
	}
	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}
	public int getNoti_state_seq() {
		return noti_state_seq;
	}
	public void setNoti_state_seq(int noti_state_seq) {
		this.noti_state_seq = noti_state_seq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMembers_seq() {
		return members_seq;
	}
	public void setMembers_seq(int members_seq) {
		this.members_seq = members_seq;
	}
	public int getRec_seq() {
		return rec_seq;
	}
	public void setRec_seq(int rec_seq) {
		this.rec_seq = rec_seq;
	}
	public int getBbs_add_seq() {
		return bbs_add_seq;
	}
	public void setBbs_add_seq(int bbs_add_seq) {
		this.bbs_add_seq = bbs_add_seq;
	}
}
