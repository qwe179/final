package com.devmg.dto;

import java.util.Date;

public class Chat {

	private String user_name;
	private String user_id;
	private String sender;
	private String reciever;
	private String message;
	private String send_time;
	@Override
	public String toString() {
		return "Chat [user_name=" + user_name + ", user_id=" + user_id + ", sender=" + sender + ", reciever=" + reciever
				+ ", message=" + message + ", send_time=" + send_time + "]";
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	
	
	
	
	
}
