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
import com.entity.Doctor;


@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String qualification = request.getParameter("qualification");
		String specialist = request.getParameter("specialist");
		String email = request.getParameter("email");
		String mobNumber = request.getParameter("mobNumber");
		String password = request.getParameter("password");
		
		Doctor doc = new Doctor(name, dob, qualification, specialist, email, mobNumber, password);
		
		DoctorDao dao = new DoctorDao(DBconnect.getConn());
		
		HttpSession session = request.getSession();
		if(dao.register(doc)) {
			session.setAttribute("isAdded", "true");
		} else {
			session.setAttribute("isAdded", "false");
		}
		response.sendRedirect("admin/add_doctor.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
