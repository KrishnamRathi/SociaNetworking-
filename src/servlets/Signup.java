package servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import servlets.DatabaseConnection;


import dao.LoginDao;
import dao.SignupDao;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/signup")
public class Signup extends HttpServlet {
	LoginDao login = new LoginDao();
	SignupDao signup = new SignupDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter  out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("comfirmpassword");
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String phone = request.getParameter("phone");
		if(this.login.alreadyExistUser(email)) {
//			out.println("<html><head></head><body onload=\"alert('User Already Exists.. Please try login')\"></body></html>");
			response.sendRedirect("login.jsp");
		}else {
			if(this.signup.createUser(email, password, name, dob, phone)) {
				response.sendRedirect("login.jsp");
			} else {
				out.println("<html><head></head><body onload=\"alert('User is not able to sign up')\"></body></html>");
			}
		}
			
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/signup.jsp").forward(request, response);
	}

}
