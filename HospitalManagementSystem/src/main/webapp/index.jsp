<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>

<!-- bootstrap css -->
<%@ include file="components/allcss.html"%>

<style>
.right-doc {
	width: 100%;
	height: 20rem;
	object-fit: cover;
	object-position: top;
	border-radius: 5px;
}
</style>

</head>
<body>
	<!-- navbar -->
	<%@ include file="components/navbar.jsp"%>

	<!-- Carousal -->
	<div id="carouselExample" class="carousel slide" style="height: 500px">
		<div class="carousel-inner" style="height: 500px">
			<div class="carousel-item active">
				<img src="./images/doctors.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="./images/docs_lab.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="./images/docs_surgery.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExample" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExample" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container">
		<h2 class="text-center mt-5 mb-3">Key Features of our Hospital</h2>
		<!-- parent grid -->
		<div class="row">
			<div class="col-md-8 p-5">
				<!-- child grid -->
				<div class="row row-cols-md-2 gy-3">
					<div class="col">
						<div class="card">
							<div class="card-body shadow">
								<h5 class="card-title">100% safety</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card’s content.</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card">
							<div class="card-body shadow">
								<h5 class="card-title">Clean Environment</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card’s content.</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card">
							<div class="card-body shadow">
								<h5 class="card-title">Friendly Doctors</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card’s content.</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card">
							<div class="card-body shadow">
								<h5 class="card-title">Medical Research</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card’s content.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 p-3">
				<img alt="" class="right-doc shadow" style=""
					src="./images/doctor_vertical.jpg" />
			</div>
		</div>
		
		<hr class="mt-3">
		
	</div>


	<!-- Our Team  -->
	<div class="container p-3 text-center mb-5">
		<h2 class="mb-5">Our Team</h2>
		<div class="row">
			<div class="col">
				<div class="card shadow" style="width: 18rem;">
					<img src="./images/singledoc1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Dr. Elli Avram</h5>
						<p class="card-text">(Heart Specialist)</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card shadow" style="width: 18rem;">
					<img src="./images/singledoc2.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Dr. Jordi Polo</h5>
						<p class="card-text">(Orthopaedician)</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card shadow" style="width: 18rem;">
					<img src="./images/singledoc3.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Dr. Katrina Jade</h5>
						<p class="card-text">(Sexologist)</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card shadow" style="width: 18rem;">
					<img src="./images/singledoc4.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Dr. Rahul Khanna</h5>
						<p class="card-text">(Dentist)</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- footer -->
	<%@ include file="components/footer.html"%>
</body>
</html>