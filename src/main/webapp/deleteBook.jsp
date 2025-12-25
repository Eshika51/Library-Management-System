<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.app.model.Book, com.app.dao.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Book</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));

    Book bk = DBConnection.getBookById(id);
    DBConnection.deleteBook(bk);
    
    request.getRequestDispatcher("bookView.jsp?role=admin").forward(request, response);
%>
</body>
</html>