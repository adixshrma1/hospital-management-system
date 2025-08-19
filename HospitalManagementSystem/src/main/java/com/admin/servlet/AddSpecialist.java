package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBconnect;


@WebServlet("/AddSpecialist")
public class AddSpecialist extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		
		SpecialistDao dao = new SpecialistDao(DBconnect.getConn());
		boolean bool = dao.addSpecialist(name);
		
		HttpSession session = request.getSession();
		
		if(bool == true) {
			session.setAttribute("isAdded", "true");
		} else {
			session.setAttribute("isAdded", "false");
		}
		response.sendRedirect("admin/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
