<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>
						
						<%String failMessage =(String)request.getAttribute("loginFailed");%>
						 <%if(failMessage !=null) {%>
						 <p class="text-center text-danger"><%=failMessage %></p>
						 <% } %>
						 
						 <%String logoutMsg =  (String)session.getAttribute("logMssg");
						   session.removeAttribute("logMssg");
						 %>
						 <%if(logoutMsg !=null) {%>
						 <h5 class="text-center text-success"><%=logoutMsg %></h5>
						 <% } %>
						 
						 
						 <%String errorLogout =  (String)session.getAttribute("errorlogout");
						   
						   session.removeAttribute("errorlogout");
						 %>
						 <%if(errorLogout !=null) {%>
						 <h5 class="text-center text-danger"><%=errorLogout %></h5>
						 <% } %>
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>