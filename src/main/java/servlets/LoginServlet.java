package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int accnum=Integer.parseInt(req.getParameter("accnum"));
		int pass= Integer.parseInt(req.getParameter("pass"));
		
		
        AtmDao dao= new AtmDao();
        try {
    		Customer c=dao.getCustomer(accnum);
    		 if(c!=null && c.getPass()==pass) {
    			HttpSession session=req.getSession();
    			session.setAttribute("name", c.getName());
    			session.setAttribute("accnum", accnum);
    			session.setAttribute("pass", c.getPass());
    			 
    			res.sendRedirect("welcome.jsp");
    		 }
    			
    	    else
    			res.sendRedirect("error.jsp");
    	} catch (ClassNotFoundException | SQLException e) {
    		e.printStackTrace();
    	}   
	}

}
