package servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/create")
public class CreateServlet extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int accnum= Integer.parseInt(req.getParameter("accnum"));
		int pass= Integer.parseInt(req.getParameter("pass"));
		String name= req.getParameter("name");
		int balance= Integer.parseInt(req.getParameter("balance"));
		boolean exist=true;
		
		AtmDao dao= new AtmDao();
		try {
			if(dao.getCustomer(accnum) != null || pass>10000 || pass<1000) {
				exist=false;
				res.sendRedirect("error.jsp");
			}
		} catch (ClassNotFoundException | SQLException | IOException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(exist==true) {
			Customer c1= new Customer(accnum,pass,name,balance);
			try {
				int row= dao.saveCustomer(c1);
				if(row>0)
					res.sendRedirect("succesful.jsp");
				else {
					res.sendRedirect("error.jsp");
				}
					
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

}
