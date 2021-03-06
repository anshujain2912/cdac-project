package com.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.objects.ChangePasswordRequest;
import com.objects.User;
import com.services.IUserService;

@Controller
@SessionAttributes("user")
public class UserController {
		
		@Autowired
		private IUserService userService;
		
		@RequestMapping(value = "/", method = RequestMethod.GET)
		   public ModelAndView user() {
		      return new ModelAndView("tempReg", "user", new User());
		   }
		
		@RequestMapping(value="/addUser", method=RequestMethod.POST)
		public ModelAndView addUser(@ModelAttribute("user") User user, ModelAndView model) {
			try {
			userService.addUser(user);
			//model.addObject("msg","Registration Successfull");
			model.setViewName("tempReg");
			return model;
			}
			catch(Exception e) {
				model.addObject("msg","Error");
				model.setViewName("tempReg");
				return model;
			}
		}
		
		@RequestMapping(value = "/login", method = RequestMethod.GET)
	   public ModelAndView login() {
	      return new ModelAndView("tempReg", "user", new User());
	   }
		
		@RequestMapping(value="/loginProcess")
		public ModelAndView validateUser(@ModelAttribute("user") User user,ModelAndView model) {
			User user1=userService.validateUser(user);
			if(user1!=null) {
				model.addObject("user", user1);
				model.setViewName("redirect:/viewProducts");
				return model;
			}
			else {
				model.addObject("msg", "login credentials are incorrect");
				model.setViewName("tempReg");
				return model;
			}
		}
		
		@RequestMapping(value = "/password", method = RequestMethod.GET)
		 public ModelAndView password(@ModelAttribute("user") User user) {
		      return new ModelAndView("changePassword", "user",user);
		   }
			
			@RequestMapping(value="/changePassword")
			public ModelAndView changePassword(@ModelAttribute("user") User user,@ModelAttribute("updatePassword") ChangePasswordRequest request, ModelAndView model) {
				request.setUserId(user.getId());
				String msg=userService.changePassword(user,request);
				model.addObject("msg", msg);
				model.addObject("user", user);

				model.setViewName("changePassword");
				return model;
				}
}
