package com.devmg.service;

import java.util.List;

import com.devmg.dto.Chat;

public interface ChatService {

	public List<Chat> SelectUSerService();

	public List<Chat> SelectMessageService(Chat chat);
	
	public void InsertMessageService(Chat chat);

}
