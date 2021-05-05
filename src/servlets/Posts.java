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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import servlets.DatabaseConnection;
import models.Post;
import models.User;


@WebServlet("/home")

public class Posts extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	        try {
	        	Connection con = DatabaseConnection.initializeDatabase();
    			String query="insert into post(author, content, created_at) values (?, ?, now())";
    			PreparedStatement st = con.prepareStatement(query);
    			HttpSession session = request.getSession();
    			st.setString(1, (String)session.getAttribute("user_id"));
    			st.setString(2, request.getParameter("content"));
    			int rs = st.executeUpdate();
    			if(rs>0) {
    				response.sendRedirect("home");
    			}
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
    			String query="select * from post";
    			ResultSet rs = st.executeQuery(query);
    			List<Post> posts=new ArrayList<Post>();
    			while(rs.next()) {
    				String post_id = rs.getString("post_id");
    				String author = rs.getString("author");
    				String content = rs.getString("content");
    				String created_at = rs.getString("created_at");
    				Post p=new Post();
    				p.setPost_id(post_id);
    				p.setAuthor(author);
    				p.setContent(content);
    				p.setCreated_at(created_at);
    				posts.add(p);
    			}
    			request.setAttribute("posts", posts);
	        	request.getRequestDispatcher("/home.jsp").forward(request, response);
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
