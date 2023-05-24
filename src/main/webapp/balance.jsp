<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="servlets.Customer,servlets.AtmDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   int accnum= (int) session.getAttribute("accnum");
   AtmDao dao= new AtmDao();
   Customer c= dao.getCustomer(accnum);
   out.println("Your balance: "+c.getAmount());
%>
<%@ include file="continue.jsp" %>
</body>
</html>