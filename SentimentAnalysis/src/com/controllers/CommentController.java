package com.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.objects.Comment;
import com.objects.User;
import com.services.ICommentService;

@Controller
@SessionAttributes("user")
public class CommentController {
	
	@Autowired
	private ICommentService commentService;
	

	@RequestMapping(value="/viewComments/{productId}", method=RequestMethod.GET, 
			consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity getAllComments(@PathVariable int productId) {
		//System.out.println("andar aaya");
		List<Comment> comments=commentService.getAllComments(productId);
//		Comment comment1=new Comment();
//		Comment comment2=new Comment();
//		comment1.setCommentText("1st Comment");
//		comment2.setCommentText("2nd comment");
//		comments.add(comment1);
//		comments.add(comment2);
		
		return ResponseEntity.ok(comments);
	}
	
	@RequestMapping(value="/addComment", method=RequestMethod.POST, 
			consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity addComment(@RequestBody Comment comment,@ModelAttribute("user") User user) {
		comment.setUserId(user.getId());
		commentService.addComment(comment);
		List<Comment> comments=commentService.getAllComments(comment.getProductId());
		return ResponseEntity.ok(comments);

	}
}
