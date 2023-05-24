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
   int amount= Integer.parseInt(request.getParameter("deposit"));
   AtmDao dao= new AtmDao();
   int accnum=(int)session.getAttribute("accnum");
   Customer c= dao.getCustomer(accnum);
   
   if(amount %100 !=0){
	   out.println("Enter the amount in multiples of 100 only");
	   request.getRequestDispatcher("deposit.jsp").include(request, response);
   }
   else{
	   amount= c.getAmount()+amount;
	   int row= dao.updateAmount(accnum,amount);
	   if(row>0){
		   c.setAmount(amount);
		   out.println("Succesfully Deposited");
		   request.getRequestDispatcher("deposit.jsp").include(request, response);
	   }
	   else{
		   out.println("Deposit Failed- Please try again");
		   request.getRequestDispatcher("deposit.jsp").include(request, response);
	   }
	   
   }
  
%>
<br>
<%@ include file="continue.jsp" %>

</body>
</html>