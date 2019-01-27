<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

        <html>

        <head>


            <title>Add Product</title>

        </head>

        <body>

            <form action="addProductProcess" method="post" enctype="multipart/form-data" commandName="product">

                <table align="center">

                    <tr>

                        <td>

                           <Label> Title</Label>

                        </td>

                        <td>

                            <input type="text" name="title" />

                        </td>

                    </tr>

                    <tr>

                        <td>

                            <Label>Description</Label>

                        </td>

                        <td>

                            <textarea name="description" />

                        </td>

                    </tr>
                    
                    <tr>

                        <td>

                            <Label>Image</Label>

                        </td>

                        <td>

                            <input type="file" name="imageUrl"/>

                        </td>

                    </tr>
                    

                    <tr>

                        <td></td>

                        <td align="left">

                            <button id="submit" name="submit">Add</button>

                        </td>

                    </tr>

                </table>
</form>

            <table align="center">

                <tr>

                    <td style="font-style: italic; color: red;">${message}</td>

                </tr>

            </table>

        </body>

        </html>