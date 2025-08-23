<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@ include file="components/allcss.html"%>

</head>
<body>
	<%
		User userObj = (User) session.getAttribute("userObj");
		if(userObj == null){
			response.sendRedirect("user_login.jsp");
		} else {
	%>

	<!-- navbar -->
	<%@ include file="components/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-4">
				<img alt="" style="width: 100%; height: 38rem; object-fit: cover; object-position: top" src="images/singledoc5.jpg">
			</div>
			<div class="col-md-6 p-4">
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
						<h3 class="card-title text-center mb-4">User Appointment</h3>
						<form class="row g-3" action="AppointmentServlet" method="post">
							
							<input type="hidden" name="userId" value="<%= userObj.getId() %>">

							<div class="col-md-6">
								<label class="form-label">Full Name</label>
								<input type="text" class="form-control" name="name" required="required">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Gender</label>
								<select class="form-control" name="gender" required="required">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Age</label>
								<input type="number" class="form-control" name="age" required="required">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Appointment Date</label>
								<input type="date" class="form-control" name="apt_date" id="apt_date" required="required">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Email</label>
								<input type="email" class="form-control" name="email" required="required">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Phome Number</label>
								<input type="tel" class="form-control" name="ph_number" required="required">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Desease</label>
								<input type="text" class="form-control" name="disease" required="required">
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Doctor</label>
								<select class="form-control" name="doctor">
									<option>--select--</option>
									<%
									DoctorDao docDao = new DoctorDao(DBconnect.getConn());
									List<Doctor> doctors = docDao.getAll();
									for(Doctor doctor : doctors){
									%>	
										<option value="<%= doctor.getId() %>"><%= doctor.getFullName() %> (<%= doctor.getSpecialist() %>)</option>	
									<%	
									}
									%>
									
								</select>
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Full address</label>
								<textarea rows="3" class="form-control" name="address" required></textarea>
							</div>
							
							<button type="submit" class="col-md-6 offset-md-3 btn btn-success">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="components/footer.html" %>
	
	<!-- its for else block of userObj check -->
	<% } %>
	
	<script>
		const today = new Date().toISOString().split("T")[0];
		document.getElementById("apt_date").setAttribute("min", today);
	</script>
</body>
</html>