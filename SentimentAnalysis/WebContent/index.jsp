<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="registration.jsp">Add User</a>

	<a href="viewProducts">View Products</a>
	
	<form action="addProduct" method="post" enctype="multipart/form-data">
	<table>
	<tr><td>Title: </td><td><input type="text" placeholder="Enter Product Title" name="title" required></td></tr>
	<tr><td>Description:</td><td> <textarea name="description" id="description"></textarea></td></tr>
	<tr><td>Image:</td><td><input type="file" name="image" size="100"></td></tr><br>
	</table>
	<input type="submit" value="Add">
	</form>
	
</body>
</html>