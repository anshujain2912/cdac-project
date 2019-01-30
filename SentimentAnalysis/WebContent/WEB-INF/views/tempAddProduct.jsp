	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
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
		<title>Travel</title>

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
								Add New Product				
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
					
						<div class="col-lg-8 posts-list">
						
							<div class="comment-form" >
								<h4>Add Product</h4>
								<form action="addProductProcess" method="post" commandName="product" enctype="multipart/form-data">
									
									<div class="form-group">
										<input type="text" class="form-control" id="title" name="title" placeholder="Title" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subject'">
									</div>
									<div class="form-group">
										<textarea class="form-control mb-10" rows="5" cols="25" name="description" placeholder="Description" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
									</div>
									<label>Image</label>
									<input type="file" name="productImage"><br><br>
									
									<button type="submit" class="primary-btn text-uppercase">Add</button>	
								</form>
							</div>
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