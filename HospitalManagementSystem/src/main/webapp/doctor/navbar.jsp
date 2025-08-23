
<%@page import="com.entity.Doctor"%>
<% 
	Doctor doc = (Doctor) session.getAttribute("doctorObj");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-hospital"></i> MEDCORE</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="patient.jsp">Patient</a></li>
			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-circle-user"></i>
						<%= doc.getFullName() %>
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
						<li><a class="dropdown-item" href="../DoctorLogout">Logout</a></li>
					</ul>
				</div>
			</form>


		</div>
	</div>
</nav>