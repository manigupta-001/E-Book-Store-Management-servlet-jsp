package com.user.servlet;

import java.io.IOException;

import com.dao.BookDaoImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("em");
			int bid= Integer.parseInt(req.getParameter("bid"));
			int rs = new BookDaoImp().oldBookDelete(email, "Old",bid);
			HttpSession session = req.getSession();
			if(rs>0) {
				session.setAttribute("succMsg", "Old Book Delete Successfully");
				resp.sendRedirect("old_book.jsp");
			}else {
				session.setAttribute("failMsg", "Something Went Wrong On Server");
				resp.sendRedirect("old_book.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
