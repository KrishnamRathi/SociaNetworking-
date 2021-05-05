<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="./css/authentication.css">
</head>
<body>
<%
if( session.getAttribute("email") != null ){
	response.sendRedirect("home");
    } 
%>

    <div class="body">
      <div class="container">
        <form action="login" method="post">
          <div class="form" >
            <h1>Login Form</h1>
            <label for="email">Email:</label><br />
            <input type="text" name="email" id="email" class="form-input" /><br />
            <label for="password">password:</label><br />
            <input type="password" name="password" id="password" class="form-input" autocomplete="off" /><br />
            <button class="btn" type="submit">Login</button>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
