package com.listen.notice.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.notice.vo.NoticeVo;

@Repository
public class NoticeDao {

	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public NoticeDao(){
		
	}
	
	public ArrayList getNoticelist(String email) {
		// TODO Auto-generated method stub
		return (ArrayList)smct.queryForList("noticeList",email);
	}

	public void chattingReqAdd(NoticeVo noticeVo) {
		// TODO Auto-generated method stub
		smct.insert("chattingReqAdd",noticeVo);
	}

	public void UpdateNotification(String notifications_seq) {
		// TODO Auto-generated method stub
		smct.update("updateNotification",notifications_seq);
		
	}

}
