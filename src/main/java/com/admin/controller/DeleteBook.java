package com.admin.controller;

import java.io.IOException;

import com.dao.BookDaoImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_book")
public class DeleteBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int bookId = Integer.parseInt(req.getParameter("id"));
			
			int rs = new BookDaoImp().deleteBookDetails(bookId);
			HttpSession session = req.getSession();
			if(rs>0) {
				session.setAttribute("succMsg", "Book Deleted Successfully..");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failMsg", "Something went wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
