<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.app.model.Book, com.app.dao.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Form</title>
<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>
<%
	String operation = request.getParameter("operation");
	String role = (String)session.getAttribute("role");
	System.out.println("bkFm: "+role);
	
	session.setAttribute("role", role);
  	
	int id = 0;
	Book bk = new Book();
	if(request.getParameter("id") != null){
		id = Integer.parseInt(request.getParameter("id"));
		bk = DBConnection.getBookById(id);
	}
	pageContext.setAttribute("id", id);
%>
<div class="container"><div>
<%
	if(operation.equals("add")){
%>
<h1>Add Book</h1>
<%
	}
	if(operation.equals("edit")){
%>
<h1>Edit Book</h1>
<%
	}
%>
<form action="saveBook.jsp" method="post" class="frm">
<table>
<%
	if(id != 0){
%>
<tr>
<td><input type="hidden" name="id" value="<%=bk.getBookId()%>"></td>
</tr>
<%
	}
%>
<tr>
<td>Enter book title:</td>
<td><input type="text" name="title" value="<%= id!=0 ? bk.getTitle() : ""%>"  required></td>
</tr>

<tr>
<td>Enter book author:</td>
<td><input type="text" name="author" value="<%= id!=0 ? bk.getAuthor() : ""%>"  required></td>
</tr>

<tr>
<td>Enter book Publisher:</td>
<td><input type="text" name="publisher"  value="<%= id!=0 ? bk.getPublisher() : ""%>" required></td>
</tr>

<tr>
<td>Enter book Category:</td>
<td><input type="text" name="category" value="<%= id!=0 ? bk.getCategory() : ""%>" required></td>
</tr>

<tr>
<td>Enter book quantity:</td>
<td><input type="number" name="quantity" value="<%= id!=0 ? bk.getQuantity() : ""%>" required></td>
</tr>

<tr>
<td>Enter book Status:</td>
<td>
<% 
	if(id!=0 && bk.getStatus().equals("available")){
%>
<input type="radio" name="status" value="available" CHECKED>Available
<%
	}else{
%>
<input type="radio" name="status" value="available">Available
<%
	}
if(id!=0 && bk.getStatus().equals("not available")){

%>
<input type="radio" name="status" value="not available" CHECKED>Not Available
<%
}else{
%>
<input type="radio" name="status" value="not available">Not Available
<%
}
%>
</td>
</tr>

<tr>
<td><input type="reset" value="RESET"></td>
<%
	if(id!=0){
%>
<td><input type="submit" name="update" value="UPDATE"></td>
<%
	}
	else{
%>
<td><input type="submit" name="add" value="ADD"></td>
<%
	}
%>
</tr>
</table>
</form>
</div></div>
</body>
</html>