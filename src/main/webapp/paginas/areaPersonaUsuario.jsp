<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  Directivas  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>areaPersonalUsuario</title>

<!-- jQuery 3.6.4 -->
<script src="/recursos/jQuery3.6.4/jQuery3.6.4.js"></script>

<!-- Bootstrap 4.6.2 -->
<link rel="stylesheet"
	href="/recursos/Bootstrap/Bootstrap4.6.2/css/bootstrap.min.css">
<script src="/recursos/Bootstrap/Bootstrap4.6.2/js/bootstrap.min.js"></script>

<!-- fuente Ejemplos Bootraps: https://getbootstrap.com/docs/4.6/examples/ -->


<style>
html {
	overflow-x: hidden;
}

.container {
	width: auto;
	padding: 0px;
}

.footer {
	background-color: lightblue;
}

body {
	margin-bottom: 0;
}

#tituloEmpresa {
	font-size: 80px;
	color: blue;
}
</style>

</head>

<body class="d-flex flex-column min-vh-100 m-0 p-0">


	<!-- CABECERA-->
	<h2 align="center" class="m-0"></h2>

	<div class="row bg-light">
		<div class="col-12 text-center mt-3 mb-2">
			<h1 id="tituloEmpresa">AGENCIA X</h1>
		</div>
	</div>
	<!-- MENU NAVEGAION CABECERA-->

	<!-- Fuente del menu: https://getbootstrap.com/docs/4.6/components/navbar/     -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">


		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">

			<ul class="navbar-nav justify-content-between w-100">

				<li class="nav-item "><a class="nav-link" href="index.html">INICIO</a>
				</li>

				<li class="nav-item "><a class="nav-link"
					href="busquedaPersonalizada">BÚSQUEDA PERSONALIZADA</a></li>

				<li class="nav-item"><a class="nav-link" href="contacto">CONTACTO</a>
				</li>

				<li class="nav-item"><a class="nav-link" href="faq">FAQ</a></li>

				<li class="nav-item"><a id="iconoCarrito" href="carrito"> <img
						id="iconoCarrito"
						src="recursos/Bootstrap/bootstrap-icons-1.10.4/cart-fill.svg"
						alt="Bootstrap" width="32" height="32">
				</a></li>

				<li class="nav-item"><a href="loginYregistro"
					class=" nav-link btn btn-primary"><img
						src="recursos/Bootstrap/bootstrap-icons-1.10.4/person-fill.svg"
						alt="Bootstrap" width="40" height="32"></a></li>

			</ul>
		</div>
	</nav>


	<div class="container-fluid mt-5">
		<div class="row ">

			<!-- Menú lateral -->
			<div class="col-md-3 col-lg-3 ">
				<div class="d-flex flex-column flex-shrink-0 p-3 bg-light mt-0"
					style="width: 280px;">

					<h6 class="nav-header" align="center">MENÚ AREA PERSONAL</h6>

					<ul class="nav nav-pills flex-column mb-auto">

						<li id="menuMisDatosPersonales"
							class="nav-item nav-pills-item active"><a href="#"
							class="nav-link " aria-current="page"> <img
								src="recursos/Bootstrap/bootstrap-icons-1.10.4/person.svg"
								alt="Bootstrap" width="20" height="20"> Mis Datos
								Personales
						</a></li>

						<li id="menuMisReservas" class="nav-item nav-pills-item"><a
							href="#" class="nav-link link-dark"> <img
								src="recursos/Bootstrap/bootstrap-icons-1.10.4/calendar-check.svg"
								alt="Bootstrap" width="20" height="20"> Mis Reservas
						</a></li>



						<li id="botonCerrarSesion" align="center"><a
							class="btn btn-danger mt-5"> Cerrar Sesión </a></li>
					</ul>
				</div>
			</div>



			<!-- Contenido Mis Datos Personales -->
			<div id="contenidoMisDatosPersonales" class="col-md-9 col-lg-9 ">

				<div class="row">
					<div class="card w-75">
						<div class="card-body">
							<h5 class="card-title">Mis Datos Personales</h5>

							<form action="/actualizarDatosPersonales" method="POST">

								<div class="form-group">
									<label for="nombreEmpresa">Nombre de Empresa</label> <input
										type="text" class="form-control" name="nombreEmpresa"
										id="nombreEmpresa" value="${usuario.nombreEmpresa}" readonly
										style="color: black;">

								</div>
								<div class="form-group">
									<label for="nifEmpresa">NIF de Empresa</label> <input
										type="text" class="form-control" name="nifEmpresa"
										id="nifEmpresa" value="${usuario.nifEmpresa}" readonly
										style="color: black;">
								</div>
								<div class="form-group">
									<label for="nombreUsuario">Nombre de Usuario</label> <input
										type="text" class="form-control" name="nombreUsuario"
										id="nombreUsuario" value="${usuario.nombreUsuario}" readonly
										style="color: black;">
								</div>
								<div class="form-group">
									<label for="emailUsuario">Email de Usuario</label> <input
										type="text" class="form-control" name="emailUsuario"
										id="emailUsuario" value="${usuario.emailUsuario}" readonly
										style="color: black;">
								</div>
								<div class="form-group">
									<label for="telefonoUsuario">Teléfono de Usuario</label> <input
										type="text" class="form-control" name="telefonoUsuario"
										id="telefonoUsuario" value="${usuario.telefonoUsuario}"
										readonly style="color: black;">
								</div>
								<div class="form-group">
									<label for="contraseniaUsuario">Contraseña de Usuario</label> <input
										type="text" class="form-control" name="contraseniaUsuario"
										id="contraseniaUsuario" value="${usuario.contraseniaUsuario}"
										readonly style="color: black;">
								</div>
								<button type="button" class="btn btn-primary"
									id="actualizarBoton">Actualizar</button>
								<button type="submit" class="btn btn-primary"
									id="guardarCambiosBoton" style="display: none;">Guardar
									cambios</button>

							</form>
						</div>
					</div>
				</div>

			</div>


			<!-- Contenido Mis Reservas -->
			<div id="contenidoMisReservas" class="col-md-9 col-lg-9 d-none">

				<div class="row ">

					<div class="card w-75">

						<div class="card-body">

							<h5 class="card-title">Mis Reservas</h5>

							<form>

								<div class="form-group">
									<label for="nombreEmpresa">Reserva</label> <input type="text"
										class="form-control" id="nombreEmpresa">
								</div>

								<button type="submit" class="btn btn-danger">Cancelar
									Reserva</button>
							</form>
						</div>

					</div>

				</div>

			</div>

		</div>

	</div>


	<!-- Footer-->
	<footer class="footer mt-auto py-3 mb-0">
		<div class="container" align="center">
			<span class="text-muted"> Gala Gallardo García y Cristian
				Fuerte Santas</span>
		</div>
	</footer>



	<script>
		document.addEventListener('DOMContentLoaded', function() {
			document.getElementById('actualizarBoton').addEventListener(
					'click', habilitarEdicion);
		});

		//ACTUALIZAR DATOS PERSONALES
		function habilitarEdicion() {
			document.getElementById('nombreEmpresa')
					.removeAttribute('readonly');
			document.getElementById('nifEmpresa').removeAttribute('readonly');
			document.getElementById('nombreUsuario')
					.removeAttribute('readonly');
			document.getElementById('emailUsuario').removeAttribute('readonly');
			document.getElementById('telefonoUsuario').removeAttribute(
					'readonly');
			document.getElementById('contraseniaUsuario').removeAttribute(
					'readonly');

			// Ocultar el botón "Actualizar" y mostrar el botón "Guardar cambios"
			document.getElementById('actualizarBoton').style.display = 'none';
			document.getElementById('guardarCambiosBoton').style.display = 'inline-block';

			// Añadir el evento para resaltar los campos modificados en verde
			var inputs = document.querySelectorAll('input[type="text"]');
			inputs.forEach(function(input) {
				input.addEventListener('input', function() {
					this.style.backgroundColor = 'lightgreen';
				});
			});
		}

		$(document).ready(function() {

			function subrayarCategoriaSeleccionada(element) {

				$(".nav-pills-item").removeClass("active");

				$(element).addClass("active");

			}

			function mostrarDiv(element) {

				$(element).removeClass("d-none");

			}

			function esconderDivs(elements) {

				elements.forEach(function(element) {

					$(element).addClass("d-none");

				});
			}

			//MENU MIS DATOS PERSONALES
			$("#menuMisDatosPersonales").click(function() {

				subrayarCategoriaSeleccionada(this);

				mostrarDiv("#contenidoMisDatosPersonales");

				esconderDivs([ "#contenidoMisReservas", ]);

			});

			//MENU MIS RESERVAS
			$("#menuMisReservas").click(function() {

				subrayarCategoriaSeleccionada(this);

				mostrarDiv("#contenidoMisReservas");

				esconderDivs([ "#contenidoMisDatosPersonales" ]);

			});

			//CERRAR SESIÓN
			$("#botonCerrarSesion").click(function() {

				console.log("Has dado al boton de cerrar sesion");

			});

		});
	</script>
</body>

</html>