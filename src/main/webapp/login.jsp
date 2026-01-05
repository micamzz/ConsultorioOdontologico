<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login - Alvarenga Gonzalez</title>

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">

 <!-- Link css  
    <link href="css/style.css?v=2" rel="stylesheet">  -->
    
</head>

<body class="bg-gradient-primary">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-7 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<div class="row justify-content-center">
							<div class="col-lg-10">
								<div class="p-5">

									<%-- Mensaje de inicio --%>
									<div class="text-center mb-4">
										<div class="icon-circle bg-primary text-white mx-auto mb-3"
											style="width: 3rem; height: 3rem; display: flex; align-items: center; justify-content: center;">
											<i class="fas fa-tooth"></i>
										</div>

										<h1 class="h5 text-gray-800">Bienvenido  </h1>
											 <p class="text-primary">Consultorio Odontológico | Alvarenga Gonzalez</p>
									</div>


									<%-- Mensaje de error si falla el ingreso --%>
									<% String error = request.getParameter("error");
                                       if (error != null) { %>
									<div class="alert alert-danger text-center small shadow-sm"
										role="alert">
										<i class="fas fa-times-circle mr-1"></i> Usuario o contraseña
										incorrectos
									</div>
									<% } %>

									<form class="user" action="SvLogin" method="POST">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="usuario" name="usuario"
												placeholder="Nombre de usuario..." required>
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="contrasenia" name="contrasenia"
												placeholder="Contraseña..." required>
										</div>

										<button type="submit"
											class="btn btn-primary btn-user btn-block shadow">
											<i class="fas fa-sign-in-alt mr-1"></i> Ingresar
										</button>
									</form>
									<hr>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="js/sb-admin-2.min.js"></script>
</body>
</html>