<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="servlets.Posts, models.Post, java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>
<style>
.sidebar{
	width: 200px;
	background-color: lightgray;
	height: 100vh;
}
.nav{
	padding-top: 200px;
	padding-left: 50px;
}
body {
	display: flex;
}
.header{
	height: 50px;
	background-color: lightgray;
	display: flex;
	justify-content: space-between;
	padding: 5px;
}
.form-control{
	width: 400px;
	min-width: 200px;
}
.input-group{
	width: 600px;
}
.content{
	width: 100%;
}
.posts{
	display: flex;
	flex-direction: column;
	padding: 20px;
}
</style>
<body>
	<div class="sidebar">
		<nav class="nav flex-column">
  			<a class="nav-link active" aria-current="page" href="#">Home</a>
 			<a class="nav-link" href="#">Profile</a>
 			<a class="nav-link" href="#">Post</a>
		</nav>
	</div>
	<div class="content">
		<div class="header" >
			<form class="d-flex" style="height: 30px; align-self: center;">
        		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        		<button class="btn btn-outline-success" type="submit">Search</button>
      		</form>
      		<button type="button" class="btn btn-success" id="logout">Logout</button>
		</div>
      	<div class="posts">
      		<div class="input-group">
  				<span class="input-group-text">Post something</span>
  				<textarea class="form-control" aria-label="With textarea"></textarea>
  				<button type="button" class="btn btn-success" id="post">Post</button>
      	</div>
      	<div>
      		<%
      			List<Post> posts = (List<Post>)request.getAttribute("posts");
     			PrintWriter pw=new PrintWriter(System.out);
      			for(Post p: posts){
      			%>
      				<div>
      					<h2><%=p.getContent()%></h2>
      					<h4>Author: <%=p.getAuthor()%></h4>
      					<h4>Posted at: <%=p.getCreated_at()%></h4>
      				</div>
      			<%
      			}
      			
      		%>
      	</div>
	</div>
</body>
	<script src="js/home.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>