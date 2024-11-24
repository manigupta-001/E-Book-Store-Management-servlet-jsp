<%@page import="java.util.List"%>
<%@page import="com.dao.CartDaoImp"%>
<%@page import="com.entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>
	
	<%   User user = (User)session.getAttribute("userSession");  %>
	<% if(user==null) {
	     response.sendRedirect("login.jsp"); 
	     return; 
	 } %>
	
	<% String succmsg  = (String)session.getAttribute("succMsg");
	    String failmsg =  (String)session.getAttribute("failMsg");
	   
	%>
	
	<% if(succmsg!=null) { %>
	   <div class="alert alert-success text-center" role="alert">${succMsg}</div>
	   <%session.removeAttribute("succMsg"); %>
	<%} %>
	
	
	<% if(failmsg!=null) { %>
	   <div class="alert alert-danger text-center" role="alert">${failMsg}</div>
	    <% session.removeAttribute("failMsg");%>
	<%} %>
	
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							
							<%  List<Cart> c = new CartDaoImp().getBookByUser(user.getId());
							    Double totalPrice=0.00;
							%>
							<% for(Cart cart : c){  
								totalPrice = cart.getTotalPrice();
							 %>
							
							     <tr>
									<th scope="row"><%=cart.getBookName() %></th>
									<td><%=cart.getAuthor() %></td>
									<td><%=cart.getPrice() %></td>
									<td>
									   <a href="remove_book?bid=<%=cart.getBid()%>&&uid=<%=cart.getUserId()%>&&cid=<%=cart.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
									</td>
								</tr>
							   
							<%} %>
								<tr>
								<td>Total Price</td>
								<td></td>
								<td></td>
								<td><%=totalPrice %></td>
								
								</tr>
								
								
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
						
						<input type="hidden" value="<%=user.getId()%>" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text" name="username"
										class="form-control" id="inputEmail4" value="<%=user.getName()%>" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email" name="email"
										class="form-control" id="inputPassword4" value="<%=user.getEmail() %>" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone number</label> <input name="phNo"
										type="number" class="form-control" id="inputEmail4" value="<%=user.getPhno()%>" required="required" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text" name="address"
										class="form-control" id="inputPassword4"
										 required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text" name="landmark"
										class="form-control" id="inputEmail4" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text" name="city"
										class="form-control" id="inputPassword4" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text" name="state"
										class="form-control" id="inputEmail4" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pincode</label> <input name="pincode"
										type="number" class="form-control " id="inputPassword4" required="required">
								</div>
							</div>
							
							<div class="form-group">
							 <label>Payment Type</label>
							 <select class="form-control" required="required" name="paymentType">
							    <option value="noselect">--Select--</option>
							    <option value="COD">Cash on Delivery</option>
							 </select>
							</div>
							
							<div class="text-center">
							 <button class="btn btn-warning">Order Now</button>
							 <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
							</div>
							
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>