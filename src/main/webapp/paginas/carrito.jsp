<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Carrito</title>

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

#imagenCabecera {
	max-height: 200px;
	margin-top: -65px;
	margin-bottom: -60px;
}
</style>

</head>

<body class="d-flex flex-column min-vh-100 m-0 p-0">


	<!-- CABECERA-->
	<h2 align="center" class="m-0"></h2>

	<div class="row bg-light">

		       
		<div class="col-12 text-center mt-3 mb-2">

			            <img id="imagenCabecera" alt="" width=100%
				src="/imagenes/header.png">        
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

				<li class="nav-item"><a href="/redireccionUsuario"
					class="nav-link btn btn-primary"> <img
						src="recursos/Bootstrap/bootstrap-icons-1.10.4/person-fill.svg"
						alt="Bootstrap" width="40" height="32">
				</a></li>

			</ul>
		</div>
	</nav>


	<div id="divDelCarrito" class="container-fluid w-75">

		<h1 align=center class="mt-3">TU CARRITO</h1>
		<!-- Hoteles en el carrito -->
		<div class="row mt-5">
			<div class="col-sm-12 col-md-8">
				<h3>Hoteles:</h3>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Precio</th>
							<th>Categoría Hotel</th>
							<th>Piscina Hotel</th>
							<th>Gimnasio Hotel</th>
							<th>Terraza Hotel</th>
							<th>Spa Hotel</th>
							<th>Aforo Hotel</th>
							<th>Dirección Hotel</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${carritoTemporal}" var="item">
							<c:if
								test="${item.getClass().getName() eq 'com.tfg.imf.entidades.Hotel'}">
								<tr>
									<td>${item.nombreHotel}</td>
									<td>${item.precioHotel}</td>
									<td>${item.categoriaHotel}</td>
									<td>${item.piscinaHotel}</td>
									<td>${item.gimnasioHotel}</td>
									<td>${item.terrazaHotel}</td>
									<td>${item.spaHotel}</td>
									<td>${item.aforoHotel}</td>
									<td>${item.direccionHotel}</td>
									<td>
										<form action="/eliminarDelCarrito" method="post">
											<input type="hidden" name="itemId" value="${item.idHotel}" />
											<button type="submit" class="btn btn-danger">Eliminar
												del carrito</button>
										</form>
									</td>
									<td>
										<form action="/confirmarReserva" method="post">
											<!-- Formulario para Confirmar Reserva -->
											<input type="hidden" name="itemId" value="${item.idHotel}" />
											<button type="submit" class="btn btn-success">Confirmar
												Reserva</button>
										</form>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!--  Salas Hotel en Carrito -->
		<div class="row mt-5">
			<div class="col-sm-12 col-md-8">

				<h3>Salas de Hotel:</h3>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Precio</th>
							<th>Aforo Sala</th>
							<th>Metros Sala</th>
							<th>Equipo Sonido Sala</th>
							<th>Proyector Sala</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${carritoTemporal}" var="item">
							<c:if
								test="${item.getClass().getName() eq 'com.tfg.imf.entidades.SalaHotel'}">
								<tr>
									<td>${item.nombreSala}</td>
									<td>${item.precioSala}</td>
									<td>${item.aforoSala}</td>
									<td>${item.metrosSala}</td>
									<td>${item.equipoSonidoSala}</td>
									<td>${item.proyectorSala}</td>
									<td>
										<form action="/eliminarDelCarrito" method="post">
											<input type="hidden" name="itemId"
												value="${item.idSalaHotel}" />
											<button type="submit" class="btn btn-danger">Eliminar
												del carrito</button>
										</form>
									</td>
									<td>
										<form action="/confirmarReserva" method="post">
											<!-- Formulario para Confirmar Reserva -->
											<input type="hidden" name="itemId"
												value="${item.idSalaHotel}" />
											<button type="submit" class="btn btn-success">Confirmar
												Reserva</button>
										</form>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Restaurante en carrito -->
		<div class="row mt-5">
			<div class="col-sm-12 col-md-8">

				<h3>Restaurantes:</h3>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Nombre Restaurante</th>
							<th>Precio Menú Normal</th>
							<th>Precio Menú Vegetariano</th>
							<th>Precio Menú Vegano</th>
							<th>Precio Menú Celiaco</th>
							<th>Acción</th>

							<th></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${carritoTemporal}" var="item">
							<c:if
								test="${item.getClass().getName() eq 'com.tfg.imf.entidades.Restaurante'}">
								<tr>
									<td>${item.nombreRestaurante}</td>
									<td>${item.menusRestaurante[0].precioMenuNormal}</td>
									<td>${item.menusRestaurante[0].precioMenuVegetariano}</td>
									<td>${item.menusRestaurante[0].precioMenuVegano}</td>
									<td>${item.menusRestaurante[0].precioMenuCeliaco}</td>

									<td>
										<form action="/eliminarDelCarrito" method="post">
											<input type="hidden" name="itemId"
												value="${item.idRestaurante}" />
											<button type="submit" class="btn btn-danger">Eliminar
												del carrito</button>
										</form>
									</td>
									<td>
										<form action="/confirmarReserva" method="post">
											<!-- Formulario para Confirmar Reserva -->
											<input type="hidden" name="itemId"
												value="${item.idRestaurante}" />
											<button type="submit" class="btn btn-success">Confirmar
												Reserva</button>
										</form>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>



		<!-- Actividades en carrito -->
		<div class="row mt-5">
			<div class="col-sm-12 col-md-8">
				<h3>Actividades:</h3>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Precio</th>
							<th>Aforo</th>
							<th>Dirección</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${carritoTemporal}" var="item">
							<c:if
								test="${item.getClass().getName() eq 'com.tfg.imf.entidades.Actividad'}">
								<tr>
									<td>${item.nombreActividad}</td>
									<td>${item.precioActividad}</td>
									<td>${item.aforoActividad}</td>
									<td>${item.direccionActividad}</td>
									<td>
										<form action="/eliminarDelCarrito" method="post">
											<input type="hidden" name="itemId"
												value="${item.idActividad}" />
											<button type="submit" class="btn btn-danger">Eliminar
												del carrito</button>
										</form>
									</td>
									<td>
										<form action="/confirmarReserva" method="post">
											<!-- Formulario para Confirmar Reserva -->
											<input type="hidden" name="itemId"
												value="${item.idActividad}" />
											<button type="submit" class="btn btn-success">Confirmar
												Reserva</button>
										</form>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!--  Fuente: https://www.rapidtables.com/web/html/html-codes/html-code-euro.html -->

		<div id="precioTotalDiv" class="mb-5 mt-4" align="center"
			style="font-size: 44px; font-weight: bold;">
			PRECIO TOTAL: <span id="precioTotal"></span> &#8364;
		</div>

	</div>


	<!-- Footer-->
	<footer class="footer mt-auto py-3 mb-0">
		<div class="container" align="center">
			<span class="text-muted"> Gala Gallardo García Y Cristian
				Fuerte Santas</span>
		</div>
	</footer>

	<script>
		$(document).ready(function() {

			console.log('Id del usuario: ${sessionScope.idUsuario}');

			calcularPrecioTotal();

			function calcularPrecioTotal() {
				var precioTotal = 0;

				// Obtener todos los elementos de la tabla con el precio y sumarlos
				$("#divDelCarrito table tr").each(function() {
					var precio = $(this).find("td:eq(1)").text().trim(); // Obtener el texto del segundo td (columna del precio)
					precio = parseFloat(precio);

					if (!isNaN(precio)) {
						precioTotal += precio;
					}
				});

				// Actualizar el valor del precio total en el div
				$("#precioTotal").text(precioTotal.toFixed(2));
			}

		});
	</script>
</body>

</html>