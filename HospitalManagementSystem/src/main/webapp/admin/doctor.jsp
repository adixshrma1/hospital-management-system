
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
<title>Insert title here</title>
<%@ include file="../components/allcss.html"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<!-- grid start -->
		<div class="row">
			<!-- left section -->
			<div class="col-md-4">
				<div class="card shadow">
					<div class="card-body">
						<!-- showing a success/failure message -->
						<%
						if (session.getAttribute("isAdded") == "true") {
							session.removeAttribute("isAdded");
						%>
						<p class="text-success">doctor added successfully</p>
						<%
						} else if (session.getAttribute("isAdded") == "false") {
						session.removeAttribute("isAdded");
						%>
						<p class="text-danger">something went wrong</p>
						<%
						}
						%>


						<h5 class="card-title text-center">Add Doctor</h5>
						<form action="../AddDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									class="form-control" name="name" aria-describedby="emailHelp" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input
									type="date" name="dob" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required>
									<option value="">--select--</option>

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
									name="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input
									type="number" name="mobNumber" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" name="password" class="form-control" required>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
			<!-- right section -->
			<div class="col-md-8">
				<div class="card shadow">
					<div class="card-body">
						
						<!-- showing a success/failure message -->
						<%
						if (session.getAttribute("isUpdated") == "true") {
							session.removeAttribute("isUpdated");
						%>
						<p class="text-success">doctor updated successfully</p>
						<%
						} else if (session.getAttribute("isUpdated") == "false") {
						session.removeAttribute("isUpdated");
						%>
						<p class="text-danger">something went wrong</p>
						<%
						}
						%>
						
						<h5 class="card-title text-center">Doctor Details</h5>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualifications</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No.</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									DoctorDao docDao = new DoctorDao(DBconnect.getConn());
									List<Doctor> doctors = docDao.getAll();
									
									for(Doctor doc : doctors){
								%>
									<tr>
										<td><%= doc.getFullName() %></td>
										<td><%= doc.getDob() %></td>
										<td><%= doc.getQualification() %></td>
										<td><%= doc.getSpecialist() %></td>
										<td><%= doc.getEmail() %></td>
										<td><%= doc.getMobNumber() %></td>
										<td>
											<a href="edit_doctor.jsp?id=<%= doc.getId() %>" class="btn btn-sm btn-primary">Edit</a>
											<a href="#" class="btn btn-sm btn-danger">Delete</a>
										</td>
									</tr>
								<%	} %>
								
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- grid end -->
	</div>
</body>
</html>