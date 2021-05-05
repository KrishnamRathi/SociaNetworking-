package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	
	
	LoginDao login = new LoginDao();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if(this.login.checkDetails(email, password)) {
			HttpSession session = request.getSession();
			String query ="select * from user where email= ? and password =?";
			try {
				Connection con  = DatabaseConnection.initializeDatabase();
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1, email);
				st.setString(2, password);
				ResultSet rs = st.executeQuery() ;
				if(rs.next()) {
					session.setAttribute("user_id", rs.getString("user_id"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			session.setAttribute("email", email);
			response.sendRedirect("home");
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

}
