<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patients</title>
<%@ include file="../components/allcss.html"%>
</head>
<body>
	<%
	if (session.getAttribute("adminObj") == null) {
		response.sendRedirect("../admin_login.jsp");
	} else {
	%>

	<%@ include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow">
					<div class="card-body">
						<h4 class="card-title text-center">Patient Details</h4>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment</th>
									<th scope="col">Email</th>
									<th scope="col">Phone Number</th>
									<th scope="col">Disease</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Address</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao docDao = new DoctorDao(DBconnect.getConn());
								
								AppointmentDao aptDao = new AppointmentDao(DBconnect.getConn());
								List<Appointment> apts = aptDao.getAllAppointment();
								for(Appointment ap : apts){
								%>
								<tr>
									<td><%= ap.getFullName() %></td>
									<td><%= ap.getGender() %></td>
									<td><%= ap.getAge() %></td>
									<td><%= ap.getAptDate() %></td>
									<td><%= ap.getEmail() %></td>
									<td><%= ap.getPhNo() %></td>
									<td><%= ap.getDisease() %></td>
									<td><%= docDao.getById(ap.getDoctorId()).getFullName() %></td>
									<td><%= ap.getAddress() %></td>
									<td><%= ap.getStatus() %></td>
									
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%
	}
	%>
</body>
</html>