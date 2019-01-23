package com.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.objects.Product;
import com.services.IProductService;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService productSevice;
	
	
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String getAllProducts(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("getProducts", this.productSevice.getAllProducts());
		return "product";
	}
	
}
