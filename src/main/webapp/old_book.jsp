<%@page import="com.dao.BookDaoImp"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Old Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	
	<%  User user = (User)session.getAttribute("userSession");
	     if(user==null){
		   response.sendRedirect("login.jsp");
		   return; 
		   } %>
	              <% String succMessg = (String)session.getAttribute("succMsg");
					    
					   String failMessg = (String)session.getAttribute("failMsg");
					  
					   
					 %>
					  
					<%if(succMessg!=null){ %>
					 <div class="alert alert-success text-center">${succMsg}</div>
					 <% session.removeAttribute("succMsg"); %>
					<%} %>
					<%if(failMessg!=null){ %>
					 <div class="alert alert-success text-center">${failMsg}</div>
					 <%  session.removeAttribute("failMsg"); %>
					<%} %>
	
	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			List<BookDtls> list = new BookDaoImp().getBookByOld(user.getEmail(), "old"); 
			
			for(BookDtls book : list)
			{ %>
				<tr>
				<td><%=book.getBookName() %></td>
				<td><%=book.getAuthor() %></td>
				<td><%=book.getPrice() %></td>
				<td><%=book.getBookCategory() %></td>
				<td><a href="delete_old_book?em=<%=user.getEmail()%>&&bid=<%=book.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
		     <%	}
			
			%>
				
				
			</tbody>
		</table>
	</div>
</body>
</html>