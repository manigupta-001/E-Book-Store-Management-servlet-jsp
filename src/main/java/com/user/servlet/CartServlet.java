package com.user.servlet;

import java.io.IOException;

import com.dao.BookDaoImp;
import com.dao.CartDaoImp;
import com.entity.BookDtls;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int bid= Integer.parseInt(req.getParameter("bid"));
			int uid= Integer.parseInt(req.getParameter("uid"));
			
			BookDtls book = new BookDaoImp().getBookDetails(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(book.getBookName());
			c.setAuthor(book.getAuthor());
			c.setPrice(book.getPrice());
			c.setTotalPrice(book.getPrice());
			
			int rs = new CartDaoImp().addCart(c);
			
			HttpSession session = req.getSession();
			if(rs>0) {
				session.setAttribute("addCart", "Book Added to cart Successfully");
				resp.sendRedirect("all_new_book.jsp");
			}else {
				session.setAttribute("failed", "Something went wrong on server");
				resp.sendRedirect("all_new_book.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
