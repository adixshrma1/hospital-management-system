
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.CountDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- for prevention of back button login -->
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">


<title>Index Page</title>
<%@ include file="../components/allcss.html"%>
</head>
<body>
	<%
	// prevent back button
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // http 1.1
	response.setHeader("Pragma", "no-cache"); // http 1.0
	response.setHeader("Expires", "0"); // Proxies

	if (session.getAttribute("adminObj") == null) {
		response.sendRedirect("../admin_login.jsp");
	} else {
	%>



	<%@ include file="navbar.jsp"%>

	<%
	CountDao dao = new CountDao(DBconnect.getConn());
	%>

	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		<!-- grid -->
		<div class="row g-3">
			<!-- cards -->
			<div class="col-md-4">
				<div class="card shadow">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user-doctor fa-3x"></i> <br>
						<p class="card-text fs-4">
							Doctor <br>
							<%=dao.countDoctors()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card shadow">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-circle-user fa-3x"></i> <br>
						<p class="card-text fs-4">
							User <br>
							<%=dao.countUsers()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card shadow">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-calendar fa-3x"></i> <br>
						<p class="card-text fs-4">
							Total Appointment <br>
							<%=dao.countAppointments()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 cursor-pointer" data-bs-toggle="modal"
				data-bs-target="#specialistModal">
				<div class="card shadow">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-calendar fa-3x"></i> <br>
						<p class="card-text fs-4">
							Specialist <br>
							<%=dao.countSpecialists()%>
						</p>
					</div>
				</div>

				<!-- error message -->
				<%
				if (session.getAttribute("isAdded") == "false") {
					session.removeAttribute("isAdded");
				%>
				<p class="text-danger">Error occured</p>
				<%
				} else if (session.getAttribute("isAdded") == "true") {
				session.removeAttribute("isAdded");
				%>
				<p class="text-success">Added successfully</p>
				<%
				}
				%>
			</div>
			<!-- card end -->
		</div>
		<!-- grid row end -->

	</div>
	<!-- container end -->

	<!-- Modal for Popup -->
	<!-- Modal -->
	<div class="modal fade" id="specialistModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Add
						Specialist</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../AddSpecialist" method="post">
						<div class="mb-3">
							<label class="form-label">Enter Specialist name:</label> <input
								type="text" name="name" class="form-control">
						</div>
						<button type="submit" class="btn btn-primary">Add</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal ends -->
	
	<% } %>
</body>
</html>