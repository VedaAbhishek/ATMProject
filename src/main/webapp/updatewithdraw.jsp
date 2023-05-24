<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="servlets.AtmDao,servlets.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
   int amount= Integer.parseInt(request.getParameter("withdraw"));
   AtmDao dao= new AtmDao();
   int accnum=(int)session.getAttribute("accnum");
   Customer c= dao.getCustomer(accnum);
   
   if(amount %100 !=0){
	   out.println("Enter the amount in multiples of 100 only");
	   request.getRequestDispatcher("withdraw.jsp").include(request, response);
   }
   else if(amount>c.getAmount()){
	   out.println("Insufficent Balance");
	   request.getRequestDispatcher("withdraw.jsp").include(request, response);
   }
   else{
	   amount= c.getAmount()-amount;
	   int row= dao.updateAmount(accnum,amount);
	   if(row>0){
		   c.setAmount(amount);
		   out.println("Succesfully Withdrawn- Please collect your cash");
		   request.getRequestDispatcher("withdraw.jsp").include(request, response);
	   }
	   else{
		   out.println("Withdrawn Failed- Please try again");
		   request.getRequestDispatcher("withdraw.jsp").include(request, response);
	   }
	   
   }
  
%>
<br>
<%@ include file="continue.jsp" %>

</body>
</html>