package web.controller;


import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import file.dto.Filetest;
import file.service.face.FileService;
import web.dto.Product;
import web.service.face.RegisterService;


@Controller
public class RegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	@Autowired FileService fileService;
	@Autowired RegisterService registerService;
	

	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void home() {
		
	}
	
	@RequestMapping(value="/trade/resister", method=RequestMethod.GET)
	public void register() {
		
	}
	
	@RequestMapping(value="/trade/resister",method=RequestMethod.POST)
	public void fileup(
		
//		@RequestParam("title")String title
//		,@RequestParam("file") MultipartFile fileupload
		@RequestParam("file") List<MultipartFile> fileList
		 ,Product product
	) {
		
		
		
		
		//다른 것들 업로드..
		System.out.println(product);
		//시 군구 합치는 작업
		product.setLocation(product.getSi()+" "+product.getGu());
		
		//유저 이메일..임시로 세션이없어서 집어넣음
		product.setUser_email("qwe179@hanmail.net");
		
		//price 컴마떼기
		String price=product.getPrice();
		price = price.replaceAll(",", "");
		product.setPrice(price);
		
		//날짜 형식 바꾸끼
		 Date today = new Date();
		 
		 Date sqlDate = new Date(today.getTime());
		 product.setReg_date(sqlDate);
		 System.out.println(sqlDate);
		 
		 
		registerService.registContents(product);
		
		
		//파일 업로드.. 여러개올릴수 있음
		try {
			for (int i=0; i<fileList.size(); i++) {
				MultipartFile fileupload = fileList.get(i);
				
				logger.info("파일업로드 처리");
				System.out.println("fileupload : "+fileupload);
				logger.info("fileupload : " + fileupload.getOriginalFilename());
				fileService.filesave(fileupload);
				System.out.println(fileupload);
				
			}
			
		} catch (Exception e) {
			System.out.println("업로드 할 파일이 존재하지 않습니다");
		}

		
		
		
		
		
		
	}

	
	
	
}
