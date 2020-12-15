package web.dto;

import java.util.Date;

public class Product {
	
	private int reg_no;
	private String trade_class;
	private String category;
	private String price;
	private String title;
	private String content;
	private int quantity;
	private String user_email;
	private String location;
	private String gu;
	private String si;
	private Date reg_date;
	
	@Override
	public String toString() {
		return "Product [reg_no=" + reg_no + ", trade_class=" + trade_class + ", category=" + category + ", price="
				+ price + ", title=" + title + ", content=" + content + ", quantity=" + quantity + ", user_email="
				+ user_email + ", location=" + location + ", gu=" + gu + ", si=" + si + ", reg_date=" + reg_date + "]";
	}
	
	
	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	public int getReg_no() {
		return reg_no;
	}
	public void setReg_no(int reg_no) {
		this.reg_no = reg_no;
	}
	public String getTrade_class() {
		return trade_class;
	}
	public void setTrade_class(String trade_class) {
		this.trade_class = trade_class;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	

}
