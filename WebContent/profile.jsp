<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="servlets.Profile, models.User, java.util.*, java.io.*, javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/profile.css">
</head>
<%
	User u=(User)request.getAttribute("user");
	String name=u.getName();
	String dob=u.getDob();
	String email=u.getEmail();
	String phone=u.getPhone();
%>
<body>
	<div class="container-1">
		<div class="box-1">
	 <div class="tabs">
	 				<div class="tab-pic">
	 					<img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAHBg8SEA8SFhAVEg4SEhARDw8PEBYQFRIWFxUSExMYHiggHRolGxYTITEhMS0rLi4uFx8zODMsNygtLi8BCgoKDg0OFxAQGi0fIB0tLS0rLSstLS0rLS0rLS0tLS0tLS0rLS0rLS0rLSsrLS0rLS0tLS0tLSstKy0tKzctN//AABEIAOEA4QMBIgACEQEDEQH/xAAbAAEBAAMBAQEAAAAAAAAAAAAABQIEBgEDB//EADgQAQABAgQDBAkCBAcAAAAAAAABAgMEBREhMVGREkFhcRMiUnKBocHR4TKxFCNCghUkNGKSssL/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAwIBBP/EAB0RAQEBAQEAAwEBAAAAAAAAAAABAhExA0FRIRL/2gAMAwEAAhEDEQA/AP0QB6UgAAAAAAAAAAHtNM11aREzPKImZB4Ny1ll25/TEe9OnyhtW8l9qv4RT9ZZuo7ypIqYvA2sJa1qqrme6NaYmZ6JbsvSzgA64AAAAAAAAAAAAAAAAAAARGs7cQH2w2FrxM+rG3tTtT1UcFlXCq5/w7viq0xFMaRw5J63+NTKdh8ooo/XPanlwp+7ft26bVOlMREcojRmJ22tcAHHUzOMLVeiKqd9InWnv05wiutT8flsYjWqnav5T5+PipnXP5WbEIe10TbrmJjSY4xLxVgAAAAAAAAAAAAAAAAAB4u5XgfQ0RVVHrzw8I+6Zl1n0+LpieEetPlH50dIlu/TWYAJtgAAAAANPMcFGKt7frjhP0nwc9MaS61Aziz6LF6xwqjX49/06qYv0zqNEBVgAAAAAAAAAAAAAAABTyGnW7XPKKY6zP2WkjIOFz+z6q6G/VM+ADLoAAAAAAl59T/JonlVMdY/ConZ5/pKffj9paz7HL4hgLpgAAAAAAAAAAAAAAAKuQT61z+z/wBLCLkU6X6/dj5T+VpDfqmfABl0AAAAAATc9n/K0+/H/WVJKz6f5dEeMz8vy1n1y+I4C6YAAAAAAAAAAAAAAAChkcT/ABc7Tp2ao10211p711rZbp/A29PZjr3/ADbKGr2qTwAZdAAAAAAEjPomfR7TpHb1nTb+nRXYXtPQ1a8NJ18tHZeVyuVHkcHr0JgAAAAAAAAAAAAAAAL2S19rBacqqo+v1b6RkNz9dPlVH7T9FdDXqk8AGXQAAAAABq5lV2MDX5addvq2k7O7nZwsR3zVHSN/s7PXKhgPQmAAAAAAAAAAAAAAAAyt1zbriY4xu6qme1TrDk3RZXd9LgqecerPw/GifyT7ay2wEmwAAAAABzGNu+lxVc67dqYjyjbZ0WKu+hw9VXKJ08+75uWU+OM6egKsAAAAAAAAAAAAAAAAClkl/sXponhVvHvR+P2TSJ0mJjj3T4uWdjsvHWj44O7N7DU1TxmI18+99nnUAAAAAY3KuxRM8omegJeeX9KIojv3ny7o6/skMrlybtc1VTvO8sV8zkTt6ANOAAAAAAAAAAAAAAAAAPAdNl8dnBW/dieu7YYWqexapjlER0hm8yoAAAAxuU9q3Mc4mGQDkY4PWV6nsXqo5VVR0li9KQAAAAAAAAAAAAAAAAAAqZRhKL1uaqqddKtI3nThE8Pilujyy36LBUR3z60/Hf8AbRjd5GstoBFsAAAAABLzbCURYqrin1tYmZiZ31nSdvijOoxNv02Hqp5xMfHucuri/wAY0AKMgAAAAAAAAAAAA8bWHwFy/wAKdI51bR93LeDWfWxh68RPq0zPj3fGVjD5TRb3q9afHano36aYpjSI25Qxfk/GplMw2URTvcnWfZjan8qgJ22+tScAHHQAAAAABOxeVU3qpmmezVOsz30zKiOy8OOYxGErw36qdvajenq+LrZjVo4jK7d7eI7M/wC3h0UnyfrH+UAbmIy25Z7u1HOneenFptyysgDoAAAADO1aqvV6UxMz4fVVwuURG9ydZ9mNo6s3UjsiTbt1XatKYmZ8I1UMPlFVf657Mco3n7LFu3Tap0piIjlEaM07utTLWw+Bt4fhTvzneWyDDQAAAAAAAAAAAAAAAA+F/CUYj9VMa8+E9X3ARsRk8xvRVr4VbT1Tr1mqzVpVTMefD4S6pjVRFdOkxExymNYbm6zcuUFvE5TTXvRPZnlxp/CRiMPVh69Ko05T3T5SpNSs2cfMBpx1GHw9OHt6Ux5z3zPOX1B5lQAAAAAAAAAAAAAAAAAAAAAAABhdtU3qJiqNYZgJv+D2/aq6x9hSHf8AVc5ABx0AAAAAAAAAAAAAAAAAAAAAAAAAAAB//9k=" class="centre" alt="profilepic"></div>
	 					<hr>
                    <ul class="nav-tabs">
                        <li class="active"><a href="#bio" data-toggle="tab">Bio</a></li>
                        <li class=""><a href="#connections" data-toggle="tab">Connections</a></li>
                        <li class=""><a href="#posts" data-toggle="tab">Posts</a></li>
                        <li class=""><a href="#logout" data-toggle="tab">Logout</a></li>
                    </ul>
                    <hr>
        </div>
     </div>
     <div class="box-2">
     <div class="profile">
                    <div class="detail">
                        <h1><%= name%></h1>
                        <h2>~Student</h2>                        
                    </div>
     </div>
     <div class="tab-content">
         <div class="tab active" id="bio">
            	<hr>
                <p class="lead">About</p>
                <hr>
                <div class="row">
                	<p><strong>Name:</strong><%= name%></p>
                    <p><strong>Email:</strong><%= email%></p>
                    <p><strong>About:</strong>Student</p>
                    <p><strong>DOB:</strong><%= dob%></p>
                    <p><strong>Phone:</strong><%= phone%></p>                      
                </div>
         </div>                       
	     <div class="tabs" id="Posts">
	     		<hr>
	            <p class="lead">My Posts</p>
	            <hr>
	            <div class="row">
	                <a>Post1</a><br>
	                <a>Post2</a><br>
	                <a>Post3</a><br>                
	            </div>
	                <br>
	     </div>
	 </div>
	</div>
</div>
</body>
</html>
