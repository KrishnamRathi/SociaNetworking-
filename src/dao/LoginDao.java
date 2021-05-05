package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import servlets.DatabaseConnection;


public class LoginDao {
	
//	String url = "jdbc:mysql://localhost:3306/demo";
//	String user= "root";
//	String password ="hello@123";
	String query ="select * from user where email= ? and password =?";
	String query1 ="select * from user where email= ?";
	public boolean checkDetails(String email , String password) {
		
		try {
			Connection con  = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, password);
			ResultSet rs = st.executeQuery() ;
			
			if(rs.next()) {
				return true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
	public boolean alreadyExistUser(String email) {
		
		try {
			Connection con  = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con.prepareStatement(query1);
			st.setString(1, email);
			ResultSet rs = st.executeQuery() ;
			
			if(rs.next()) {
				return true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
	}

}
