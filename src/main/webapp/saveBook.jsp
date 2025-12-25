<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.app.dao.DBConnection, com.app.model.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Save Book</title>
</head>
<body>
<jsp:useBean id="b" class="com.app.model.Book"/>
<jsp:setProperty property="*" name="b"/>

<%
     String role = (String)session.getAttribute("role");
	
	if(request.getParameter("id") == null){
		int i = DBConnection.saveBook(b);
		
		if(i==1){
			out.print("Book Stored SuccessFully!!");
			request.getRequestDispatcher("bookView.jsp?role="+role).include(request, response);
		}
		else{
			out.print("Error!!");
			request.getRequestDispatcher("bookForm.jsp?operation=add").include(request, response);
		}
	}else{
	Integer id = Integer.parseInt(request.getParameter("id"));

	if(id!=0){
		b.setBookId(id);
  		int num = DBConnection.updateBook(b);
		
		if(num==0){
			out.print("Error!!");
			request.getRequestDispatcher("bookView.jsp?role="+role).include(request, response);
		}
		else{
			out.print("Book Updated Successfully!!");
			request.getRequestDispatcher("bookView.jsp?role="+role).include(request, response);

		}
	}
	}
%>
</body>
</html>