<%@page import="com.entity.User"%>
<%@page import="com.dao.BookDaoImp"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.crd-ho:hover{
background: #f7f7f7;
}

/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}


</style>
</head>
<body>
<% User user = (User)session.getAttribute("userSession");
  if(user==null){
	  response.sendRedirect("login.jsp");
  }
%>

<% String addcart = (String)session.getAttribute("addCart"); %>

<%if(addcart!=null) {%>
<div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<% session.removeAttribute("addCart"); %>
<%}else{ %>
<%} %>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			
			<% List<BookDtls> list = new BookDaoImp().getAllNewBooks(); %>
     
     <% for(BookDtls book : list){ %>
     <div class="col-md-3">
          <div class="card crd-ho">
            <div class="card-body text-center">
                 <img alt="" src="book/<%=book.getPhotoName() %>" style="width:100px ; height:150px" 
                 class="img-thumblin">
                 <p><%=book.getBookName() %></p>
                 <p><%=book.getAuthor() %></p>
                 <p>Categories:<%=book.getBookCategory() %></p>
                 <div class="row justify-content-center text-center">
                 
                  <% if(user==null){ %>
                      <a href="login.jsp" class="btn btn-danger btn-sm ">Add to Cart</a>
                 <%}else{ %>
                 <a href="cart?bid=<%=book.getBookId() %>&&uid=<%=user.getId() %>" class="btn btn-danger btn-sm ">Add to Cart</a>
                 <%} %>
                 
                 
                 <a href="view_book.jsp?bid=<%=book.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                  <a  class="btn btn-danger btn-sm ml-1 text-white"><%=book.getPrice()%></a>
                 </div>
         </div>
         </div>
           </div>
     <% } %>
			</div>
		</div>
	
</body>
</html>