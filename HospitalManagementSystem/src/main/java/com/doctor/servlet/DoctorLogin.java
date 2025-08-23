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
import com.entity.Doctor;


@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		DoctorDao dao = new DoctorDao(DBconnect.getConn());
		Doctor doctor = dao.login(email, password);
		
		HttpSession session = request.getSession();
		
		if(doctor != null) {
			session.setAttribute("doctorObj", doctor);
			response.sendRedirect("doctor/index.jsp");
		} else {
			session.setAttribute("errorMsg", "wrong email or password");
			response.sendRedirect("doctor_login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
