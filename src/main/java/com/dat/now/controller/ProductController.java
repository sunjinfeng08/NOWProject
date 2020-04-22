package com.dat.now.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dat.now.bean.AJAXResult;
import com.dat.now.bean.Page;
import com.dat.now.bean.Product;
import com.dat.now.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService productService;

	@RequestMapping("/product")
	public String product() {
		return "product/product";
	}
	//产品添加
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(Product product) {
		AJAXResult result = new AJAXResult();
		try {
			product.setCompanycode("001");
			productService.insertProduct(product);
			System.out.println("jeff------------product-->");
		    System.out.println(product);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	// 保存更新的数据
	@ResponseBody
	@RequestMapping("/update")
	public Object update(Product product) {
		AJAXResult result = new AJAXResult();
		try {
			productService.updateProduct(product);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("/pageQuery")
	public Object pageQuery(String queryText, Integer pageno, Integer pagesize) {
		AJAXResult result = new AJAXResult();
		try {
			// 分页查询
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", (pageno - 1) * pagesize);
			map.put("size", pagesize);
			map.put("queryText", queryText);

			List<Product> products = productService.pageQueryData(map);
			System.out.println(products);
			// 当前页码
			// 总的数据条数
			int totalsize = productService.pageQueryCount(map);
			// 最大页码（总页码）
			int totalno = 0;
			if (totalsize % pagesize == 0) {
				totalno = totalsize / pagesize;
			} else {
				totalno = totalsize / pagesize + 1;
			}
			// 分页对象
			Page<Product> productPage = new Page<Product>();
			productPage.setDatas(products);
			productPage.setTotalno(totalno);
			productPage.setTotalsize(totalsize);
			productPage.setPageno(pageno);

			result.setData(productPage);
			result.setSuccess(true);
			// System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;

	}

	// delete the product single
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(Integer productid) {
		AJAXResult result = new AJAXResult();
		try {
			productService.deleteProductById(productid);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}
	//批量删除表数据
		@ResponseBody
		@RequestMapping("/deletes")
		public Object deletes( Integer[] productid ) {
			AJAXResult result = new AJAXResult();			
			try {				
				Map<String, Object> map = new HashMap<String, Object>();
				System.out.println("jeff-----delete the product batch--->");
				System.out.println(productid);
				map.put("productids", productid);
				productService.deleteProducts(map);
				result.setSuccess(true);
			} catch ( Exception e ) {
				e.printStackTrace();
				result.setSuccess(false);
			}			
			return result;
		}

}
