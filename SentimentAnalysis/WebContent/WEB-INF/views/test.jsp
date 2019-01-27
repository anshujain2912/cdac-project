<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addProductProcess" method="post" commandName="product" enctype="multipart/form-data">
<Label>Title</Label>
<input type="text" name="title"><br>
<Label>Description</Label>
<input type="text" name="description"><br>
<Label>Image</Label>
<input type="file" name="productImage"><br>
<button type="submit">submit</button>
</form>
</body>
</html>