<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

        <html>

        <head>

            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

            <title>Registration</title>

        </head>

        <body>

            <form:form id="regForm" modelAttribute="user" action="addUser" method="post">

                <table align="center">

                    <tr>

                        <td>

                            <form:label path="userName">Username</form:label>

                        </td>

                        <td>

                            <form:input path="userName" name="username" id="username" />

                        </td>

                    </tr>

                    <tr>

                        <td>

                            <form:label path="password">Password</form:label>

                        </td>

                        <td>

                            <form:password path="password" name="password" id="password" />

                        </td>

                    </tr>

                    <tr>

                        <td>

                            <form:label path="name">Name</form:label>

                        </td>

                        <td>

                            <form:input path="name" name="name" id="name" />

                        </td>

                    </tr>


                    <tr>

                        <td>

                            <form:label path="emailId">Email</form:label>

                        </td>

                        <td>

                            <form:input path="emailId" name="email" id="email" />

                        </td>

                    </tr>

                   
                    <tr>

                        <td>

                            <form:label path="phoneNo">Phone</form:label>

                        </td>

                        <td>

                            <form:input path="phoneNo" name="phone" id="phone" />

                        </td>

                    </tr>
                    
                    <tr>

                        <td>

                            <form:label path="gender">Gender</form:label>

                        </td>

                        <td>
           						 <form:radiobutton path="gender" value="Male" label="M" /> 
           						 <form:radiobutton path="gender" value="Female" label="F" />
        				</td>
                    </tr>
				                    
				  <tr>
		     			 <td>Nationality</td>
						      <td>
						          <form:select path="nationality">
						              <form:option value="Indian"/>
						              <form:option value="Other"/>
						              
						          </form:select>
						      </td>
				  </tr>
                    

                    <tr>

                        <td></td>

                        <td>

                            <form:button id="register" name="register">Register</form:button>

                        </td>

                    </tr>

                    <tr></tr>

                    <tr>

                        <td></td>

                        <td><a href="login">Login</a>

                        </td>

                    </tr>

                </table>

            </form:form>

        </body>

        </html>