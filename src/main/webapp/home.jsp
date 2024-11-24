<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>User:Home</h1>
	<% User userObj = (User)session.getAttribute("userSession"); %>
	
	<% if(userObj != null){ %>
	    <h3>Name: <%= userObj.getName()%></h3>
	    <h3>Email: <%= userObj.getEmail()%></h3>
	<% } %>

</body>   
</html>       