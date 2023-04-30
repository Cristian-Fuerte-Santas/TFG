<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  Directivas  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>gestionarOfertasAdmin</title>

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
						class="nav-link" href="gestionarOfertasAdmin">Gestionar
							Ofertas</a></li>



					<li id="menuAdminInsertarDestino" class="nav-item"><a
						class="nav-link" href="insertarDestinoAdmin">Gestionar
							Destinos</a></li>


				</ul>
			</div>
		</nav>

	</div>





	<!-- Restaurante -->
	<div id="verRestaurantesAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
				<h2 >LISTADO DE RESTAURANTES</h2>
				<table id="tablaRestaurantes"
					class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Nombre del Restaurante</th>
							<th>Tipo de Restaurante</th>
							<th>Categoría del Restaurante</th>
							<th>Dirección del Restaurante</th>
							<th>Aforo del Restaurante</th>
							<th>Destino del Restaurante</th>
							<th>Imagenes del Restaurante</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${restaurantes}" var="restaurante">
							<tr>
								<td>${restaurante.nombreRestaurante}</td>
								<td>${restaurante.tipoRestaurante}</td>
								<td>${restaurante.categoriaRestaurante}</td>
								<td>${restaurante.direccionRestaurante}</td>
								<td>${restaurante.aforoRestaurante}</td>
								<td>${restaurante.destino.ciudad}</td>
								
								<td>${restaurante.listadoImagenesRestaurante}</td>
								<td>
									<form action="borrarRestaurante" method="post">
										<input type="hidden" name="idRestaurante"
											value="${restaurante.idRestaurante}" />
										<button type="submit" class="btn btn-danger">Borrar
											Restaurante</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Hoteles-->
	<div id="verHotelesAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
				<h2 >LISTADO DE HOTELES</h2>
				<table id="tablaHoteles" class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Nombre del Hotel</th>
							<th>Categoría del Hotel</th>
							<th>Piscina del Hotel</th>
							<th>Gimnasio del Hotel</th>
							<th>Terraza del Hotel</th>
							<th>Spa del Hotel</th>
							<th>Aforo del Hotel</th>
							<th>Dirección del Hotel</th>
							<th>Precio del Hotel</th>
							<th>Imagenes del Hotel</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${hoteles}" var="hotel">
							<tr>
								<td>${hotel.nombreHotel}</td>
								<td>${hotel.categoriaHotel}</td>
								<td>${hotel.piscinaHotel}</td>
								<td>${hotel.gimnasioHotel}</td>
								<td>${hotel.terrazaHotel}</td>
								<td>${hotel.spaHotel}</td>
								<td>${hotel.aforoHotel}</td>
								<td>${hotel.direccionHotel}</td>
								<td>${hotel.precioHotel}</td>
								<td>${hotel.listadoImagenesHotel}</td>
								<td>
									<form action="borrarHotel" method="post">
										<input type="hidden" name="idHotel" value="${hotel.idHotel}" />
										<button type="submit" class="btn btn-danger">Borrar
											Hotel</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>




	<!-- Sala hotel-->
	<div id="verSalasHotelAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
				<h2 >LISTADO DE SALAS DE HOTEL</h2>
				<table id="tablaSalasHotel" class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Nombre de la Sala</th>
							<th>Hotel al que pertenece</th>
							<th>Aforo de la Sala</th>
							<th>Metros de la Sala</th>
							<th>Equipo Sonido de la Sala</th>
							<th>Proyector de la Sala</th>
							<th>Imagenes de la Sala</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${salashoteles}" var="sala">
							<tr>
								<td>${sala.nombreSala}</td>
								<td>${sala.hotel.nombreHotel}</td>
								<td>${sala.aforoSala}</td>
								<td>${sala.metrosSala}</td>
								<td>${sala.equipoSonidoSala}</td>
								<td>${sala.proyectorSala}</td>
								<td>${sala.listadoImagenesSalaHotel}</td>
								
								<td>
									<form action="borrarSalaHotel" method="post">
										<input type="hidden" name="idSala" value="${sala.idSalaHotel}" />
										<button type="submit" class="btn btn-danger">Borrar
											Sala</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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