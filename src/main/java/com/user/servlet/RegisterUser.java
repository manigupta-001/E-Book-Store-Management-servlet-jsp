package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDaoImp;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fName");
			String email = req.getParameter("emailAdd");
			String phno = req.getParameter("phNo");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

//		System.out.println("name is "+name+" "+email+" "+phno+" "+password+" "+" "+check);

			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			user.setPassword(password);

			HttpSession session = req.getSession();
			if (check != null) {
				UserDaoImp userdao = new UserDaoImp();
				
				boolean f2 = userdao.checkUser(email);
				if(f2) {
					int rs = userdao.userRegister(user);
					if (rs > 0) {
						session.setAttribute("succmsg","Registered Successfully");	
						resp.sendRedirect("register.jsp");
					}else {
						session.setAttribute("failedmsg", "Something went wrong on server");
						resp.sendRedirect("register.jsp");	
					}
				}else {
					session.setAttribute("failedmsg", "User Already Exists");
					resp.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("failedmsg", "please check Terms & Condition");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
