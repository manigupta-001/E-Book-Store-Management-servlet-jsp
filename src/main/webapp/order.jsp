<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Book</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-1">
	
	<h3 class="text-center text-primary">Your Order</h3>
	
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
			<% User user =  (User)session.getAttribute("userSession"); 
			    if(user==null){
			    	response.sendRedirect("login.jsp");
			    }else{
			    	List<BookOrder> list = new BookOrderImpl().getOrderedBookDtls(user.getEmail());
			    	for(BookOrder b : list){ %>
			    	
			    	<tr>
					<th scope="row"><%=b.getOrderId() %></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
			    		
			    <% 	}
			    	
			    	
			    }
			%>
			
				
				
			</tbody>
		</table>

	</div>

</body>
</html>