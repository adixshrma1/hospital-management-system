
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
<title>View Doctor</title>
<%@ include file="../components/allcss.html"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<!-- grid start -->
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow">
					<div class="card-body">

						<!-- showing a success/failure message -->
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

								for (Doctor doc : doctors) {
								%>
								<tr>
									<td><%=doc.getFullName()%></td>
									<td><%=doc.getDob()%></td>
									<td><%=doc.getQualification()%></td>
									<td><%=doc.getSpecialist()%></td>
									<td><%=doc.getEmail()%></td>
									<td><%=doc.getMobNumber()%></td>
									<td><a href="edit_doctor.jsp?id=<%=doc.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="../DeleteDoctor?id=<%=doc.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
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
		<!-- grid end -->
	</div>
</body>
</html>