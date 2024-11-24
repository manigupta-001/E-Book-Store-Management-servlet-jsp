<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>

   <%  User user = (User)session.getAttribute("userSession");
	     if(user==null){
		   response.sendRedirect("login.jsp");
		   return; 
		   } %>
		   
		           <% String succMessg = (String)session.getAttribute("succMsg");
			 		    
					   String failMessg = (String)session.getAttribute("failMsg");
					  
					   
					 %>
					  
					
   
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center text-primary">Edit Profile</h4>
						
						
						<%if(succMessg!=null){ %>
					 <p class="text-center text-success"><%=succMessg %></p>
					 <% session.removeAttribute("succMsg"); %>
					<%} %>
					<%if(failMessg!=null){ %>
					 <p class="text-center text-danger"><%=failMessg %></p>
					 <%  session.removeAttribute("failMsg"); %>
					<%} %>
						
						
						<form action="update_profile" method="post">
                          <input type="hidden" value="<%=user.getId()%>" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fName" value="<%=user.getName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="emailAdd" value="<%=user.getEmail()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phNo" value="<%=user.getPhno()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>
							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary btn-block btn-sm mt-1">Update</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>