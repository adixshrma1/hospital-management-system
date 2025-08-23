<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<%@ include file="components/allcss.html"%>
</head>
<body>
	<%
	if (session.getAttribute("userObj") == null) {
		response.sendRedirect("user_login.jsp");
	} else {
	%>

	<%@ include file="components/navbar.jsp"%>

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

						<h5 class="card-title text-center">Change Password</h5>

						<form action="ChangePassword" method="post">
							<div class="mb-3">
								<label class="form-label">Old Password</label>
								<input type="text" name="old_pass" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">New Password</label>
								<input type="text" name="new_pass" class="form-control">
							</div>
							
							<input type="hidden" name="userId" value="<%= user.getId() %>">
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<% } %>
</body>
</html>