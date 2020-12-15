package com.devmg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmg.dao.UserDao;
import com.devmg.dao.UserDaoImpl;
import com.devmg.dto.Chat;


@Service
public class ChatServiceImpl implements ChatService{
	
	private static final Logger logger 
	= LoggerFactory.getLogger(ChatServiceImpl.class);
	
	@Autowired
	private UserDao userDao;
	
	
	@Override
	public List<Chat> SelectUSerService(){
		
		logger.info("시작");
		
		List<Chat> list=userDao.selectAllUser();
		
		logger.info("끝");
		
		return list;
	}
	
	@Override
	public List<Chat> SelectMessageService(Chat chat){
		
	
		
		List<Chat> list=userDao.selectAllMessage(chat);

		
		return list;
	}

	@Override
	public void InsertMessageService(Chat chat) {
		UserDao userDaoo = new UserDaoImpl();
	
		int a=userDaoo.insertMessage(chat);

	
		
		
	}
	
	
	
	
	
	
}
