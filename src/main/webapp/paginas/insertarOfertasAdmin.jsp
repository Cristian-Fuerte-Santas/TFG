<%@ page isErrorPage="true"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!--  Directivas  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>insertarOfertasAdmin</title>

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


	<h3 align="center" class="mt-4">MENÚ ADMIN</h3>

	<div id="menuAdmin" class="container-fluid mt-2">

		<nav class="navbar navbar-expand-lg navbar-light bg-light ">

			<div class="collapse navbar-collapse" id="navbarNav">

				<ul class="navbar-nav justify-content-between w-100">

					<li id="menuAdminGestionarUsuarios" class="nav-item active"><a
						class="nav-link" href="gestionarUsuariosAdmin">Gestionar
							Usuarios</a></li>

					<li id="menuAdminInsertarOfertas" class="nav-item"><a
						class="nav-link" href="insertarOfertasAdmin">Insertar Ofertas</a></li>

					<li id="menuAdminActualizarOfertas" class="nav-item"><a
						class="nav-link" href="actualizarOfertasAdmin">Actualizar
							Ofertas</a></li>

					<li id="menuAdminBorrarOfertas" class="nav-item"><a
						class="nav-link" href="borrarOfertasAdmin">Borrar Ofertas</a></li>

					<li id="menuAdminInsertarDestino" class="nav-item"><a
						class="nav-link" href="insertarDestinoAdmin">Insertar Destino</a></li>


				</ul>
			</div>
		</nav>



	</div>


	<h2>INSERTAR HOTEL ADMIN</h2>
	<div id="insertarHotelAdmin" class="container-fluid w-100">


		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">


				<form:form id="formularioInsertarHotel" class="form-signin mt-5"
					align="center" modelAttribute="hotel" method="POST"
					action="insertarHotel" enctype="multipart/form-data">

					<h2 align="center">INSERTAR HOTEL</h2>

					<form:hidden path="idHotel" id="idHotel"></form:hidden>

					<label for="inputNombreHotel">Nombre del Hotel</label>
					<form:input path="nombreHotel" type="text" id="inputNombreHotel"
						class="form-control" placeholder="Hotel Example" required="true"></form:input>

					<label for="inputCategoriaHotel">Categoría del Hotel</label>
					<form:input path="categoriaHotel" type="number"
						id="inputCategoriaHotel" class="form-control" placeholder="4"
						required="true"></form:input>

					<label for="inputAforoHotel">Aforo del Hotel</label>
					<form:input path="aforoHotel" type="number" id="inputAforoHotel"
						class="form-control" placeholder="200" required="true"></form:input>

					<label for="inputDireccionHotel">Dirección del Hotel</label>
					<form:input path="direccionHotel" type="text"
						id="inputDireccionHotel" class="form-control"
						placeholder="Calle Ejemplo 123" required="true"></form:input>

					<label for="inputPrecioHotel">Precio del Hotel</label>
					<form:input path="precioHotel" type="number" step="0.01"
						id="inputPrecioHotel" class="form-control" placeholder="100.00"
						required="true"></form:input>


				<label for="inputImagenesHotel">Imágenes del Hotel</label>
				<input type="file" name="multipartFiles" id="inputImagenesHotel" class="form-control" multiple="true" />


					<div class="form-check">
						<label class="form-check-label"> <form:checkbox
								path="piscinaHotel" class="form-check-input" /> Piscina
						</label>
					</div>

					<div class="form-check">
						<label class="form-check-label"> <form:checkbox
								path="gimnasioHotel" class="form-check-input" /> Gimnasio
						</label>
					</div>

					<div class="form-check">
						<label class="form-check-label"> <form:checkbox
								path="terrazaHotel" class="form-check-input" /> Terraza
						</label>
					</div>

					<div class="form-check">
						<label class="form-check-label"> <form:checkbox
								path="spaHotel" class="form-check-input" /> Spa
						</label>
					</div>

					<button class="btn btn-lg btn-primary btn-block mt-2" type="submit">INSERTAR
						NUEVO HOTEL</button>
				</form:form>





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




</body>

</html>