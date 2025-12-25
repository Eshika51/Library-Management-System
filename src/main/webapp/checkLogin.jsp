 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.app.model.Student, com.app.dao.DBConnection"%>
<%
    String role = request.getParameter("role");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Student user = DBConnection.getUserByEmail(username);

    if (user != null && password.equals(user.getPassword())) {

        //  CREATE SESSION (ONLY HERE)
        session.setAttribute("username", username);
        session.setAttribute("role", role);

        //  REDIRECT
        response.sendRedirect("bookView.jsp");
       
    } else {
        //  INVALID LOGIN
        response.sendRedirect("login.jsp?role=" + role);
    }
%>
