package servlets;

import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import servlets.DatabaseConnection;
import models.User;

@WebServlet("/users")
public class Users extends HttpServlet {
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
  
            
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    		try {
    			Connection con  = DatabaseConnection.initializeDatabase();
    			
    			Statement st = con.createStatement();
    			String query="select * from user";
    			ResultSet rs = st.executeQuery(query);
    			List<User> usersList=new ArrayList<User>();
    			while(rs.next()) {
    				String name = rs.getString("name");
    				String email = rs.getString("email");
    				String dob = rs.getString("dob");
    				String phone = rs.getString("phone");
    				User u=new User();
    				u.setName(name);
    				u.setDob(dob);
    				u.setEmail(email);
    				u.setPhone(phone);
    				usersList.add(u);
    			}
    			request.setAttribute("users", usersList);
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    }
}