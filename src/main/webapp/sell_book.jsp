<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">

<%   User user = (User)session.getAttribute("userSession"); 
if (user == null) {
    response.sendRedirect("login.jsp");
    return; 
}
%>
	<%@include file="all_component/navbar.jsp"%>


<%     String succmsg  = (String)session.getAttribute("succMsg");
	    String failmsg =  (String)session.getAttribute("failMsg");
	   
	%>


	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h5 class="text-center text-primary p-1">Sell Old Book</h5>
					<% if(succmsg!=null) { %>
	                <p class="text-center text-success"><%=succmsg %></p>
	                <%session.removeAttribute("succMsg"); %>
	                <%} %>
	                
	                
	                <% if(failmsg!=null) { %>
	                  <p class="text-center text-danger"><%=failmsg %></p>
	                    <% session.removeAttribute("failMsg");%>
	                <%} %>
	                
						<form action="add_old_books" method="post"
							enctype="multipart/form-data">

                            <input type="hidden" value="<%=user.getEmail()%>" name="userEmail">
                            
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
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" class="form-control-file" name="bimg"
									id="exampleFormControlFile1" required="required" >

							</div>
							<button type="submit" class="btn btn-primary">Sell</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>