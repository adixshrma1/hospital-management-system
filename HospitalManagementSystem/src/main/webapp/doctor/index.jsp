<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.CountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../components/allcss.html"%>
</head>
<body>
	<%
	if (session.getAttribute("doctorObj") == null) {
		response.sendRedirect("../doctor_login.jsp");
	} else {
	%>
	
	<%
	CountDao dao = new CountDao(DBconnect.getConn());
	%>

	<%@ include file="navbar.jsp"%>
	<h3 class="text-center my-4">Doctor Dashboard</h3>

	<div class="container p-5">
		<div class="row text-success">
			<!-- left -->
			<div class="col-md-4 offset-md-2">
				<div class="card shadow ">
					<div class="card-body text-center">
						<i class="fa-solid fa-user-doctor fa-3x"></i>
						<p class="fs-4">Doctors <br> <%= dao.countDoctors() %></p>
					</div>
				</div>
			</div>
			<!-- right -->
			<div class="col-md-4">
				<div class="card shadow ">
					<div class="card-body text-center">
						<i class="fa-regular fa-calendar-check fa-3x"></i>
						<p class="fs-4">Total Appointment <br> <%= dao.countAppointmentsByDoctorId(doc.getId()) %></p>
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