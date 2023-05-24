package servlets;

//1. import the package
import java.sql.*;
public class AtmDao {

	public Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String url="jdbc:mysql://localhost:3306/atm";
		String username="root";
		String password="password";
		
		//2.Load and register the driver
		Class.forName("com.mysql.jdbc.Driver");
		
		//3. Establish the connection
		return DriverManager.getConnection(url, username, password);
	}
	
	public Customer getCustomer(int accnum) throws ClassNotFoundException, SQLException {
		
		Connection con= getConnection();
		
		//4.Create statements
		Statement st= con.createStatement();
		
		//5.Execute the query
		ResultSet rs= st.executeQuery("Select * from Customer where accnum="+accnum);
		
		//6. Processing the result
		while(rs.next()) {
			return new Customer(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4));
		}
		return null;
	}
	
	public int saveCustomer(Customer c) throws ClassNotFoundException, SQLException {
		Connection con= getConnection();
		
		//4. Create Statement
		PreparedStatement pst= con.prepareStatement("insert into customer values(?,?,?,?)");
		pst.setInt(1, c.getAccnum());
		pst.setInt(2, c.getPass());
		pst.setString(3, c.getName());
		pst.setInt(4, c.getAmount());
		
		//5.Execute query
		int row= pst.executeUpdate();
		
		//6.Processing the results
	    return row;
	}
	
	public int updateAmount(int accnum, int amount) throws ClassNotFoundException, SQLException {
		Connection con=getConnection();
		
		//4.Create Statement
		PreparedStatement pst= con.prepareStatement("Update  customer set amount=? where accnum=?");
		pst.setInt(1, amount);
		pst.setInt(2, accnum);
		//5. Execute query
		int row= pst.executeUpdate();
		
		//6. Process the results
		return row;
	}
	
	public int updatepin(int accnum, int pin) throws ClassNotFoundException, SQLException {
		Connection con= getConnection();
		
		//4. Create Statements
		PreparedStatement pst= con.prepareStatement("Update customer set pin=? where accnum=?");
		pst.setInt(1, pin);
		pst.setInt(2, accnum);
		
		//5. Execute query
		int row= pst.executeUpdate();
		
		//6. Process the results
		return row;
	}
}
