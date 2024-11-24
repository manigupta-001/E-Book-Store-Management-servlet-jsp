<%@page import="com.entity.BookDtls"%>
<%@page import="com.dao.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">

	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">

					<%
					int bookId = Integer.parseInt(request.getParameter("id"));
					%>

					<%
					BookDtls book = new BookDaoImp().getBookDetails(bookId);
					%>
					
					<h4 class="text-center">Edit Books</h4>

					<form action="../edit_book" method="post">
						<input type="hidden" name="bookId" value="<%=bookId%>">
						<div class="form-group">
							<label for="exampleInputEmail1">Book Name*</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="bname"
								value="<%=book.getBookName()%>">

						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Author Name*</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="author"
								value="<%=book.getAuthor()%>">

						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Price*</label> <input type="tel"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="price"
								value="<%=book.getPrice()%>">

						</div>


						<div class="form-group">
							<label for="inputState">Book Status</label> <select
								class="form-control" id="inputState" name="status">
								<option value="Active"
									<%="Active".equalsIgnoreCase(book.getStatus()) ? "selected" : ""%>>Active</option>
								<option value="Inactive"
									<%="Inactive".equalsIgnoreCase(book.getStatus()) ? "selected" : ""%>>Inactive</option>
							</select>
						</div>


						<button type="submit" class="btn btn-primary">Update</button>

					</form>


				</div>
			</div>
		</div>
	</div>
</body>
</html>