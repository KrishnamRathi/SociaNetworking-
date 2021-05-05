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
import models.Post;
import models.User;

@WebServlet("/profile/*")
public class Profile extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	        try {
	        	Connection con  = DatabaseConnection.initializeDatabase();
    			Statement st = con.createStatement();
    			String query="select * from user where user_id="+request.getParameter("id");
    			ResultSet rs = st.executeQuery(query);
    			User user=new User();
    			while(rs.next()) {
    				String name = rs.getString("name");
    				String dob = rs.getString("dob");
    				String email = rs.getString("email");
    				String phone = rs.getString("phone");
    				user.setDob(dob);
    				user.setEmail(email);
    				user.setPhone(phone);
    				user.setName(name);
    			}
    			request.setAttribute("user", user);
	        	request.getRequestDispatcher("/profile.jsp").forward(request, response);
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
