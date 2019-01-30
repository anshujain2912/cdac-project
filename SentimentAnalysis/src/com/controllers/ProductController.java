package com.controllers;

import java.nio.file.Paths;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

//import org.springframework.context.ResourceLoaderAware;
//import org.springframework.core.io.Resource;
//import org.springframework.core.io.ResourceLoader;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
//import javax.validation.Valid;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.objects.Product;
import com.objects.User;
import com.services.IProductService;

@Controller
@SessionAttributes("user")
public class ProductController{
	
	@Autowired
	private IProductService productService;
	
	private Path path;
	
	//private ResourceLoader resourceLoader;
	
//	 public void setResourceLoader(ResourceLoader resourceLoader) {
//	        this.resourceLoader = resourceLoader;
//	    }
	
	@RequestMapping(value="/viewProducts")
	public ModelAndView getAllProducts(@RequestParam(required = false) String query,ModelAndView model) {
		List<Product> listProduct;
		if(StringUtils.isEmpty(query)) {
			listProduct=this.productService.getAllProducts();
		}else {
			listProduct=this.productService.searchProduct(query);

		}
		model.addObject("products", listProduct);
		model.setViewName("tempHome1");
		return model;
	}
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
    public ModelAndView product(ModelAndView model) {
		model.addObject("product", new Product());
		model.setViewName("tempAddProduct");
		return model;
    }
	
	@RequestMapping(value="/addProductProcess" ,method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product,@ModelAttribute("user") User user, ModelAndView model,HttpServletRequest request) {
//		System.out.println(params.get("title"));
//		product.setTitle(params.get("title"));
//		product.setDescription(params.get("decription"));
//		product.setImageUrl(params.get("image"));
		MultipartFile productImage=product.getProductImage();
		
		
//		if (!productImage.isEmpty()) {
//	        try {
//	            productImage.transferTo(resourceLoader.getResource("resources/images/"+product.getTitle()+".png").getFile());
//
//	        } catch (Exception e) {
//	            throw new RuntimeException("Product Image saving failed", e);
//	        }
//	    }
		//User user=(User)model.getModel().get("user");
		product.setCreatorId(user.getId());
        String filename=productImage.getOriginalFilename();  
		
		
		path=Paths.get("/home/anshujain/Pictures/Products/"+filename);
		if(productImage!=null && !productImage.isEmpty()) {
			try {
				productImage.transferTo(new File(path.toString()));
				product.setImageUrl("/SentimentAnalysis/files/"+filename);
			}
			catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(product.getImageUrl());
		
		productService.addProduct(product);
		
		//ModelAndView model=new ModelAndView();
		model.setViewName("redirect:/viewProducts");
		return model;
	}
	@RequestMapping(value="/searchProduct/{query}", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity searchProduct(@PathVariable String query) {
		System.out.println(query);
		List<Product> products=productService.searchProduct(query);
		//model.addObject("products", products);
		//model.setViewName("tempHome1");
		return ResponseEntity.ok(products);
	}
	
}
