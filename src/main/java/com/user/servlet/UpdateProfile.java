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
@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fName");
			String email = req.getParameter("emailAdd");
			String phno = req.getParameter("phNo");
			String password = req.getParameter("password");
			
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			
			HttpSession session = req.getSession();
			
			boolean f = new UserDaoImp().checkPassword(id, password);
			if(f) {
				int rs = new UserDaoImp().updateProfile(user);
				if (rs > 0) {
					session.setAttribute("succMsg","Profile Updated Successfully");	
					resp.sendRedirect("edit_profile.jsp");
				}else {
					session.setAttribute("failMsg", "Something went wrong on server");
					resp.sendRedirect("edit_profile.jsp");	
				}
			}else {
				session.setAttribute("failMsg", "Your Password is incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
