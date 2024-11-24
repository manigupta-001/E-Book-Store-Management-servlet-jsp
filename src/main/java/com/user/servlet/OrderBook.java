package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.dao.BookOrderImpl;
import com.dao.CartDaoImp;
import com.entity.BookDtls;
import com.entity.BookOrder;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phNo");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("paymentType");
			
			String fullAddress = address+","+landmark+","+city+","+state+","+pincode;
			
			List<Cart> clist = new CartDaoImp().getBookByUser(id);	
			HttpSession session = req.getSession();
			
			if(clist.isEmpty()) {
				session.setAttribute("failMsg", "Please Add item to proceed");
				resp.sendRedirect("checkout.jsp");
			}else {
				BookOrder o = null;
				List<BookOrder> orderlist = new ArrayList<BookOrder>();
				
				Random r = new Random();
				
				for(Cart c : clist) {
					o = new BookOrder();
					o.setOrderId("BOOK_ORD-00"+r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phone);
					o.setFullAdd(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice());
					o.setPaymentType(paymentType);
					orderlist.add(o);
				}
				
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("failMsg", "Please Choose payment Method");
					resp.sendRedirect("checkout.jsp");
				}else {
					boolean f = new BookOrderImpl().saveOrder(orderlist);
					if(f) {
						resp.sendRedirect("order_success.jsp");
					}else {
						session.setAttribute("failMsg", "Something went wrong on server");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
