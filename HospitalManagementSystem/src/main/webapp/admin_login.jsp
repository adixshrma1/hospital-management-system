<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="components/allcss.html" %>
</head>
<body>
	<!-- navbar -->
	<%@ include file="components/navbar.jsp" %>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card shadow" >
					<div class="card-body">
						
						<h5 class="card-title text-center">Admin Login</h5>
						<form action="AdminLogin" method="post">
							<div class="mb-3">
								<label for="email">Email Address</label>
								<input type="email" name="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Password</label>
								<input type="password" name="password" class="form-control" required>
							</div>
							<button type="submit" class="btn col-md-12 bg-success text-white">Login</button>
							
							<!-- wrong password message -->
							<% if(session.getAttribute("isLogin") == "false") { 
								session.removeAttribute("isLogin");
							%>
								<p class="text-danger mt-3">Wrong email or password.</p>
							<% } %>
							
							<!-- logut successful message -->
							<% if(session.getAttribute("adminLogout") == "true"){
								session.removeAttribute("adminLogout");	
							%>
								<p class="text-success mt-3">Logout Successfully</p>
							<% } %>
						</form>
						
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>