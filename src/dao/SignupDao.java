package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import servlets.DatabaseConnection;


public class SignupDao {
	
//	String url ="jdbc:mysql://localhost:3306/demo";
//	String user="root";
//	String password ="hello@123";
	String query ="insert into user(name,password,email, phone, dob ) values(?,?,?,?,?)";
	public boolean createUser(String email, String password ,String name, String dob, String phone) {
		
		try {
			Connection con  = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1,name);
			st.setString(2, password);
			st.setString(3, email);
			st.setString(4, phone);
			st.setString(5, dob);
			
			int row = st.executeUpdate() ;
			
			if(row>0) {
				return true;
			} 
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;

}
}
