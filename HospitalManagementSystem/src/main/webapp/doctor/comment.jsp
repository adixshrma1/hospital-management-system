<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comments</title>
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
			<div class="col-md-6 offset-md-3">
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
					
					
						<h4 class="card-title text-center">Patient Comment</h4>
						
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							AppointmentDao apDao = new AppointmentDao(DBconnect.getConn());
							Appointment apt = apDao.getAppointmentById(id);
						%>
						
						<form class="row" action="../UpdateStatus" method="post">
							<div class="col-md-6">
								<label class="form-label">Name</label>
								<input type="text" class="form-control" readonly="readonly" value="<%= apt.getFullName() %>">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Age</label>
								<input type="text" class="form-control" readonly="readonly" value="<%= apt.getAge() %>">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Mobile Number</label>
								<input type="text" class="form-control" readonly="readonly" value="<%= apt.getPhNo() %>">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Disease</label>
								<input type="text" class="form-control" readonly="readonly" value="<%= apt.getDisease() %>">
							</div>
							
							<div class="col-md-12">
								<label class="form-label">Comment</label>
								<textarea cols="3" class="form-control" name="comment" required></textarea>
							</div>
							
							<input type="hidden" name="id" value="<%= apt.getId() %>">
							
							<button type="submit" class="btn btn-primary mt-3 col-md-6 offset-md-3">Submit</button>
						</form>
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