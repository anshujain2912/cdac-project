package com.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.objects.User;
import com.services.IUserService;

@Controller
public class UserController {
		
		@Autowired
		private IUserService userService;
		
		@RequestMapping(value = "/", method = RequestMethod.GET)
		   public ModelAndView user() {
		      return new ModelAndView("registration", "user", new User());
		   }
		
		@RequestMapping(value="/addUser", method=RequestMethod.POST)
		public ModelAndView addUser(@ModelAttribute("user") User user, ModelAndView model) {
			try {
			userService.addUser(user);
			//model.addObject("msg","Registration Successfull");
			model.setViewName("login");
			return model;
			}
			catch(Exception e) {
				model.addObject("msg","Error");
				model.setViewName("registration");
				return model;
			}
		}
		
		@RequestMapping(value = "/login", method = RequestMethod.GET)
	   public ModelAndView login() {
	      return new ModelAndView("login", "user", new User());
	   }
		
		@RequestMapping(value="/loginProcess")
		public ModelAndView validateUser(@ModelAttribute("user") User user,ModelAndView model) {
			User user1=userService.validateUser(user);
			if(user1!=null) {
				model.setViewName("home");
				return model;
			}
			else {
				model.addObject("msg", "login credentials are incorrect");
				model.setViewName("login");
				return model;
			}
		}
}
