package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBconnect;

@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String comment = request.getParameter("comment");
		
		AppointmentDao dao = new AppointmentDao(DBconnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.updateStatus(id, comment)) {
			session.setAttribute("successMsg", "updated successfully");
		} else {
			session.setAttribute("errorMsg", "something went wrong");
		}
		response.sendRedirect("doctor/patient.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
