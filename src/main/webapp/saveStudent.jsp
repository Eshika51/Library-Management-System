<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.app.dao.DBConnection,java.sql.*,java.time.LocalDateTime"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Registration</title>
</head>
<body>
<jsp:useBean id="s" class="com.app.model.Student"></jsp:useBean>
<jsp:setProperty property="fname" name="s"/>
<jsp:setProperty property="lname" name="s"/>
<jsp:setProperty property="email" name="s"/>
<jsp:setProperty property="password" name="s"/>
<jsp:setProperty property="gender" name="s"/>
<jsp:setProperty property="address" name="s"/>

<%
s.setDob(Date.valueOf(request.getParameter("dob")));
    String role = request.getParameter("role");
    s.setRole(role);
    s.setJoinedDate(Timestamp.valueOf(LocalDateTime.now()));

    int i =  DBConnection.saveStudent(s);

    System.out.println("RegRole: "+role);

	if(i == 1){
		out.print("Register Successfully!!!");
		request.getRequestDispatcher("login.jsp?role="+role).include(request, response);
	}
	else{
		out.print("Registration is not done, Try after sometime...");
		request.getRequestDispatcher("login.jsp?role="+role).include(request, response);
	}
%>
</body>
</html>