package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBconnect;
import com.entity.Appointment;


@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String aptDate = request.getParameter("apt_date");
		String email = request.getParameter("email");
		String phoneNo = request.getParameter("ph_number");
		String disease = request.getParameter("disease");
		int docId = Integer.parseInt(request.getParameter("doctor"));
		String address = request.getParameter("address");
		
		Appointment apt = new Appointment(userId, name, gender, age, aptDate, email, phoneNo, disease, docId, address, "pending");
		AppointmentDao aptDao = new AppointmentDao(DBconnect.getConn());
		
		HttpSession session = request.getSession();
		if(aptDao.addAppointment(apt)) {
			session.setAttribute("successMsg", "Appointment added successfully");
		} else {
			session.setAttribute("errorMsg", "something went wrong");
		}
		response.sendRedirect("user_appointment.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
