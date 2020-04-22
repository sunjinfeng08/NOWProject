package com.dat.now.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dat.now.bean.Product;
import com.dat.now.bean.User;
import com.dat.now.dao.ProductDao;
import com.dat.now.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
    @Autowired 
	private ProductDao productDao;
	public List<Product> queryAll() {
		return productDao.queryAll();
	}
	public List<Product> pageQueryData(Map<String, Object> map) {
		return productDao.pageQueryData(map);
	}
	public int pageQueryCount(Map<String, Object> map) {
		return productDao.pageQueryCount(map);
	}
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
		
	}
	public void deleteProductById(Integer id) {
		productDao.deleteProductById(id);		
	}
	public void deleteProducts(Map<String, Object> map) {
		 
		productDao.deleteProducts(map);
	}
	public void insertProduct(Product product) {
		productDao.insertProduct(product);
		
	}

}
