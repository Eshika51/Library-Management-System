<%@page import="com.app.dao.DBConnection, com.app.model.Book, com.app.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Borrow and Return Book</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Book bk = DBConnection.getBookById(id);
	
	String username = (String)session.getAttribute("username");
	Student user = DBConnection.getUserByEmail(username);
	System.out.println("User: "+user);
	
	String role = (String)session.getAttribute("role");
	System.out.println("brbk: "+role);
	String operation = request.getParameter("operation");
	int num = 0;
	
	if(operation.equals("borrow")){
		if(bk.getStatus().equalsIgnoreCase("available") && bk.getQuantity()!=0){
			num = DBConnection.borrowBook(bk, user);
			
			if(num!=0){
				out.print("Book Borrowed!!");
				request.getRequestDispatcher("bookView.jsp?username="+username+"&role="+role).include(request, response);
			}
			else{
				out.print("Error!!!");
				request.getRequestDispatcher("bookView.jsp?username="+username+"&role="+role).include(request, response);
			}
		}
		else if(bk.getStatus().equalsIgnoreCase("not available")){
			out.print(bk.getTitle()+" is not available in the library , "+username+" can't borrow this book");
			request.getRequestDispatcher("bookView.jsp?username="+username+"&role="+role).include(request, response);
		}
	}
	else{
		num = DBConnection.returnBook(bk, user);
		
		if(num!=0){
			out.print("Book Returned!!");
			request.getRequestDispatcher("bookView.jsp?username="+username+"&role="+role).include(request, response);
		}
		else{
			out.print("Error!!!");
			request.getRequestDispatcher("bookView.jsp?username="+username+"&role="+role).include(request, response);
		}
	}
%>
</body>
</html>