<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImp"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-book: index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
background : url("img/b.jpg");
height : 50vh;
width: 100%;
background-size:cover;
background-repeat : no-repeat;
}
.crd-ho:hover{
background: #f7f7f7;
}

</style>
</head>
<body style="background-color: #f7f7f7">

<% User user = (User)session.getAttribute("userSession"); %>


  <%@include file="all_component/navbar.jsp"%>
  <div class="container-fluid back-img">
       <h2 class="text-center text-muted">E-Book Management System</h2>
  </div>
  
  
 <!-- start Recent books -->
 
<div class="container">
    <h3 class="text-center p-2">Recent Book</h3>
    <div class="row">
        <% List<BookDtls> li = new BookDaoImp().getRecentBooks(); %>
        <% for(BookDtls book : li){ %>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=book.getPhotoName() %>" style="width:150px; height:200px"
                            class="img-thumblin">
                        <p><%=book.getBookName() %></p>
                        <p><%=book.getAuthor() %></p>
                       
                        
                        <% if(book.getBookCategory().equalsIgnoreCase("old")) { %>
                       Categories: <%=book.getBookCategory() %>
                       <div class="row "style="margin-top:10px;">
                            <a href="view_book.jsp?bid=<%=book.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>        
                            <a  class="btn btn-danger btn-sm ml-1 text-white"><%=book.getPrice()%></a>
                        </div>
                        <%}else{ %>
                         Categories:<%=book.getBookCategory()%>
                        <div class="row " style="margin-top:10px;">
                        
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
    <div class="text-center mt-1">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>
<!-- End Recent Books -->


  
  <hr>
  
   <!-- start New books -->
   
  <div class="container ">
     <h3 class="text-center">New Book</h3>
     <div class="row">
     
     
     
     <% List<BookDtls> list = new BookDaoImp().getNewBooks(); %>
     
     <% for(BookDtls book : list){ %>
     <div class="col-md-3">
          <div class="card crd-ho">
            <div class="card-body text-center">
                 <img alt="" src="book/<%=book.getPhotoName() %>" style="width:150px ; height:200px" 
                 class="img-thumblin">
                 <p><%=book.getBookName() %></p>
                 <p><%=book.getAuthor() %></p>
                 <p>Categories:<%=book.getBookCategory() %></p>
                 <div class="row ">
                 
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
     <div class="text-center mt-1">
     <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
     </div>
     
  </div>
  
  <!-- End New Books -->
  
  <hr>
  
   <!-- start Old books -->
   
  <div class="container ">
     <h3 class="text-center">Old Book</h3>
     <div class="row">
     
     <% List<BookDtls> list2 = new BookDaoImp().getOldBooks(); %>
        <% for(BookDtls book : list2){ %>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=book.getPhotoName() %>" style="width:150px; height:200px"
                            class="img-thumblin">
                        <p><%=book.getBookName() %></p>
                        <p><%=book.getAuthor() %></p>
                       <p><%=book.getBookCategory() %></p>
                       <div class="row ">
                 <a href="view_book.jsp?bid=<%=book.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
                  <a class="btn btn-danger btn-sm ml-1 text-white"><%=book.getPrice()%></a>
                 </div>
                       
                       
                    </div>
                </div>
            </div>
        <% } %>
     
     
    
     </div>
     <div class="text-center mt-1">
     <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
     </div>
     
  </div>
  
  <!-- End Old Books -->
  
  <%@include file="all_component/footer.jsp" %>
</body>
</html>