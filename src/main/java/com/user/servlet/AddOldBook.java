package com.user.servlet;

import java.io.File;
import java.io.IOException;

import com.dao.BookDaoImp;
import com.entity.BookDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_old_books")
@MultipartConfig
public class AddOldBook  extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			Double price =Double.parseDouble(req.getParameter("price")) ;
			String category = "Old";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			String useremail = req.getParameter("userEmail");
			BookDtls b = new BookDtls(bookName, author, price, category, status, fileName,useremail);
			BookDaoImp bdI = new BookDaoImp();
			
			HttpSession session = req.getSession();
		   int rs =	bdI.addBooks(b);
		   if(rs>0) {
			   
			   String path = getServletContext().getRealPath("")+"book";
				
				File f1 = new File(path);
				part.write(path+File.separator+fileName);
			   
			   session.setAttribute("succMsg","Book Added Successfully for Selling");
			   resp.sendRedirect("sell_book.jsp");
		   }else {
			   session.setAttribute("failMsg", "Something went wrong on server");
			   resp.sendRedirect("sell_book.jsp");
		   }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
