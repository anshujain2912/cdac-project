<%@page import="com.objects.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Products</title>
</head>
<body>
<%Product product1=(Product)session.getAttribute("Product"); %>
Title: <%=product1.getTitle() %>
Description: <%=product1.getDescription() %>
Creator Id: <%=product1.getCreatorId() %>
Image: <%=product1.getImageUrl() %>
</body>
</html>