package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBconnect;

@WebServlet("/DoctorPasswordChange")
public class DoctorPasswordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String oldPass = request.getParameter("old_pass");
		String newPass = request.getParameter("new_pass");
		
		DoctorDao dao = new DoctorDao(DBconnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.checkPassword(id, oldPass)) {
			if(dao.changePassword(id, newPass)) {
				session.setAttribute("successMsg", "password changed successfully");
			}else {
				session.setAttribute("errorMsg", "something went wrong");
			}
		} else {
			session.setAttribute("errorMsg", "old password did not match");
		}
		response.sendRedirect("doctor/edit_profile.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
