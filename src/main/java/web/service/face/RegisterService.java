package web.service.face;

import web.dto.Product;

public interface RegisterService {

	/**
	 * 사고 파는 게시글 등록!
	 * @param product 제목,내용,수량,가격 등 들어간 객체
	 */
	void registContents(Product product);

}
