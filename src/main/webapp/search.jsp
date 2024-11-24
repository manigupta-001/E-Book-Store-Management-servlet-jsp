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
	<div class="container-fluid">
		<div class="row p-3">
			
			<% User user = (User)session.getAttribute("userSession"); %>
			
			<% 
			String ch = (String)request.getParameter("ch");
			
			List<BookDtls> li = new BookDaoImp().getBookBySearch(ch); %>
        <% for(BookDtls book : li){ %>
            <div class="col-md-3">
                <div class="card crd-ho mt-2">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=book.getPhotoName() %>" style="width:100px; height:150px"
                            class="img-thumblin">
                        <p><%=book.getBookName() %></p>
                        <p><%=book.getAuthor() %></p>
                       
                        
                        <% if(book.getBookCategory().equalsIgnoreCase("old")) { %>
                       Categories: <%=book.getBookCategory() %>
                         <div class= "row justify-content-center text-center" style="margin-top:10px;">
                            <a href="view_book.jsp?bid=<%=book.getBookId() %>" class="btn btn-success btn-sm">View Details</a>        
                            <a  class="btn btn-danger btn-sm ml-1 text-white"><%=book.getPrice()%></a>
                        </div>
                        <%}else{ %>
                         Categories:<%=book.getBookCategory()%>
                         <div class="row justify-content-center text-center " style="margin-top:10px;">
                           
                           <% if(user==null){ %>
                      <a href="login.jsp" class="btn btn-danger btn-sm ">Add to Cart</a>
                 <%}else{ %>
                 <a href="cart?bid=<%=book.getBookId() %>&&uid=<%=user.getId() %>" class="btn btn-danger btn-sm ">Add to Cart</a>
                 <%} %>
                            <a href="view_book.jsp?bid=<%=book.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                            
                            <a class="btn btn-danger btn-sm ml-1 text-white"><%=book.getPrice()%></a>
                        </div>
                         <%} %>
                       
                    </div>
                </div>
            </div>
        <% } %>
			</div>
		</div>
	
</body>
</html>