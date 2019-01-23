package com.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.objects.Product;
import com.services.IProductService;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService productService;
	
	
	
	@RequestMapping(value="/viewProducts")
	public ModelAndView getAllProducts(ModelAndView model) {
		List<Product> listProduct=this.productService.getAllProducts();
		model.addObject("products", listProduct);
		model.setViewName("home");
		return model;
	}
	
}
