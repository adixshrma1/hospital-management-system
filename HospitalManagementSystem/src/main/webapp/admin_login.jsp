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
						<form action="" method="post">
							<div class="mb-3">
								<label for="email">Email Address</label>
								<input type="email" name="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Password</label>
								<input type="password" name="password" class="form-control" required>
							</div>
							<button type="button" class="btn col-md-12 bg-success text-white">Login</button>
						</form>
						
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>