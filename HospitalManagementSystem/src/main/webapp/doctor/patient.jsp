<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patients</title>
<%@ include file="../components/allcss.html"%>

</head>
<body>
	<%
	if (session.getAttribute("doctorObj") == null) {
		response.sendRedirect("../doctor_login.jsp");
	} else {
	%>

	<%@ include file="navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow">
					<div class="card-body">

						<%
						if (session.getAttribute("successMsg") != null) {
						%>
						<p class="text-success"><%=session.getAttribute("successMsg")%></p>
						<%
						session.removeAttribute("successMsg");
						} else if (session.getAttribute("errorMsg") != null) {
						%>
						<p class="text-danger"><%=session.getAttribute("errorMsg")%></p>
						<%
						session.removeAttribute("errorMsg");
						}
						%>

						<p class="fs-3 text-center">Patient Details</p>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Phone Number</th>
									<th scope="col">Disease</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
									AppointmentDao apDao = new AppointmentDao(DBconnect.getConn());
									List<Appointment> appointments = apDao.getAllAppointmentByDoctorId(doc.getId());
									for(Appointment ap : appointments){
								%>
								<tr>
									<td><%= ap.getFullName() %></td>
									<td><%= ap.getGender() %></td>
									<td><%= ap.getAge() %></td>
									<td><%= ap.getAptDate() %></td>
									<td><%= ap.getEmail() %></td>
									<td><%= ap.getPhNo() %></td>
									<td><%= ap.getDisease() %></td>
									<td><%= ap.getStatus() %></td>
									
									<%
									if(ap.getStatus().equals("pending")){
									%>
									<td>
										<a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-sm btn-success">comment</a>
									</td>
									<%
									} else {
									%>
									<td>
										<a href="" class="btn btn-sm btn-success disabled">comment</a>
									</td>
									<% } %>
									
									
								</tr>

								<% } %>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



	<% } %>
</body>
</html>