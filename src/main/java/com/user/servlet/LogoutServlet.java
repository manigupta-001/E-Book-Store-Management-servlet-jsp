package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session2 = req.getSession();
			HttpSession session = req.getSession();
			if(session.getAttribute("userSession")!=null) {
				session.removeAttribute("userSession");
				
				session2.setAttribute("logMssg", "logout Successfully");
				resp.sendRedirect("login.jsp");
			}else {
				session2.setAttribute("errorlogout", "please log in");
				resp.sendRedirect("login.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}