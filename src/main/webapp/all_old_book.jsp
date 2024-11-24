<%@page import="com.dao.BookDaoImp"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.crd-ho:hover{
background: #f7f7f7;
}

</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<% User user = (User)session.getAttribute("userSession");
   if(user==null){
	   response.sendRedirect("admin/home.jsp");	  
   }
%>

	<div class="container-fluid">
		<div class="row p-3">
			
			<% List<BookDtls> list = new BookDaoImp().getAllOldBooks(); %>
     
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