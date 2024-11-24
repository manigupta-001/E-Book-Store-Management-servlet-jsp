<%@page import="com.dao.BookDaoImp"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	
	<% User user = (User)session.getAttribute("userSession"); %>
	<% int bookId = Integer.parseInt(request.getParameter("bid")); 
	   BookDtls book =  new BookDaoImp().getBookDetails(bookId);
	%>
	
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
			<img  src="book/<%=book.getPhotoName()%>" style="height:150px ;width:100px"><br>
			<h4 class="mt-3">Book Name: <span class="text-success"><%=book.getBookName() %></span></h4>
			<h4>Author Name: <span class="text-success"><%=book.getAuthor() %></span></h4>
			<h4>Category: <span class="text-success"><%=book.getBookCategory() %></span></h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
			<h2><%=book.getBookName() %></h2>
			
			<% if("Old".equals(book.getBookCategory())) {%>
			      <h5  class="text-primary">Contact to Seller</h5>
			      <h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email : <%=book.getEmail() %></h5>
			<% } %>
			<div class="row ">
			
			<div class="col-md-4 text-danger text-center p-2">
			<i class="fa-solid fa-money-bill-wave fa-2x"></i>
			<p>Cash On Delivery</p>
			</div>
			<div class="col-md-4 text-danger text-center p-2">
			<i class="fa-solid fa-rotate-left fa-2x"></i>
			<p>Return Available </p>
			</div>
			<div class="col-md-4 text-danger text-center p-2">
			<i class="fa-solid fa-truck fa-2x"></i>
			<p>Free Shipping</p>
			</div>
			
		</div>	
			
			<% if("Old".equals(book.getBookCategory())) {%>
			    <div class="text-center p-3">
			<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-plus"></i> Continue Shopping</a>
			<a class="btn btn-danger text-white"><i class="fa-solid fa-indian-rupee-sign"> <%=book.getPrice() %></i></a>
			</div>
			<%}else { %>
			    <div class="text-center p-3">
			 <% if(user==null){ %>
                      <a href="login.jsp" class="btn btn-danger btn-sm ">Add to Cart</a>
                 <%}else{ %>
                       <a href="cart?bid=<%=bookId%>&&uid=<%=user.getId()%>" class="btn btn-primary ">Add to Cart</a>
                 <%} %>
			<a class="btn btn-danger text-white"><i class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice() %></a>
			</div>
			<%} %>
			
			
			
			
			</div>

		</div>
	</div>
</body>
</html>