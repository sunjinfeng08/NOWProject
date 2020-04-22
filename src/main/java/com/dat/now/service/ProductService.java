package com.dat.now.service;

import java.util.List;
import java.util.Map;

import com.dat.now.bean.Product;
import com.dat.now.bean.User;

public interface ProductService {
	List<Product> queryAll();
	List<Product> pageQueryData(Map<String, Object> map);
	int pageQueryCount(Map<String, Object> map);
	void updateProduct(Product product);
	void deleteProductById(Integer id);
	void deleteProducts(Map<String, Object> map);
	void insertProduct(Product product);

}
