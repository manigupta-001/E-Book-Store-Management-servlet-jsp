<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<% String succMsg = (String)session.getAttribute("succmsg");
					   String failMsg = (String)session.getAttribute("failedmsg");
					   session.removeAttribute("succmsg"); 
					   session.removeAttribute("failedmsg");
					 %>
					
					<h4 class="text-center">Registration Page</h4>
					  <form action="register" method="post">
					  
					<%if(succMsg!=null){ %>
					<p class="text-center text-success"><%=succMsg %></p>
					<%} %>
					<%if(failMsg!=null){ %>
					<p class="text-center text-danger"><%=failMsg %></p>
					<%} %>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fName">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="emailAdd" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phNo" >
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
								required="required"	name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1 " name="check"> <label class="form-check-label"
									for="exampleCheck1" >Agree Terms & Condition</label>
							</div>
							<button type="submit" class="btn btn-primary mt-1">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
    
    <%@include file="all_component/footer.jsp" %>
</body>
</html>