<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="servlets.Posts, models.Post, java.util.*, java.io.*, javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	<link rel ="stylesheet" href ="./css/post.css">
	<link rel ="stylesheet" href ="./css/home.css">
	<script src="https://kit.fontawesome.com/8a4f70c80a.js" crossorigin="anonymous"></script>	
</head>
<body>
	<%String user_id= (String)session.getAttribute("user_id");
		if(user_id==null) response.sendRedirect("login");
	%>
	<div class="sidebar">
		<nav class="nav flex-column">
  			<a class="nav-link active" aria-current="page" href="#">Home</a>
 			<a class="nav-link" href="./profile/?id=<%= user_id%>">Profile</a>
 			<a class="nav-link" href="#">Post</a>
		</nav>
	</div>
	<div class="content">
		<div class="header" >
			<form class="d-flex" style="height: 30px; align-self: center;">
        		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        		<button class="btn btn-outline-success" type="submit">Search</button>
      		</form>
      		<form action="logout" method="get">
      			<input class="btn btn-success" id="logout" type="submit" value="Logout"/>
      		</form>
	</div>
      	<div class="posts">
      		<form class="input-group" action="home" method="post">
  				<span class="input-group-text">Post something</span>
  				<textarea class="form-control" aria-label="With textarea" name="content"></textarea>
  				<button type="submit" class="btn btn-success" id="post">Post</button>
      	</form>
      	<div>
    		<div class="post-container">
      		<%
      			List<Post> posts = (List<Post>)request.getAttribute("posts");
     			PrintWriter pw=new PrintWriter(System.out);
      			for(Post p: posts){
      			%>
		<div class= "post-content">
			<div class="post-header">
				<div><h3><%=p.getAuthor()%></h3>
				<small><%=p.getCreated_at()%></small></div>
				
			</div>
			<div class ="post-tag-line">
				<%=p.getContent()%>
			</div>
			<div class="image-container">
				
				<img alt="post-image" src="https://wallpapercave.com/wp/wp2880194.jpg">
			</div>
			<div class="like-comment">
				<!--<div class="like">
					<i class="fas fa-thumbs-up"></i>
					<h6>23</h6>
				</div>
				<div class="dislike">
					<i class="fas fa-thumbs-down"></i>
					<h6>34</h6>
				</div>
				<div class="comment">
					<i class="fas fa-comment"></i>
					<h6>45</h6>
				</div>-->
			</div>
			
		</div>
      			<%
      			}
      			
      		%>
      		</div>
      	</div>
	</div>
</body>
	<script src="js/home.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>