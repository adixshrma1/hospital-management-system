<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="../components/allcss.html"%>
</head>
<body>
	<%
	if (session.getAttribute("doctorObj") == null) {
		response.sendRedirect("../doctor_login.jsp");
	} else {
	%>

	<%@ include file="navbar.jsp"%>
	<div class="container p-4">
		<div class="row">

			<!-- left portion -->
			<div class="col-md-4">
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

						<p class="fs-3 card-title text-center">Change Password</p>
						<form action="../DoctorPasswordChange" method="post">
							<div class="mb-3">
								<label class="form-label">Old Password</label> <input
									type="text" name="old_pass" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">New Password</label> <input
									type="text" name="new_pass" class="form-control">
							</div>

							<input type="hidden" name="id" value="<%=doc.getId()%>">

							<button type="submit"
								class="btn btn-primary btn-success col-md-12">Submit</button>
						</form>

					</div>
				</div>
			</div>
			<!-- left end -->

			<!-- right start -->
			<div class="col-md-8">
				<div class="card shadow">
					<div class="card-body">
					
						<%
						if (session.getAttribute("successMsg1") != null) {
						%>
						<p class="text-success"><%=session.getAttribute("successMsg1")%></p>
						<%
						session.removeAttribute("successMsg1");
						} else if (session.getAttribute("errorMsg1") != null) {
						%>
						<p class="text-danger"><%=session.getAttribute("errorMsg1")%></p>
						<%
						session.removeAttribute("errorMsg1");
						}
						%>
					
						<h4 class="card-title text-center">Edit Profile</h4>
						<form action="../EditProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									class="form-control" name="name" value="<%=doc.getFullName()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input
									type="date" name="dob" class="form-control"
									value="<%=doc.getDob()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" class="form-control"
									value="<%=doc.getQualification()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" class="form-control">
									<option><%=doc.getSpecialist()%></option>

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
									class="form-control" value="<%=doc.getEmail()%>" readonly>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input
									type="number" name="mobNumber" class="form-control"
									value="<%=doc.getMobNumber()%>">
							</div>

							<input type="hidden" name="id" value="<%=doc.getId()%>">

							<button type="submit"
								class="btn btn-primary btn-success col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
			<!-- right end -->
		</div>
	</div>

	<%
	}
	%>
</body>
</html>