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


@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String oldPass = request.getParameter("old_pass");
		String newPass = request.getParameter("new_pass");
		
		UserDao dao = new UserDao(DBconnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.checkPassword(userId, oldPass)) {
			if(dao.changePassword(userId, newPass)) {
				session.setAttribute("successMsg", "password changed successfully");
			}else {
				session.setAttribute("errorMsg", "something went wrong");
			}
		} else {
			session.setAttribute("errorMsg", "old password did not match");
		}
		response.sendRedirect("change_password.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
