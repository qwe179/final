package com.devmg.dao;

import java.util.List;



import com.devmg.dto.Chat;


public interface UserDao {
	
	
	
	
	public List<Chat> selectAllUser();
	
	public List<Chat> selectAllMessage(Chat chat);
	
	public int insertMessage(Chat chat);

}
