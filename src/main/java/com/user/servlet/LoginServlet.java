package com.user.servlet;

import java.io.IOException;

import com.dao.UserDaoImp;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
		if("admin@gmail.com".equals(email) && "admin".equals(password)) {
			
			
			User user = new User();
			user.setName("Admin");

			session.setAttribute("userSession", user);
			resp.sendRedirect("admin/home.jsp");
		}else {
			User user = new UserDaoImp().verifyUserDetails(email, password);
			if(user!=null) {
				session.setAttribute("userSession", user);
				resp.sendRedirect("index.jsp");
			}else {
				req.setAttribute("loginFailed", "Email & password is incorrect");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
