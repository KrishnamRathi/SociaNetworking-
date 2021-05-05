<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/authentication.css">
</head>
<body>

<%
if( session.getAttribute("email") != null ){
	response.sendRedirect("home");
    } 
%>


<body>
    <div class="body">
      <div class="container">
        <form action="signup" method="post">
          <div class="form" >
            <h1>SIGN UP</h1>
            <div class="form-control">
              <label for="name">Name</label><br />
              <input type="text" name="name" class="form-input" />
            </div>
            <div class="form-control">
            	<label for="email">Email</label><br />
            		<input
              		type="email"
             		name="email"
              		class="form-input"
            		/>
            </div>
            <div class="form-control">
            	<label for="phone">Phone No.</label><br />
            		<input
              		type="number"
             		name="phone"
              		class="form-input"
            		/>
            </div>
            <div class="form-control">
            	<label for="dob">DOB</label><br />
            		<input
              		type="date"
             		name="dob"
              		class="form-input"
            		/>
            </div>
            <div class="form-control">
              <label for="password">Password</label><br />
              <input
                type="password"
                name="password"
                class="form-input"
              />
            </div>
            <div class="form-control">
              <label for="password">confirm Password</label><br />
              <input
                type="password"
                name="confirmPassword"
                class="form-input"
              />
            </div>
            <input type="submit" value="submit" class="btn" ></input>
          </div>
        </form>
      </div>
    </div>
  </body>

</body>
</html>