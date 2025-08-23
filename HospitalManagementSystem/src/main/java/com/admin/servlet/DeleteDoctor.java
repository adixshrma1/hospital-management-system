package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBconnect;


@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DBconnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.delete(id)) {
			session.setAttribute("successMsg", "doctor deleted successfully");
		} else {
			session.setAttribute("errorMsg", "something went wrong");
		}
		response.sendRedirect("admin/view_doctor.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
