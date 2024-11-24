<%@page import="com.dao.BookOrderImpl"%>
<%@page import="com.dao.BookOrderDao"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	
	<h3 class="text-center">Hello Admin</h3>
	<table class="table table-striped ">
		<thead class= "bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
			    <th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>
		
		<% User userr =  (User)session.getAttribute("userSession"); 
			    if(userr==null){
			    	response.sendRedirect("../login.jsp");
			    }else{
			    	List<BookOrder> list = new BookOrderImpl().getOrderedBookDtls();
			    	for(BookOrder b : list){ %>
			    	
			    	<tr>
					<th scope="row"><%=b.getOrderId() %></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getFullAdd()%></td>
					<td><%=b.getPhno()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
			    		
			    <% 	}
			    	
			    	
			    }
			%>
			
		</tbody>
	</table>

<div style="margin-top: 254px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>