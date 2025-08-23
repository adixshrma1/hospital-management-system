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


@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String qualification = request.getParameter("qualification");
		String specialist = request.getParameter("specialist");
		String mobNumber = request.getParameter("mobNumber");
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Doctor doc = new Doctor(name, dob, qualification, specialist, "", mobNumber, "");
		doc.setId(id);
		
		DoctorDao dao = new DoctorDao(DBconnect.getConn());
		
		HttpSession session = request.getSession();
		if(dao.editProfile(doc)) {
			Doctor doctor = dao.getById(id);
			session.setAttribute("doctorObj", doctor);	// overriding the previous value
			session.setAttribute("successMsg1", "doctor updated successfully");
		} else {
			session.setAttribute("errorMsg1", "something went wrong");
		}
		response.sendRedirect("doctor/edit_profile.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
