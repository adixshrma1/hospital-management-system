<%@page import="com.entity.User"%>

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
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<%
				User user = (User) session.getAttribute("userObj");
				if (user != null) {
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="user_appointment.jsp">Appointment</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="view_appointment.jsp">View Appointment</a></li>

				<div class="dropdown">
					<button class="btn btn-success  dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-circle-user"></i> <%=user.getFullname()%>
						</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
						<li><a class="dropdown-item" href="UserLogout">Logout</a></li>
					</ul>
				</div>

				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="admin_login.jsp">Admin</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="doctor_login.jsp">Doctor</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="user_login.jsp"><i
						class="fa-solid fa-right-to-bracket"></i> User</a></li>
				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>