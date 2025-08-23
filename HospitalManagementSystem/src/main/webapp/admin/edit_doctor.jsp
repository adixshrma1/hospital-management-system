
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%
if (session.getAttribute("adminObj") == null) {
	response.sendRedirect("../admin_login.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor</title>
<%@ include file="../components/allcss.html"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<!-- grid start -->
		<div class="row">
			<!-- left section -->
			<div class="col-md-6 offset-md-3">
				<div class="card shadow">
					<div class="card-body">
						<!-- showing a success/failure message -->
						<%
						if (session.getAttribute("isEdited") == "true") {
							session.removeAttribute("isEdited");
						%>
						<p class="text-success">doctor edited successfully</p>
						<%
						} else if (session.getAttribute("isEdited") == "false") {
							session.removeAttribute("isEdited");
						%>
						<p class="text-danger">something went wrong</p>
						<%
						}
						%>
						<!-- end -->
						
						<!-- doctor dao -->
						<%
						DoctorDao dao1 = new DoctorDao(DBconnect.getConn());
						int id = Integer.parseInt(request.getParameter("id"));
						Doctor doc = dao1.getById(id);
						%>
						<!-- doctor dao end -->

						<h5 class="card-title text-center">Edit Doctor</h5>
						<form action="../UpdateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text" 
									class="form-control" name="name" aria-describedby="emailHelp" value="<%= doc.getFullName() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input
									type="date" name="dob" class="form-control" value="<%= doc.getDob() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" class="form-control" value="<%= doc.getQualification() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required>
									<option><%= doc.getSpecialist() %></option>

									<%
									SpecialistDao dao = new SpecialistDao(DBconnect.getConn());
									List<Specialist> list = dao.getAll();

									for (Specialist s : list) {
									%>
									<option><%=s.getName()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									name="email" class="form-control" value="<%= doc.getEmail() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input
									type="number" name="mobNumber" class="form-control" value="<%= doc.getMobNumber() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="text" name="password" class="form-control" value="<%= doc.getPassword() %>" required>
							</div>
							
							<input type="hidden" name="id" value="<%= doc.getId() %>">
							
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- grid end -->
	</div>
</body>
</html>