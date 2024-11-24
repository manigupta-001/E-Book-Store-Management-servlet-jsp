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
	
	<% User user2 = (User)session.getAttribute("userSession"); %>
   <%if(user2==null){ %>
      <% response.sendRedirect("../login.jsp"); %>
  <% } %>
	<div class="container">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
				
				<% String succMessg = (String)session.getAttribute("succMsg");
				   String failMessg = (String)session.getAttribute("failMsg");
				   session.removeAttribute("succMsg");
				   session.removeAttribute("failMsg");
				%>
				
				<h4 class="text-center">Add Books</h4>
				<% if(succMessg!=null) { %>
				<p class="text-center text-success"><%=succMessg %></p>
				<% } %>
				<% if(failMessg!=null) { %>
				<p class="text-center text-danger"><%=failMessg %></p>
				<% } %>
					<form action="../add_books" method="post"
						enctype="multipart/form-data">

						<div class="form-group">
							<label for="exampleInputEmail1">Book Name*</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="bname" required="required">

						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Author Name*</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="author" required="required">

						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Price*</label> <input type="number"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="price" required="required">

						</div>



						<div class="form-group">
							<label for="inputState">Book Categories</label> <select
								class="form-control" id="inputState" name="categories" required="required">
								<option selected="selected">---select---</option>
								<option value="New">New Book</option>
							</select>
						</div>

						<div class="form-group">
							<label for="inputState">Book Status</label> <select
								class="form-control" id="inputState" name="status" required="required">
								<option selected="selected">---select---</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
						
						
						<div class="form-group">
							<label for="exampleFormControlFile1">Upload Photo</label> <input
								type="file" class="form-control-file" name="bimg"
								id="exampleFormControlFile1" required="required">

						</div>
						<button type="submit" class="btn btn-primary">Add</button>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>