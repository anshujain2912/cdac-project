		<%@page import="com.objects.Product" %>
<%@page import="com.objects.Comment" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Home</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/jquery-ui.css">				
			<link rel="stylesheet" href="css/nice-select.css">							
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="css/owl.carousel.css">				
			<link rel="stylesheet" href="css/main.css">
			
			
			<script type="text/javascript">
				function fun(productId){
			        $( "#"+productId).toggle();
			        $("#commentButton"+productId).text(function(i, text){
			            return text === "View Comments" ? "Hide Comments" : "View Comments";
			        })
					 //document.getElementById(productId).style.display="block";
					$.ajax({
						url: "/SentimentAnalysis/viewComments/"+productId,
					  	type: "GET",
					  	
					  	beforeSend: function(xhr) {
					  		xhr.setRequestHeader("Accept", "application/json");
					  		xhr.setRequestHeader("Content-Type", "application/json");
					  		console.log("before");
					  	},
					  	
					  	success: function(commentList) {
					  		console.log("success "+commentList.toString());
				  			var positiveComments ="";
				  			var negativeComments ="";
				  			var neutralComments ="";
				  			
				  			var x0 = "<div class=\"comments-area\"> <div class=\"comment-list\">";
				  			
				  			var x1 = "<div class=\"comment-list left-padding\"> "+
				  			"<div class=\"single-comment justify-content-between d-flex\">"+
                            "<div class=\"user justify-content-between d-flex\">"+
                                "<div class=\"thumb\">"+
                                    "<img src=\"resources/images/av1.jpg\" alt=\"\"></div>"+
                                "<div class=\"desc\">"+
                                    "<h5>";
                                    
                                    
                                    
                                var x2="Elsie Cunningham";
                                    
                               var x3="</h5><p class=\"comment\">";
                               
                               var x4="Never say goodbye till the end comes!";
                                var x5=    "</p></div></div></div></div>";
                 
				  			var x6="</div></div>";
				  			
				  			
				  			
				  			
				
				  			for (var i=0; i<commentList.length; i++) {
				  				x2=commentList[i].userName;
			  					 x4=commentList[i].commentText;
				  				 if(commentList[i].sentiment=="positive"){
				  					 
				  					positiveComments+=x1+x2+x3+x4+x5;
				  					//positiveComments += commentList[i].userName+": "+ commentList[i].commentText + " <br> ";
				  				 }
				  				 else if(commentList[i].sentiment=="negative"){
				  					negativeComments+=x1+x2+x3+x4+x5;

				  					//negativeComments += commentList[i].userName+": "+ commentList[i].commentText + " <br> ";
				  				 }
				  				 else{
				  					neutralComments+=x1+x2+x3+x4+x5;

				  					//neutralComments += commentList[i].userName+": "+ commentList[i].commentText + " <br> ";
				  				 }
				  			}
					  		
				  			positiveComments=x0+positiveComments+x6;
				  			negativeComments=x0+negativeComments+x6;
				  			neutralComments=x0+neutralComments+x6;

							document.getElementById("tabpositive"+productId).innerHTML =positiveComments;
							document.getElementById("tabnegative"+productId).innerHTML =negativeComments;
							document.getElementById("tabneutral"+productId).innerHTML =neutralComments;
					  	}
					});
				}
				
				function addComment(productId){
					$("#commentButton"+productId).trigger('click');  
					var comment=document.getElementById("tinshu"+productId).value;
					$("tinshu"+productId).toggle();
					console.log(comment);
						var data = {}
						data["commentText"] = comment;
						data["productId"] = productId;
				
					$.ajax({
						url: "/SentimentAnalysis/addComment/",
					  	type: "POST",
				        data: JSON.stringify(data),
				        dataType: "json",
					  	beforeSend: function(xhr) {
					  		xhr.setRequestHeader("Accept", "application/json");
					  		xhr.setRequestHeader("Content-Type", "application/json");
					  		console.log("before add comment");
					  	},
					  	
					  	success: function(commentList) {
					  		console.log("success "+commentList.toString());
					  		var positiveComments ="";
				  			var negativeComments ="";
				  			var neutralComments ="";
				  			
				  			
							var x0 = "<div class=\"comments-area\"> <div class=\"comment-list\">";
				  			
				  			var x1 = "<div class=\"comment-list left-padding\"> "+
				  			"<div class=\"single-comment justify-content-between d-flex\">"+
                            "<div class=\"user justify-content-between d-flex\">"+
                                "<div class=\"thumb\">"+
                                    "<img src=\"resources/images/av1.jpg\" alt=\"\"></div>"+
                                "<div class=\"desc\">"+
                                    "<h5>";
                                    
                                    
                                    
                                var x2="Elsie Cunningham";
                                    
                               var x3="</h5><p class=\"comment\">";
                               
                               var x4="Never say goodbye till the end comes!";
                                var x5=    "</p></div></div></div></div>";
                 
				  			var x6="</div></div>";
				
				  			for (var i=0; i<commentList.length; i++) {
				  				
				  				x2=commentList[i].userName;
			  					 x4=commentList[i].commentText;
				  				 if(commentList[i].sentiment=="positive"){
				  					 
				  					positiveComments+=x1+x2+x3+x4+x5;
				  					//positiveComments += commentList[i].userName+": "+ commentList[i].commentText + " <br> ";
				  				 }
				  				 else if(commentList[i].sentiment=="negative"){
				  					negativeComments+=x1+x2+x3+x4+x5;

				  					//negativeComments += commentList[i].userName+": "+ commentList[i].commentText + " <br> ";
				  				 }
				  				 else{
				  					neutralComments+=x1+x2+x3+x4+x5;

				  					//neutralComments += commentList[i].userName+": "+ commentList[i].commentText + " <br> ";
				  				 }
				  				 
				  				//respContent += commentList[i].userName+": "+ commentList[i].commentText + " <br> ";
				  			}
					  		
				  			positiveComments=x0+positiveComments+x6;
				  			negativeComments=x0+negativeComments+x6;
				  			neutralComments=x0+neutralComments+x6;

							document.getElementById("tabpositive"+productId).innerHTML =positiveComments;
							document.getElementById("tabnegative"+productId).innerHTML =negativeComments;
							document.getElementById("tabneutral"+productId).innerHTML =neutralComments;
					  		
							//document.getElementById(productId).innerHTML =respContent;
					  	}
				});
				}
					
				function searchAbc(){
					//$("#commentButton"+productId).trigger('click');  
					var productTitle=document.getElementById("searchproduct").value;
					//$("tinshu"+productId).toggle();
					console.log(productTitle);
					
						//data["productId"] = productId;
				
					$.ajax({
						url: "/SentimentAnalysis/searchProduct/"+productTitle,
					  	type: "GET",
					  	beforeSend: function(xhr) {
					  		xhr.setRequestHeader("Accept", "application/json");
					  		xhr.setRequestHeader("Content-Type", "application/json");
					  		console.log("before search product");
					  	},
					  	
					  	success: function(productList) {
					  		console.log("success "+productList.toString());
					  		//document.ElementById("showPosts").innerHTML=productList;
					  	}
					});
				}
				</script>
		</head>
		<body>	
			<header id="header">
				
				<div class="container main-menu">
					<div class="row align-items-center justify-content-between d-flex">
				      <div id="logo" class="form-group form-inline">
				       <img src="img/logo.png" placeholder="Smart Reviews" alt="Smart Reviews" title="Smart Reviews" /> <h4 class="text-white">Smart Reviews</h4>
				      </div>
				      <nav id="nav-menu-container">
				        <ul class="nav-menu">
				          <li><a href="viewProducts">Home</a></li>
				          <li><a href="addProduct">Add Product</a></li>
				          <li><a href="password">Change Password</a></li>
				          <li><a href="/SentimentAnalysis">Logout</a></li>
				         
				        					          					          		          
				         
				        </ul>
				      </nav><!-- #nav-menu-container -->					      		  
					</div>
				</div>
			</header><!-- #header -->
		  
			<!-- start banner Area -->
			<section class="relative about-banner">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								Product Reviews				
							</h1>	
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->					  
			
			<!-- Start post-content Area -->
			<section class="post-content-area single-post-area">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 posts-list" id="showPosts">
							<c:forEach var="product" items="${products}">
							<div class="single-post row">
								<div class="col-lg-3  col-md-3 meta-details">
									
									<div class="user-details row">
										<p class="user-name col-lg-12 col-md-12 col-6">${product.creatorName}<span class="lnr lnr-user"></span></p>
										<p class="date col-lg-12 col-md-12 col-6">12 Dec, 2017 <span class="lnr lnr-calendar-full"></span></p>
									
									</div>
								</div>
								<div class="col-lg-9 col-md-9 ">
									<div class="feature-img">
										<img class="img-fluid" src="${product.imageUrl}" alt="">
									</div>
									<a class="posts-title" href="blog-single.html"><h3>${product.title}</h3></a>
									<p class="excert">
										${product.description}
									</p>
									<div class="form-group form-inline">
										<textarea class="form-control mb-10" rows="1" name="message" placeholder="Add Comment" id="tinshu${product.id}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>&nbsp;&nbsp;&nbsp;
										<button type="submit" "class="primary-btn text-uppercase" onclick="addComment(${product.id})" id="post">Post Comment</button>
									</div>
									<button class="primary-btn text-uppercase" id="commentButton${product.id}" onclick="fun(${product.id})">View Comments</button>

									<div class="allComments" id="${product.id}"  style="display:none;">
									<ul class="nav nav-tabs" id="myTab" role="tablist">
									  <li class="nav-item">
									    <a class="nav-link active" id="positive${product.id}" data-toggle="tab" role="tab" href="#tabpositive${product.id}" aria-controls="tabpositive${product.id}" aria-selected="true">Positive</a>
									  </li>
									  <li class="nav-item">
									    <a class="nav-link" id="negative${product.id}" data-toggle="tab" role="tab" href="#tabnegative${product.id}" aria-controls="tabnegative${product.id}" aria-selected="false">Negative</a>
									  </li>
									  <li class="nav-item">
									    <a class="nav-link" id="neutral${product.id}" data-toggle="tab" role="tab" href="#tabneutral${product.id}" aria-controls="tabneutral${product.id}" aria-selected="false">Neutral</a>
									  </li>
									</ul>
									<div class="tab-content" id="myTabContent">
							 		 <div class="tab-pane fade show active" id="tabpositive${product.id}" role="tabpanel" aria-labelledby="positive${product.id}">
							 		 </div>
							 		  <div class="tab-pane fade" id="tabnegative${product.id}" role="tabpanel" aria-labelledby="negative${product.id}">
							 		 </div>
							 		  <div class="tab-pane fade" id="tabneutral${product.id}" role="tabpanel" aria-labelledby="neutral${product.id}">
							 		 </div>
							 		 </div>
									</div>
									
								</div>
							</div>
							</c:forEach>
							
							
						<!-- 	<div class="comment-form">
								<h4>Leave a Comment</h4>
								<form>
									<div class="form-group form-inline">
									  <div class="form-group col-lg-6 col-md-12 name">
									    <input type="text" class="form-control" id="name" placeholder="Enter Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Name'">
									  </div>
									  <div class="form-group col-lg-6 col-md-12 email">
									    <input type="email" class="form-control" id="email" placeholder="Enter email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'">
									  </div>										
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="subject" placeholder="Subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subject'">
									</div>
									<div class="form-group">
										<textarea class="form-control mb-10" rows="5" name="message" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
									</div>
									<a href="#" class="primary-btn text-uppercase">Post Comment</a>	
								</form>
							</div> -->
						</div>
						<div class="col-lg-4 sidebar-widgets">
							<div class="widget-wrap">
								<div class="single-sidebar-widget search-widget">
									<form class="search-form" action = "viewProducts">
			                            <input placeholder="Search Product" name="query" id="searchproduct" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'" >
			                            <button type="submit"><i class="fa fa-search"></i></button>
			                        </form>
								</div>
								<div class="single-sidebar-widget user-info-widget">
									<img src="img/blog/user-info.png" alt="">
									<h4>${user.name}</h4>
									<p>
										${user.emailId}
									</p>
									<p>
										${user.phoneNo}
									</p>
									
								</div>
								
								
								
								
														
							</div>
						</div>
					</div>
				</div>	
			</section>
			<!-- End post-content Area -->
			
			<!-- start footer Area -->		
			<footer class="footer-area section-gap">
				<div class="container">

					<div class="row">
						<div class="col-lg-3  col-md-6 col-sm-6">
							<div class="single-footer-widget">
								<h6>About Site</h6>
								<p>
									In the past decade, new forms of communication, such as micro blogging and text messaging have emerged and become ubiquitous. While there is no limit to the range of information conveyed and texts, often these short messages are used to share opinions and sentiments that people have about what is going on in the world around them.								</p>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="single-footer-widget">
								<h6>Navigation Links</h6>
								<div class="row">
									<div class="col">
										<ul>
											 <li><a href="viewProducts">Home</a></li>
									          <li><a href="addProduct">Add Product</a></li>
									          <li><a href="password">Change Password</a></li>
									          <li><a href="/SentimentAnalysis">Logout</a></li>
										</ul>
									</div>
																			
								</div>							
							</div>
						</div>							
						
						<div class="col-lg-3  col-md-6 col-sm-6">
							<div class="single-footer-widget mail-chimp">
								<h6 class="mb-20">InstaFeed</h6>
								<ul class="instafeed d-flex flex-wrap">
									<li><img src="img/i1.jpg" alt=""></li>
									<li><img src="img/i2.jpg" alt=""></li>
									<li><img src="img/i3.jpg" alt=""></li>
									<li><img src="img/i4.jpg" alt=""></li>
									<li><img src="img/i5.jpg" alt=""></li>
									<li><img src="img/i6.jpg" alt=""></li>
									<li><img src="img/i7.jpg" alt=""></li>
									<li><img src="img/i8.jpg" alt=""></li>
								</ul>
							</div>
						</div>						
					</div>

					<div class="row footer-bottom d-flex justify-content-between align-items-center">
						<p class="col-lg-8 col-sm-12 footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
						
					</div>
				</div>
			</footer>
			<!-- End footer Area -->	

			<script src="js/vendor/jquery-2.2.4.min.js"></script>
			<script src="js/popper.min.js"></script>
			<script src="js/vendor/bootstrap.min.js"></script>			
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>		
 			<script src="js/jquery-ui.js"></script>					
  			<script src="js/easing.min.js"></script>			
			<script src="js/hoverIntent.js"></script>
			<script src="js/superfish.min.js"></script>	
			<script src="js/jquery.ajaxchimp.min.js"></script>
			<script src="js/jquery.magnific-popup.min.js"></script>						
			<script src="js/jquery.nice-select.min.js"></script>					
			<script src="js/owl.carousel.min.js"></script>							
			<script src="js/mail-script.js"></script>	
			<script src="js/main.js"></script>	
		</body>
	</html>