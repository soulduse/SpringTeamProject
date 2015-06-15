package com.listen.chatting.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.listen.chatting.vo.ChattingMemberVo;
import com.listen.chatting.vo.ChattingVo;

@Repository
public class ChattingDao {
	
	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public ChattingDao(){
	}

	public ArrayList getChattinglist(String email) {
		// TODO Auto-generated method stub
		return (ArrayList) smct.queryForList("chattingList",email);
	}
	
	
	public void createRoom(HashMap map, ChattingVo chattingVo) {
		// TODO Auto-generated method stub
		smct.insert("craeteRoom",chattingVo);
		String chatting_seq = chattingVo.getChatting_seq();
		map.put("chatting_seq",chatting_seq);
		smct.insert("chattinUser1",map);
		smct.insert("chattinUser2",map);
	}



	public ArrayList RandomName(String rec_seq ,String send_seq) {
		// TODO Auto-generated method stub
		ArrayList ramdomName= new ArrayList();
		
		ArrayList firset = (ArrayList)smct.queryForList("randomName");
		System.out.println("여기");
		ArrayList second = (ArrayList)smct.queryForList("randomName2");
		System.out.println("여기");
		int random = (int) (Math.random() * firset.size()); 
		int random2 = (int) (Math.random() * second.size());
		int random3 = (int) (Math.random() * firset.size()); 
		int random4 = (int) (Math.random() * second.size());
		while(true)
		{
			if(random == random3 && random2==random4)
			{
				random3 = (int) (Math.random() * firset.size()); 
				random4 = (int) (Math.random() * second.size());
			}
			if(random != random3 && random2==random4 || random == random3 && random2!=random4 || random != random3 && random2 != random4)
			{
				break;
			}
		}
		ChattingMemberVo cvvo1 = (ChattingMemberVo) firset.get(random);
		ChattingMemberVo cvvo2 = (ChattingMemberVo) second.get(random2);
		ChattingMemberVo cvvo3 = (ChattingMemberVo) firset.get(random3);
		ChattingMemberVo cvvo4 = (ChattingMemberVo) second.get(random4);
		ramdomName.add(cvvo1);
		ramdomName.add(cvvo2);
		ramdomName.add(cvvo3);
		ramdomName.add(cvvo4);
		return ramdomName;
	}

	public void deletChat(HashMap map) {
		// TODO Auto-generated method stub
		smct.delete("deleteChat", map);
		
	}
}
