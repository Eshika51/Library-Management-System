<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.app.dao.DBConnection, com.app.model.Book, java.util.*"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    //  Prevent browser cache
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    //  Session validation
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Read from session ONLY
    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username");

    // Load data
    List<Book> list = DBConnection.getAllBooks();
    pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books Management</title>
<link href="resources/css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
      rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<header style="text-align:right; padding:10px; padding-right:40px;">
<a href="logout.jsp"><input type="button" value="LOGOUT" class="btn btn-larger btn-danger"></a>
</header>
<div class="container"><div>
 <h1>Book Details</h1>
 <%
 	if(role.equals("admin")){
 %>
 <a href="bookForm.jsp?operation=add"><input type="button" value="ADD"></a>
 <%
 	}
 %>
 <table border="" class="table table-success table-striped table-hover table-bordered border-secondary">
<tr>
<th>BookID</th>
<th>Title</th>
<th>Author</th>
<th>Publisher</th>
<th>Category</th>
<th>Quantity</th>
<th>Status</th>
 <%
 	if(role.equals("admin")){
 %>
<th>Edit</th>
<th>Delete</th>
<%
 	}
 if(role.equals("student")){
%>
<th>Borrow</th>
<th>Return</th>
<%
 }
%>
</tr>

<c:forEach var="temp" items="${list}">
<tr>
	<td>${temp.bookId}</td>
	<td>${temp.title}</td>
	<td>${temp.author}</td>
	<td>${temp.publisher}</td>
	<td>${temp.category}</td>
	<td>${temp.quantity}</td>
	<td>${temp.status}</td>

 <%
 	if(role.equals("admin")){
 %>
<td><a href="bookForm.jsp?operation=edit&id=${temp.bookId}">Edit</a></td>
<td><a href="deleteBook.jsp?id=${temp.bookId}">Delete</a></td>
<%
 	}
 	if(role.equals("student")){
%>
<td><a href="borrowReturnBook.jsp?operation=borrow&id=${temp.bookId}">Borrow</a></td>
<td><a href="borrowReturnBook.jsp?operation=return&id=${temp.bookId}">Return</a></td>
<%
 	}
%>
</tr>
</c:forEach>
 </table>
 </div></div>
</body>
</html>