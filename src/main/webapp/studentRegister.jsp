<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Register</title>
<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>
<%
	String role = request.getParameter("role");
%>
<div class="container"><div>
<h1>Student Registration Form</h1>
<form action="saveStudent.jsp" method="post" class="frm">
<table>
<tr>
<td>Enter FirstName:</td>
<td><input type="text" name="fname"></td>
</tr>

<tr>
<td>Enter LastName:</td>
<td><input type="text" name="lname"></td>
</tr>

<tr>
<td>Enter Email:</td>
<td><input type="email" name="email"></td>
</tr>

<tr>
<td>Enter Password:</td>
<td><input type="password" name="password"></td>
</tr>

<tr>
<td>Select Gender:</td>
<td>
<input type="radio" name="gender" value="male">Male
<input type="radio" name="gender" value="female">Female
</td>
</tr>

<tr>
<td>Select DOB: </td>
<td><input type="date" name="dob"></td>
</tr>

<tr>
<td>Enter Address:</td>
<td><textarea name="address"></textarea></td>
</tr>

<tr>
<td><input type="text" hidden="hidden" name="role" value="<%=role%>"></td>
</tr>

<tr>
<td><input type="reset" value="RESET"></td>
<td><input type="submit" value="REGISTER"></td>
</table>
</form>
</div></div>
</body>
</html>