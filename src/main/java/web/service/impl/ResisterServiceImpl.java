package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.RegisterProductDao;
import web.dto.Product;
import web.service.face.RegisterService;

@Service
public class ResisterServiceImpl implements RegisterService{

	@Autowired RegisterProductDao register;
	
	@Override
	public void registContents(Product product) {
		//컨텐츠 인서트
		register.insertProduct(product);
		
	}

}
