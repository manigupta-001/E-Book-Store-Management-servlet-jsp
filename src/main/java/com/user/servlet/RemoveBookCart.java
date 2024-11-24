package com.user.servlet;

import java.io.IOException;

import com.dao.CartDaoImp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove_book")
public class RemoveBookCart  extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid= Integer.parseInt(req.getParameter("uid"));
		int cid= Integer.parseInt(req.getParameter("cid"));
		
		int rs = new CartDaoImp().deleteBook(bid,uid,cid);
		
		
		HttpSession session = req.getSession();
		
		if(rs>0) {
			session.setAttribute("succMsg", "Book Removed Successfully");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failMsg", "Something Went Wrong On Server");
			resp.sendRedirect("checkout.jsp");
		}
	}

}
