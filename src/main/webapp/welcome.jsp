<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome page</title>
</head>
<body>
   <center>
     <h1>Welcome ${name} <span>&#128075;</span> </h1><br>
     <h2>Choose one of the below options:</h2><br>
     <form action="withdraw.jsp">
         Click here to withdraw Amount:<br>
         <input type="submit" value="withdraw"><br>
     </form>
     <form action="balance.jsp">
         Click here to Check Balance Amount:<br>
         <input type="submit" value="balance"><br>
     </form>
     <form action="deposit.jsp">
         Click here to Deposit Amount:<br>
         <input type="submit" value="deposit"><br>
     </form>
     <form action="pinchange.jsp">
         Click here to Change Pin:<br>
         <input type="submit" value="change pin"><br>
     </form>
     <form action="exit.jsp">
         Click here to exit:<br>
         <input type="submit" value="exit"> 
     </form>
   </center>
</body>
</html>