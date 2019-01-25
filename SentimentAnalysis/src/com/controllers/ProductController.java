package com.controllers;

import java.nio.file.Paths;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping(value="/addProduct" ,method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product, HttpServletRequest request) {
//		System.out.println(params.get("title"));
//		product.setTitle(params.get("title"));
//		product.setDescription(params.get("decription"));
//		product.setImageUrl(params.get("image"));
		System.out.println(product.getTitle());
		productService.addProduct(product);
		MultipartFile productImage=product.getProductImage();
		
		String rootDirectory=request.getSession().getServletContext().getRealPath("/");
		Path path=Paths.get("/home/anshujain/eclipse-workspace/cdac-project/SentimentAnalysis/WebContent/resources/images/"+product.getTitle()+".png");
		if(productImage!=null && !productImage.isEmpty()) {
			try {
				productImage.transferTo(new File(path.toString()));
			}
			catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		ModelAndView model=new ModelAndView();
		model.setViewName("AddProduct");
		return model;
	}
	
}
