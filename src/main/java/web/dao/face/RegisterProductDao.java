package web.dao.face;

import web.dto.Product;

public interface RegisterProductDao {
	/**
	 * product 테이블에 인서트하는 쿼리
	 * @param product
	 */
	public void insertProduct(Product product);

}
