package com.admin.controller;

import java.io.IOException;

import com.dao.BookDaoImp;
import com.entity.BookDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit_book")
public class EditBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int bookId = Integer.parseInt(req.getParameter("bookId"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			Double price =Double.parseDouble(req.getParameter("price")) ;
			String status = req.getParameter("status");
			BookDtls b = new BookDtls();
			b.setBookId(bookId);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDaoImp bookdaoimp = new BookDaoImp();
			int rs = bookdaoimp.updateBookDetails(b);
			HttpSession session = req.getSession();
			if(rs>0) {
				session.setAttribute("succMsg", "Book Edited Successfully..");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failMsg", "Book Not updated");
				resp.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
