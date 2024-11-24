<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>


<% User user2 = (User)session.getAttribute("userSession"); %>
   <%if(user2==null){ %>
      <% response.sendRedirect("../login.jsp"); %>
  <% } %>
	<%
	String succMessg = (String) session.getAttribute("succMsg");
	String failMessg = (String) session.getAttribute("failMsg");
	session.removeAttribute("succMsg");
	session.removeAttribute("failMsg");
	%>
	
	
	
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	
	<% if(succMessg!=null) { %>
				<h5 class="text-center text-success"><%=succMessg %></h5>
				<% } %>
				<% if(failMessg!=null) { %>
				<h5 class="text-center text-danger"><%=failMessg %></h5>
				<% } %>
	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDaoImp bookDao = new BookDaoImp();
			List<BookDtls> list = bookDao.getAllBooks();
			%>

			<%
			for (BookDtls b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_book.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a> <a href="../delete_book?id=<%=b.getBookId() %>"
					class="btn btn-sm btn-danger"><i class="far fa-trash-alt"></i> Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>

	<div style="margin-top: 234px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>