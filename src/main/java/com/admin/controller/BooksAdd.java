package com.admin.controller;

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

@MultipartConfig
@WebServlet("/add_books")
public class BooksAdd  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			Double price =Double.parseDouble(req.getParameter("price")) ;
			String category = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			HttpSession session = req.getSession();
			
			if("---select---".equals(category) || "---select---".equals(status)) {
				session.setAttribute("failMsg", "Please select option");
				resp.sendRedirect("admin/add_books.jsp");
			}else {
				BookDtls b = new BookDtls(bookName, author, price, category, status, fileName, "admin");
				BookDaoImp bdI = new BookDaoImp();

			   int rs =	bdI.addBooks(b);
			   if(rs>0) {
				   
				   String path = getServletContext().getRealPath("")+"book";
					
					File f1 = new File(path);
					part.write(path+File.separator+fileName);
				   
				   session.setAttribute("succMsg","Book Added Successfully");
				   resp.sendRedirect("admin/add_books.jsp");
			   }else {
				   session.setAttribute("failMsg", "Something went wrong on server");
				   resp.sendRedirect("admin/add_books.jsp");
			   }
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
