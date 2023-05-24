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
   int oldpin= Integer.parseInt(request.getParameter("oldpin"));
   int newpin= Integer.parseInt(request.getParameter("newpin"));
   int pin= (int)session.getAttribute("pass");
   int accnum= (int)session.getAttribute("accnum");
   AtmDao dao= new AtmDao();
   Customer c= dao.getCustomer(accnum);
   if(pin==oldpin){
	   if(oldpin!=newpin){
		   int row= dao.updatepin(accnum,newpin);
		   if(row>0){
			   c.setPass(newpin);
			   out.println("Pin has been changed successfully");
			   request.getRequestDispatcher("pinchange.jsp").include(request, response);
		   }
		   else{
			   out.println("Pin cannot be changed- Try again");
			   request.getRequestDispatcher("pinchange.jsp").include(request, response);
		   }
		   
	   }
	   else{
		   out.println("New pin should not match with the old pin- Try again");
		   request.getRequestDispatcher("pinchange.jsp").include(request, response);
	   }
   }
   else{
	   out.println("Enter the correct pin- Try again");
	   request.getRequestDispatcher("pinchange.jsp").include(request, response);
   }
   
%>
<%@ include file="continue.jsp" %>
</body>
</html>