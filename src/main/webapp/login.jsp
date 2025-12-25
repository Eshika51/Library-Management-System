<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="resources/css/style.css" rel="stylesheet">

</head>
<body>
<div class="container"><div>
<%
	String role = request.getParameter("role");
	System.out.println(role);
	
    if (role == null) {
        response.sendRedirect("index.html"); // or role selection page
        return;
    }
    
	pageContext.setAttribute("role", role);
	String actionUrl = "";
	if(role.equals("admin")){
		actionUrl = "checkLogin.jsp";
	}
	else if(role.equals("student")){
		actionUrl = "checkLogin.jsp";
	}
	
	if(role.equals("student")){
%>

<h1>Student Login</h1>

<%
	}
	if(role.equals("admin")){
%>
<h1>Admin Login</h1>
<%
	}
%>

<form action="<%=actionUrl%>" method="post" class="frm">
<table>
<tr>
<td>Enter UserName: </td>
<td><input type="text" name="username" required></td>
</tr>

<tr>
<td>Enter password: </td>
<td><input type="password" name="password" required></td>
</tr>

<tr>
<td><input type="hidden" name="role" value="${role}"></td>
</tr>

<tr>
<td colspan="2" style="text-align:center"><input type="submit" value="LOGIN"></td>
</tr>

<%
	if(role.equals("student")){
%>
<tr>
<td colspan="2" style="text-align:center"><a href="studentRegister.jsp?role=${role}"><input type="button" value="REGISTER"></a></td>
</tr>
<%
	}
%>

</table>
</form>
</div>
</div>
</body>
</html>