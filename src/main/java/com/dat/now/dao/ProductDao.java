package com.dat.now.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.dat.now.bean.Product;

public interface ProductDao {
	
	@Select("select * from product")
	List<Product> queryAll();

	List<Product> pageQueryData(Map<String, Object> map);

	int pageQueryCount(Map<String, Object> map);

	void updateProduct(Product product);

	void deleteProductById(Integer id);

	void deleteProducts(Map<String, Object> map);

	void insertProduct(Product product);

}
