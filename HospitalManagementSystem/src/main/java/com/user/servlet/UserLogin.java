package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.User;


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao dao = new UserDao(DBconnect.getConn());
		User user = dao.login(email, password);
		
		HttpSession session = request.getSession();
		
		if(user != null) {
			session.setAttribute("userObj", user);
			response.sendRedirect("index.jsp");
		} else {
			session.setAttribute("isLogin", "false");
			response.sendRedirect("user_login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
