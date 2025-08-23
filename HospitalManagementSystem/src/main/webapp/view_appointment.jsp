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
<title>View Appointment</title>
<%@ include file="components/allcss.html"%>

</head>
<body>
	<%
	if (session.getAttribute("userObj") == null) {
		response.sendRedirect("user_login.jsp");
	} else {
	%>

	<%@ include file="components/navbar.jsp"%>

	<div class="container-fluid p-5">
		<div class="row">
			<div class="col-md-9 p-3">
				<div class="card shadow">
					<div class="card-body">
						<h3 class="card-title text-center text-success mb-3">Appointment List</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Disease</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
									
									
								</tr>
							</thead>
							<tbody>
								<% 
									// user object is already created in navbar
									AppointmentDao dao = new AppointmentDao(DBconnect.getConn());
									DoctorDao docDao = new DoctorDao(DBconnect.getConn());
									List<Appointment> appointments =  dao.getAllAppointmentByUserId(user.getId());
									for(Appointment apt : appointments){
								%>
								<tr>
									<td><%= apt.getFullName() %></td>
									<td><%= apt.getGender() %></td>
									<td><%= apt.getAge() %></td>
									<td><%= apt.getAptDate() %></td>
									<td><%= apt.getDisease() %></td>
									<td><%= docDao.getById(apt.getDoctorId()).getFullName() %></td>
									<td><%= apt.getStatus() %></td>
									
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
				<!-- card end -->
			</div>
			<!-- left card end -->
			
			<!-- right card start -->
			<div class="col-md-3 p-3">
				<img alt="" style="width: 100%;" src="images/singledoc5.jpg">
			</div>
		</div>
	</div>

	<% } %>
</body>
</html>