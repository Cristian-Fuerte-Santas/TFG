<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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



	<h3 align="center" class="mt-4">MENÚ ADMIN</h3>

	<form action="/cerrarSesion" method="post" align="center">
		<button type="submit" class="btn btn-danger mt-2">Cerrar
			Sesión</button>
	</form>

	<!-- fuente Ejemplos Bootraps: https://getbootstrap.com/docs/4.6/examples/ -->

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



	<!--  VER LISTADO DE RESTAURANTES -->

	<div id="verRestaurantesAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 col-md-8 ">
				<h2>LISTADO DE RESTAURANTES</h2>
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
							<th>Acción</th>
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
								<td>
									<form action="borrarRestaurante" method="post">
										<input type="hidden" name="idRestaurante"
											value="${restaurante.idRestaurante}" />
										<button type="submit" class="btn btn-danger">Borrar
											Restaurante</button>
									</form>
								</td>
								<td>
									<form action="modificarRestauranteFormulario" method="get">
										<input type="hidden" name="idRestaurante"
											value="${restaurante.idRestaurante}" />
										<button type="button"
											class="btn btn-primary modificarRestauranteButton"
											data-idrestaurante="${restaurante.idRestaurante}">Modificar
											Restaurante</button>

									</form>
								</td>
							</tr>
							<tr>
								<td colspan="7"><c:forEach
										items="${restaurante.listadoImagenesRestaurante}" var="imagen">
										<img src="${imagen.urlImagenRestaurante}"
											alt="Imagen del restaurante"
											style="width: 100px; height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!--  MODAL DE MODIFICAR RESTAURANTE -->

	<div class="modal fade" id="modificarRestauranteModal" tabindex="-1"
		aria-labelledby="modificarRestauranteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificarRestauranteModalLabel">Modificar
						Restaurante</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form id="modificarRestauranteForm" action="modificarRestaurante"
						method="post" enctype="multipart/form-data">
						<input type="hidden" id="idRestaurante" name="idRestaurante" />

						<div class="form-group">
							<label for="nombreRestauranteModal">Nombre del
								Restaurante</label> <input type="text" id="nombreRestauranteModal"
								name="nombreRestaurante" class="form-control" />
						</div>

						<div class="form-group">
							<label for="tipoRestauranteModal">Tipo de Restaurante</label> <input
								type="text" id="tipoRestauranteModal" name="tipoRestaurante"
								class="form-control" />
						</div>

						<div class="form-group">
							<label for="categoriaRestauranteModal">Categoría del
								Restaurante</label> <input type="text" id="categoriaRestauranteModal"
								name="categoriaRestaurante" class="form-control" />
						</div>

						<div class="form-group">
							<label for="direccionRestauranteModal">Dirección del
								Restaurante</label> <input type="text" id="direccionRestauranteModal"
								name="direccionRestaurante" class="form-control" />
						</div>

						<div class="form-group">
							<label for="aforoRestauranteModal">Aforo del Restaurante</label>
							<input type="number" id="aforoRestauranteModal"
								name="aforoRestaurante" class="form-control" />
						</div>

						<div class="form-group">
							<label for="destinoIdModal">Destino del Restaurante</label> <select
								id="destinoIdModal" name="idDestino" class="form-control">
								<c:forEach var="destino" items="${listaDestinos}">
									<option value="${destino.idDestino}">${destino.ciudad}</option>
								</c:forEach>
							</select>
						</div>



						<div class="form-group">

							<label>Imágenes actuales:</label>
							<div id="imagenes-actuales-modal-restaurante"></div>

						</div>

						<input type="hidden" name="multipartFile" id="multipartFile">

						<div class="form-group">
							<label for="imagenesRestauranteModal">Subir Nuevas
								Imagenes a Este Restaurante</label> <input type="file"
								id="imagenesRestauranteModal" name="nuevasImagenesRestaurante"
								class="form-control" multiple />
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" id="botonCancelarModificacion"
						class="btn btn-warning" data-bs-dismiss="modal">Cancelar
						Modificación</button>
					<button type="button" id="botonHacerCambiosRestaurante"
						class="btn btn-primary">Hacer Modificación</button>
				</div>
			</div>
		</div>
	</div>


	<!--  VER LISTADO DE HOTELES -->

	<div id="verHotelesAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12  col-md-8 ">
				<h2>LISTADO DE HOTELES</h2>
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
							<th>Destino del Hotel</th>
							<th>Acción</th>
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
								<td>${hotel.destino.ciudad}</td>
								<td>
									<form action="borrarHotel" method="post">
										<input type="hidden" name="idHotel" value="${hotel.idHotel}" />
										<button type="submit" class="btn btn-danger">Borrar
											Hotel</button>
									</form>
								</td>
								<td>
									<form action="modificarHotelFormulario" method="get">
										<input type="hidden" name="idHotel" value="${hotel.idHotel}" />
										<button type="button"
											class="btn btn-primary modificarHotelButton"
											data-idhotel="${hotel.idHotel}">Modificar Hotel</button>

									</form>
								</td>
							</tr>
							<tr>
								<td colspan="10"><c:forEach
										items="${hotel.listadoImagenesHotel}" var="imagen">
										<img src="${imagen.urlImagenHotel}" alt="Imagen del hotel"
											style="width: 100px; height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!--  MODAL DE MODIFICAR HOTEL -->


	<div class="modal fade" id="modificarHotelModal" tabindex="-1"
		aria-labelledby="modificarHotelModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificarHotelModalLabel">Modificar
						Hotel</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="modificarHotelForm" action="modificarHotel" method="post"
						enctype="multipart/form-data">
						<input type="hidden" id="idHotel" name="idHotel" />

						<div class="form-group">
							<label for="nombreHotelModal">Nombre del Hotel</label> <input
								type="text" id="nombreHotelModal" name="nombreHotel"
								class="form-control" />
						</div>

						<div class="form-group">
							<label for="categoriaHotelModal">Categoría del Hotel</label> <input
								type="number" id="categoriaHotelModal" name="categoriaHotel"
								class="form-control" />
						</div>

						<div class="form-group form-check">
							<input type="checkbox" id="piscinaHotelModal" name="piscinaHotel"
								class="form-check-input" /> <label for="piscinaHotelModal"
								class="form-check-label">Piscina</label>
						</div>


						<div class="form-group form-check">

							<input type="checkbox" id="gimnasioHotelModal"
								name="gimnasioHotel" class="form-check-input" /> <label
								for="gimnasioHotelModal" class="form-check-label">Gimnasio</label>
						</div>

						<div class="form-group form-check">

							<input type="checkbox" id="terrazaHotelModal" name="terrazaHotel"
								class="form-check-input" /> <label for="terrazaHotelModal"
								class="form-check-label">Terraza</label>
						</div>

						<div class="form-group form-check">

							<input type="checkbox" id="spaHotelModal" name="spaHotel"
								class="form-check-input" /> <label for="spaHotelModal"
								class="form-check-label">Spa</label>
						</div>

						<div class="form-group">
							<label for="aforoHotelModal">Aforo del Hotel</label> <input
								type="number" id="aforoHotelModal" name="aforoHotel"
								class="form-control" />
						</div>

						<div class="form-group">
							<label for="direccionHotelModal">Direccion del Hotel</label> <input
								type="text" id="direccionHotelModal" name="direccionHotel"
								class="form-control" />
						</div>

						<div class="form-group">
							<label for="precioHotelModal">Precio del Hotel</label> <input
								type="number" step="0.01" id="precioHotelModal"
								name="precioHotel" class="form-control" />
						</div>

						<div class="form-group">
							<label for="destinoIdModal">Destino del Hotel</label> <select
								id="destinoIdModal" name="idDestino" class="form-control">
								<c:forEach var="destino" items="${listaDestinos}">
									<option value="${destino.idDestino}">${destino.ciudad}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">

							<label>Imágenes actuales:</label>
							<div id="imagenes-actuales-modal-hotel"></div>

						</div>

						<input type="hidden" name="multipartFile" id="multipartFile">

						<div class="form-group">
							<label for="imagenesHotelModal">Subir Nuevas Imagenes a
								Este Hotel</label> <input type="file" id="imagenesHotelModal"
								name="nuevasImagenesHotel" class="form-control" multiple />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="botonCancelarModificacion"
						class="btn btn-warning" data-bs-dismiss="modal">Cancelar
						Modificación</button>
					<button type="button" id="botonHacerCambiosHotel"
						class="btn btn-primary">Hacer Modificación</button>
				</div>

			</div>

		</div>
	</div>






	<!--  VER LISTADO DE SALAS HOTEL-->

	<div id="verSalasHotelAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12  col-md-8 ">
				<h2>LISTADO DE SALAS DE HOTEL</h2>
				<table id="tablaSalasHotel" class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Nombre de la Sala</th>
							<th>Hotel al que pertenece</th>
							<th>Aforo de la Sala</th>
							<th>Metros de la Sala</th>
							<th>Equipo Sonido de la Sala</th>
							<th>Proyector de la Sala</th>
							<th>Precio de la Sala</th>
							<th>Acción</th>
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
								<td>${sala.precioSala}</td>
								<td>
									<form action="borrarSalaHotel" method="post">
										<input type="hidden" name="idSala" value="${sala.idSalaHotel}" />
										<button type="submit" class="btn btn-danger">Borrar
											Sala Hotel</button>
									</form>
								</td>
								<td>
									<form action="modificarSalaHotelFormulario" method="get">
										<input type="hidden" name="idHotel"
											value="${sala.idSalaHotel}" />
										<button type="button"
											class="btn btn-primary modificarSalaHotelButton"
											data-idsalahotel="${sala.idSalaHotel}">Modificar
											Sala Hotel</button>


									</form>
								</td>
							</tr>
							<tr>
								<td colspan="7"><c:forEach
										items="${sala.listadoImagenesSalaHotel}" var="imagen">
										<img src="${imagen.urlImagenSalaHotel}"
											alt="Imagen de la sala" style="width: 100px; height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>





	<!--  MODAL DE MODIFICAR SALA DE HOTEL -->
	<div class="modal fade" id="modificarSalaHotelModal" tabindex="-1"
		aria-labelledby="modificarSalaHotelModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificarSalaHotelModalLabel">Modificar
						Sala de Hotel</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="modificarSalaHotelForm" action="modificarSalaHotel"
						method="post" enctype="multipart/form-data">
						<input type="hidden" id="idSalaHotel" name="idSalaHotel" />
						<div class="form-group">
							<label for="nombreSalaModal">Nombre de la Sala</label> <input
								type="text" id="nombreSalaModal" name="nombreSala"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="aforoSalaModal">Aforo de la Sala</label> <input
								type="number" id="aforoSalaModal" name="aforoSala"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="metrosSalaModal">Metros de la Sala</label> <input
								type="text" id="metrosSalaModal" name="metrosSala"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="equipoSonidoSalaModal">Equipo de Sonido</label> <input
								type="checkbox" id="equipoSonidoSalaModal"
								name="equipoSonidoSala" class="form-control" />
						</div>
						<div class="form-group">
							<label for="proyectorSalaModal">Proyector</label> <input
								type="checkbox" id="proyectorSalaModal" name="proyectorSala"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="precioSalaModal">Precio de la Sala</label> <input
								type="number" step="0.01" id="precioSalaModal" name="precioSala"
								class="form-control" />
						</div>

						<div class="form-group">
							<label>Imágenes actuales:</label>
							<div id="imagenes-actuales-modal-sala-hotel"></div>
						</div>
						<input type="hidden" name="multipartFile" id="multipartFile">
						<div class="form-group">
							<label for="imagenesSalaHotelModal">Subir Nuevas Imágenes
								a Esta Sala de Hotel</label> <input type="file"
								id="imagenesSalaHotelModal" name="nuevasImagenesSalaHotel"
								class="form-control" multiple />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="botonCancelarModificacion"
						class="btn btn-warning" data-bs-dismiss="modal">Cancelar
						Modificación</button>
					<button type="button" id="botonHacerCambiosSalaHotel"
						class="btn btn-primary">Hacer Modificación</button>
				</div>
			</div>
		</div>
	</div>






	<!--  VER LISTADO DE MENUS RESTAURANTES -->

	<div id="verMenusRestauranteAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12  col-md-8 ">
				<h2>LISTADO DE MENÚS DE RESTAURANTE</h2>
				<table id="tablaMenusRestaurante"
					class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Precio del Menú Normal</th>
							<th>Precio del Menú Vegetariano</th>
							<th>Precio del Menú Vegano</th>
							<th>Precio del Menú Celíaco</th>
							<th>Restaurante al que pertenece</th>
							<th>Acción</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${menusRestaurantes}" var="menu">
							<tr>
								<td>${menu.precioMenuNormal}</td>
								<td>${menu.precioMenuVegetariano}</td>
								<td>${menu.precioMenuVegano}</td>
								<td>${menu.precioMenuCeliaco}</td>
								<td>${menu.restaurante.nombreRestaurante}</td>
								<td>
									<form action="borrarMenuRestaurante" method="post">
										<input type="hidden" name="idMenu"
											value="${menu.idMenuRestaurante}" />
										<button type="submit" class="btn btn-danger">Borrar
											Menú Restaurante</button>
									</form>
								</td>
								<td>
									<form action="modificarMenuRestauranteFormulario" method="get">
										<input type="hidden" name="idMenu"
											value="${menu.idMenuRestaurante}" />
										<button type="button"
											class="btn btn-primary modificarMenuRestauranteButton"
											data-idmenurestaurante="${menu.idMenuRestaurante}">Modificar
											Menú Restaurante</button>
									</form>
								</td>

							</tr>
							<tr>
								<td colspan="6"><c:forEach
										items="${menu.listadoImagenesMenuRestaurante}" var="imagen">
										<img src="${imagen.urlImagenMenuRestaurante}"
											alt="Imagen del Menú" style="width: 100px; height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!--  MODAL MENU RESTAURANTE -->

	<div class="modal fade" id="modificarMenuModal" tabindex="-1"
		aria-labelledby="modificarMenuModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificarMenuModalLabel">Modificar
						Menú del Restaurante</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="modificarMenuForm" action="modificarMenuRestaurante"
						method="post" enctype="multipart/form-data">
						<input type="hidden" id="idMenuRestaurante"
							name="idMenuRestaurante" />

						<div class="form-group">
							<label for="precioMenuNormalModal">Precio del Menú Normal</label>
							<input type="number" step="0.01" id="precioMenuNormalModal"
								name="precioMenuNormal" class="form-control" />
						</div>

						<div class="form-group">
							<label for="precioMenuVegetarianoModal">Precio del Menú
								Vegetariano</label> <input type="number" step="0.01"
								id="precioMenuVegetarianoModal" name="precioMenuVegetariano"
								class="form-control" />
						</div>

						<div class="form-group">
							<label for="precioMenuVeganoModal">Precio del Menú Vegano</label>
							<input type="number" step="0.01" id="precioMenuVeganoModal"
								name="precioMenuVegano" class="form-control" />
						</div>

						<div class="form-group">
							<label for="precioMenuCeliacoModal">Precio del Menú
								Celíaco</label> <input type="number" step="0.01"
								id="precioMenuCeliacoModal" name="precioMenuCeliaco"
								class="form-control" />
						</div>



						<div class="form-group">
							<label>Imágenes actuales:</label>
							<div id="imagenes-actuales-modal-menu-restaurante"
								data-entidad="MenuRestaurante"></div>
						</div>

						<input type="hidden" name="multipartFile" id="multipartFile">

						<div class="form-group">
							<label for="imagenesMenuModal">Subir Nuevas Imágenes a
								Este Menú</label> <input type="file" id="imagenesMenuModal"
								name="nuevasImagenesMenu" class="form-control" multiple />
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="botonCancelarModificacionMenu"
						class="btn btn-warning" data-bs-dismiss="modal">Cancelar
						Modificación</button>
					<button type="button" id="botonHacerCambiosMenu"
						class="btn btn-primary">Hacer Modificación</button>
				</div>
			</div>
		</div>
	</div>


	<!--  VER LISTADO DE ACTIVIDADES-->

	<div id="verActividadesAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12  col-md-8 ">
				<h2>LISTADO DE ACTIVIDADES</h2>
				<table id="tablaActividades" class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Tipo de Actividad</th>
							<th>Nombre de la Actividad</th>
							<th>Dirección de la Actividad</th>
							<th>Aforo de la Actividad</th>
							<th>Precio de la Actividad</th>
							<th>Destino</th>
							<th>Acción</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${actividades}" var="actividad">
							<tr>
								<td>${actividad.tipoActividad}</td>
								<td>${actividad.nombreActividad}</td>
								<td>${actividad.direccionActividad}</td>
								<td>${actividad.aforoActividad}</td>
								<td>${actividad.precioActividad}</td>
								<td>${actividad.destino.ciudad}</td>
								<td>
									<form action="borrarActividad" method="post">
										<input type="hidden" name="idActividad"
											value="${actividad.idActividad}" />
										<button type="submit" class="btn btn-danger">Borrar
											Actividad</button>
									</form>
								</td>
								<td>
									<form action="modificarActividadFormulario" method="get">
										<input type="hidden" name="idActividad"
											value="${actividad.idActividad}" />
										<button type="button"
											class="btn btn-primary modificarActividadButton"
											data-idactividad="${actividad.idActividad}">Modificar
											Actividad</button>

									</form>
								</td>
							</tr>
							<tr>
								<td colspan="7"><c:forEach
										items="${actividad.listadoImagenesActividad}" var="imagen">
										<img src="${imagen.urlImagenActividad}"
											alt="Imagen de la actividad"
											style="width: 100px; height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<!--  MODAL ACTIVIDAD -->

	<div class="modal fade" id="modificarActividadModal" tabindex="-1"
		aria-labelledby="modificarActividadModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificarActividadModalLabel">Modificar
						Actividad</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="modificarActividadForm" action="modificarActividad"
						method="post" enctype="multipart/form-data">
						<input type="hidden" id="idActividad" name="idActividad" />

						<div class="form-group">
							<label for="tipoActividadModal">Tipo de Actividad</label> <input
								type="text" id="tipoActividadModal" name="tipoActividad"
								class="form-control" />
						</div>

						<div class="form-group">
							<label for="nombreActividadModal">Nombre de la Actividad</label>
							<input type="text" id="nombreActividadModal"
								name="nombreActividad" class="form-control" />
						</div>

						<div class="form-group">
							<label for="direccionActividadModal">Direccion de la
								Actividad</label> <input type="text" id="direccionActividadModal"
								name="direccionActividad" class="form-control" />
						</div>

						<div class="form-group">
							<label for="aforoActividadModal">Aforo de la Actividad</label> <input
								type="number" id="aforoActividadModal" name="aforoActividad"
								class="form-control" />
						</div>

						<div class="form-group">
							<label for="precioActividadModal">Precio de la Actividad</label>
							<input type="number" step="0.01" id="precioActividadModal"
								name="precioActividad" class="form-control" />
						</div>

						<div class="form-group">
							<label for="destinoIdModal">Destino de la Actividad</label> <select
								id="destinoIdModal" name="idDestino" class="form-control">
								<c:forEach var="destino" items="${listaDestinos}">
									<option value="${destino.idDestino}">${destino.ciudad}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label>Imágenes actuales:</label>
							<div id="imagenes-actuales-modal-actividad"></div>
						</div>

						<input type="hidden" name="multipartFile" id="multipartFile">

						<div class="form-group">
							<label for="imagenesActividadModal">Subir Nuevas Imágenes
								a Esta Actividad</label> <input type="file" id="imagenesActividadModal"
								name="nuevasImagenesActividad" class="form-control" multiple />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="botonCancelarModificacionActividad"
						class="btn btn-warning" data-bs-dismiss="modal">Cancelar
						Modificación</button>
					<button type="button" id="botonHacerCambiosActividad"
						class="btn btn-primary">Hacer Modificación</button>
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
        $(document).ready(function () {


            console.log('Id del usuario: ${sessionScope.idUsuario}');

            function eliminarImagen(tipoEntidad) {
                $("body").on("click", ".eliminar-imagen-" + tipoEntidad, function () {
                    var idImagen = $(this).data("id");
                    var imagenElement = $(this).closest(".imagen-actual");
                    if (confirm("¿Estás seguro de que quieres eliminar esta imagen?")) {
                        $.post(
                            "/eliminarUnaImagen" + tipoEntidad,
                            {
                                idImagen: idImagen,
                            },
                            function (response) {
                                console.log(response);
                                if (response === "ok") {
                                    // Eliminar la imagen del DOM en el modal
                                    imagenElement.remove();

                                    // Obtén el elemento de la imagen en la página principal y elimínalo
                                    var imagenEnPaginaPrincipal = $(
                                        'img[src="' + imagenElement.find("img").attr("src") + '"]'
                                    ).closest(".imagen-actual");
                                    imagenEnPaginaPrincipal.remove();

                                    // Recargar la página
                                    location.reload();
                                }
                            }
                        );
                    }
                });
            }

            //Para poder eliminar imagenes
            eliminarImagen("Restaurante");
            eliminarImagen("Hotel");
            eliminarImagen("MenuRestaurante");
            eliminarImagen("Actividad");
            eliminarImagen("SalaHotel");



            function cargarImagenesActuales(tipoEntidad, imagenesActuales, idContenedorImagenes) {
                var contenedorImagenes = $("#" + idContenedorImagenes);

                if (imagenesActuales.length > 0) {
                    var imagenesHtml = "";
                    imagenesActuales.forEach(function (imagen) {
                        imagenesHtml +=
                            '<div class="imagen-actual"><img style="max-width: 150px; height: 150px; margin-right: 10px;" src="' +
                            imagen["urlImagen" + tipoEntidad] +
                            '" /><div class="acciones-imagen"><button type="button" class="btn btn-danger btn-sm eliminar-imagen-' +
                            tipoEntidad +
                            '" data-id="' +
                            imagen["idImagen" + tipoEntidad] +
                            '">Eliminar</button></div></div>';
                    });
                    contenedorImagenes.html(imagenesHtml);
                    contenedorImagenes.css({
                        display: "flex",
                        "flex-wrap": "wrap",
                        "justify-content": "space-between",
                    });
                }
            }




            function abrirModalModificar(tipoEntidad, datos, camposFormulario, idContenedorImagenes) {


                console.log("Soy datos: ");
                console.log(JSON.stringify(datos))


                // Establecer el valor correcto para el campo "Destino del Restaurante"
                $("#destinoIdModalRestaurante").val(datos["idDestino"]);

                // Establecer el valor correcto para el campo "Destino del Hotel"
                $("#destinoIdModalHotel").val(datos["idDestino"]);

                // Establecer el valor correcto para los campos boolean de hotel
                $('#piscinaHotelModal').prop('checked', datos['piscinaHotel']);
                $('#gimnasioHotelModal').prop('checked', datos['gimnasioHotel']);
                $('#terrazaHotelModal').prop('checked', datos['terrazaHotel']);
                $('#spaHotelModal').prop('checked', datos['spaHotel']);

                // Establecer el valor correcto para los campos boolean de salaHotel
                $('#equipoSonidoSalaModal').prop('checked', datos['equipoSonidoSala']);
                $('#proyectorSalaModal').prop('checked', datos['proyectorSala']);


                // Establecer el valor correcto para el campo "Destino de la Actividad"
                $("#destinoIdModalActividad").val(datos["idDestino"]);







                // Rellenar los campos del formulario con los datos del elemento seleccionado
                for (var campo in camposFormulario) {
                    $('#' + camposFormulario[campo]).val(datos[campo]);
                }

                // Cargar imágenes actuales
                var imagenesActuales = datos["listadoImagenes" + tipoEntidad];
                cargarImagenesActuales(tipoEntidad, imagenesActuales, idContenedorImagenes);

                // Asignar el id del elemento al modal
                $("#modificar" + tipoEntidad + "Modal").data(
                    "id" + tipoEntidad,
                    datos["id" + tipoEntidad]
                );

                // Abrir el modal
                $("#modificar" + tipoEntidad + "Modal").modal("show");

                // Cerrar el modal si se hace clic en la "x" o en "Cancelar"
                $(document).on(
                    "click",
                    ".btn-close, #botonCancelarModificacion",
                    function () {
                        $("#modificar" + tipoEntidad + "Modal").modal("hide");
                    }
                );
            }


            function prepararModificarEntidad(tipoEntidad, urlObtenerPorId, camposFormulario, idContenedorImagenes) {

                //contador de tiempo para retrasrar la activacion del evento y que no se envie 2 veces.
                setTimeout(function () {
                    $(".modificar" + tipoEntidad + "Button").off('click').on('click', function () {


                        var idEntidad = $(this).data("id" + tipoEntidad.toLowerCase());



                        $.get(urlObtenerPorId, { ["id" + tipoEntidad]: idEntidad }, function (datos) {
                            abrirModalModificar(tipoEntidad, datos, camposFormulario, idContenedorImagenes);
                        });
                    });
                }, 0);
            }



            function enviarDatosConAjax(url, formData, successCallback, errorCallback) {
                $.ajax({
                    url: url,
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: successCallback,
                    error: errorCallback,
                });
            }




            //PARA RESTAURANTE


            prepararModificarEntidad("Restaurante", "/obtenerRestaurantePorId", {
                idRestaurante: "idRestaurante",
                nombreRestaurante: "nombreRestauranteModal",
                tipoRestaurante: "tipoRestauranteModal",
                categoriaRestaurante: "categoriaRestauranteModal",
                direccionRestaurante: "direccionRestauranteModal",
                aforoRestaurante: "aforoRestauranteModal",

            }, 'imagenes-actuales-modal-restaurante');



            $(".modificarRestauranteButton").click(function () {
                var idRestaurante = $(this).data("idrestaurante");

                $.get(
                    "/obtenerRestaurantePorId",
                    { idRestaurante: idRestaurante },
                    function (restaurante) {
                        // ...
                        // Cargar imágenes actuales
                        var imagenesActuales = restaurante.listadoImagenesRestaurante;
                        var idContenedorImagenes = "imagenes-actuales-modal-restaurante";
                        cargarImagenesActuales("Restaurante", imagenesActuales, idContenedorImagenes);
                        // ...
                    }
                );
            });


            $("#botonHacerCambiosRestaurante").click(function (e) {
                e.preventDefault();

                var form = $("#modificarRestauranteForm")[0];
                var formData = new FormData(form);

                // Agregar idDestino al objeto FormData
                var idDestino = $("#destinoIdModalRestaurante").val();
                formData.append("idDestino", idDestino);

                // Obtener las nuevas imágenes seleccionadas por el usuario
                var nuevasImagenesRestaurante = $('#imagenesRestauranteModal').prop('files');

                if (nuevasImagenesRestaurante) {
                    for (var i = 0; i < nuevasImagenesRestaurante.length; i++) {
                        formData.append('nuevasImagenes', nuevasImagenesRestaurante[i]);
                    }
                }

                enviarDatosConAjax(
                    $(form).attr("action"),
                    formData,
                    function (data) {
                        console.log("Datos enviados correctamente");
                        $(form).closest('.modal').modal('hide');
                        location.reload();

                    },
                    function (xhr, status, error) {
                        console.log("Error al hacer los cambios: " + error);
                    }
                );

                function showError(error) {
                    // Agrega aquí tu lógica para mostrar el mensaje de error en la interfaz de usuario
                    alert("Ha ocurrido un error: " + error);
                }
            });




            //PARA HOTEL


            prepararModificarEntidad("Hotel", "/obtenerHotelPorId", {
                idHotel: "idHotel",
                nombreHotel: "nombreHotelModal",
                categoriaHotel: "categoriaHotelModal",
                piscinaHotel: "piscinaHotelModal",
                gimnasioHotel: "gimnasioHotelModal",
                terrazaHotel: "terrazaHotelModal",
                spaHotel: "spaHotelModal",
                aforoHotel: "aforoHotelModal",
                direccionHotel: "direccionHotelModal",
                precioHotel: "precioHotelModal",
                idDestino: "destinoIdModalHotel",
            }, 'imagenes-actuales-modal-hotel');


            $(".modificarHotelButton").click(function () {
                var idHotel = $(this).data("idhotel");

                $.get(
                    "/obtenerHotelPorId",
                    { idHotel: idHotel },
                    function (hotel) {
                        // ...
                        // Cargar imágenes actuales
                        var imagenesActuales = hotel.listadoImagenesHotel;
                        var idContenedorImagenes = "imagenes-actuales-modal-hotel";
                        cargarImagenesActuales("Hotel", imagenesActuales, idContenedorImagenes);                        
                        // ...
                    }
                );
            });




            $("#botonHacerCambiosHotel").click(function (e) {
                e.preventDefault();
                console.log("Botón Hacer Cambios Hotel presionado");

                var form = $("#modificarHotelForm")[0];
                var formData = new FormData(form);
                
             	// Convertir los estados de los checkboxes a 'bit' y reemplazarlos en el objeto FormData
                formData.set('piscinaHotel', $('#piscinaHotelModal').is(':checked') ? 1 : 0);
                formData.set('gimnasioHotel', $('#gimnasioHotelModal').is(':checked') ? 1 : 0);
                formData.set('terrazaHotel', $('#terrazaHotelModal').is(':checked') ? 1 : 0);
                formData.set('spaHotel', $('#spaHotelModal').is(':checked') ? 1 : 0);


                // Agregar idDestino al objeto FormData
                var idDestino = $("#destinoIdModal").val();
                formData.append("idDestino", idDestino);

                // Obtener las nuevas imágenes seleccionadas por el usuario
                var nuevasImagenesHotel = $('#imagenesHotelModal').prop('files');

                if (nuevasImagenesHotel) {
                    for (var i = 0; i < nuevasImagenesHotel.length; i++) {
                        formData.append('nuevasImagenes', nuevasImagenesHotel[i]);
                    }
                }

                console.log("Preparando para enviar datos con AJAX");

                enviarDatosConAjax(
                    $(form).attr("action"),
                    formData,
                    function (data) {
                    	console.log("Datos enviado: " + formData)
                        console.log("Datos enviados correctamente");
                        $(form).closest('.modal').modal('hide');
                        location.reload();
                    },
                    function (xhr, status, error) {
                        console.log("Error al hacer los cambios: " + error);
                    }
                );

                function showError(error) {
                    alert("Ha ocurrido un error: " + error);
                }
            });


            //PARA SALA HOTEL

            prepararModificarEntidad("SalaHotel", "/obtenerSalaHotelPorId", {
                idSalaHotel: "idSalaHotel",
                nombreSala: "nombreSalaModal",
                aforoSala: "aforoSalaModal",
                metrosSala: "metrosSalaModal",
                equipoSonidoSala: "equipoSonidoSalaModal",
                proyectorSala: "proyectorSalaModal",
                precioSala: "precioSalaModal",
                idHotel: "idHotelModal",
            }, 'imagenes-actuales-modal-sala-hotel');



            $(".modificarSalaHotelButton").click(function () {
                var idSalaHotel = $(this).data("idsalahotel");

                $.get("/obtenerSalaHotelPorId", { idSalaHotel: idSalaHotel }, function (salaHotel) {


                    // Cargar imágenes actuales
                    var imagenesActuales = salaHotel.listadoImagenesSalaHotel;
                    var idContenedorImagenes = "imagenes-actuales-modal-sala-hotel";
                    cargarImagenesActuales("SalaHotel", imagenesActuales, idContenedorImagenes);


                });
            });


            $("#botonHacerCambiosSalaHotel").click(function (e) {
                e.preventDefault();

                var form = $("#modificarSalaHotelForm")[0];
                var formData = new FormData(form);

                // Agregar idHotel al objeto FormData
                var idHotel = $("#idHotelModal").val();
                
             // Convertir los estados de los checkboxes a 'bit' y reemplazarlos en el objeto FormData
                formData.set('equipoSonidoSala', $('#equipoSonidoSalaModal').is(':checked') ? 1 : 0);
                formData.set('proyectorSala', $('#proyectorSalaModal').is(':checked') ? 1 : 0);


                console.log(idHotel);
                formData.append("idHotel", idHotel);

                // Obtener las nuevas imágenes seleccionadas por el usuario
                var nuevasImagenesSalaHotel = $('#imagenesSalaHotelModal').prop('files');

                if (nuevasImagenesSalaHotel) {
                    for (var i = 0; i < nuevasImagenesSalaHotel.length; i++) {
                        formData.append('nuevasImagenes', nuevasImagenesSalaHotel[i]);
                    }
                }

                enviarDatosConAjax(
                    $(form).attr("action"),
                    formData,
                    function (data) {
                        console.log("Datos enviados correctamente");
                        $(form).closest('.modal').modal('hide');
                        location.reload();
                    },
                    function (xhr, status, error) {
                        console.log("Error al hacer los cambios: " + error);
                    }
                );

                function showError(error) {
                    // Agrega aquí tu lógica para mostrar el mensaje de error en la interfaz de usuario
                    alert("Ha ocurrido un error: " + error);
                }
            });










            //PARA MENU RESTAURANTE


            prepararModificarEntidad("MenuRestaurante", "/obtenerMenuRestaurantePorId", {
                idMenuRestaurante: "idMenuRestaurante",
                precioMenuNormal: "precioMenuNormalModal",
                precioMenuVegetariano: "precioMenuVegetarianoModal",
                precioMenuVegano: "precioMenuVeganoModal",
                precioMenuCeliaco: "precioMenuCeliacoModal",
                //  idRestaurante: "idRestauranteModal",
                idDestino: "destinoIdModalRestaurante",
            }, 'imagenes-actuales-modal-menu-restaurante');



            $(document).on('click', '.modificarMenuRestauranteButton', function () {
                console.log("HOLAAAA");
                var idMenuRestaurante = $(this).data("idmenurestaurante");

                $.get("/obtenerMenuRestaurantePorId", {
                    idMenuRestaurante: idMenuRestaurante
                }, function (data) {


                    // Cargar imágenes actuales
                    var imagenesActuales = data.listadoImagenesMenuRestaurante;
                    var idContenedorImagenes = "imagenes-actuales-modal-menu-restaurante";
                    cargarImagenesActuales("MenuRestaurante", imagenesActuales, idContenedorImagenes);

                    // Abre el modal
                    $("#modificarMenuModal").modal('show');
                });
            });




            $("#botonHacerCambiosMenu").click(function (e) {
                e.preventDefault();

                var form = $("#modificarMenuForm")[0];
                var formData = new FormData(form);

                // Obtener las nuevas imágenes seleccionadas por el usuario
                var nuevasImagenesMenu = $('#imagenesMenuModal').prop('files');

                if (nuevasImagenesMenu) {
                    for (var i = 0; i < nuevasImagenesMenu.length; i++) {
                        formData.append('nuevasImagenes', nuevasImagenesMenu[i]);
                    }
                }


                console.log(formData);

                enviarDatosConAjax(
                    $(form).attr("action"),
                    formData,
                    function (data) {



                        $(form).closest('.modal').modal('hide');
                        location.reload();
                    },
                    function (xhr, status, error) {
                        console.log("Error al hacer los cambios: " + error);
                    }
                );
            });










            //PARA ACTIVIDAD

            prepararModificarEntidad("Actividad", "/obtenerActividadPorId", {
                idActividad: "idActividad",
                tipoActividad: "tipoActividadModal",
                nombreActividad: "nombreActividadModal",
                direccionActividad: "direccionActividadModal",
                aforoActividad: "aforoActividadModal",
                precioActividad: "precioActividadModal",
                idDestino: "destinoIdModalActividad",
            }, 'imagenes-actuales-modal-actividad');






            $(".modificarActividadButton").click(function () {
                var idActividad = $(this).data("idactividad");

                $.get("/obtenerActividadPorId", { idActividad: idActividad }, function (actividad) {

                    // Cargar imágenes actuales
                    var imagenesActuales = actividad.listadoImagenesActividad;
                    var idContenedorImagenes = "imagenes-actuales-modal-actividad";
                    cargarImagenesActuales("Actividad", imagenesActuales, idContenedorImagenes);

                });
            });





            $("#botonHacerCambiosActividad").click(function (e) {
                e.preventDefault();

                var form = $("#modificarActividadForm")[0];
                var formData = new FormData(form);

                // Obtener las nuevas imágenes seleccionadas por el usuario
                var nuevasImagenesActividad = $('#imagenesActividadModal').prop('files');

                if (nuevasImagenesActividad) {
                    for (var i = 0; i < nuevasImagenesActividad.length; i++) {
                        formData.append('nuevasImagenes', nuevasImagenesActividad[i]);
                    }
                }

                enviarDatosConAjax(
                    $(form).attr("action"),
                    formData,
                    function (data) {
                        console.log("Datos enviados correctamente");


                        $(form).closest('.modal').modal('hide');
                        location.reload();
                    },
                    function (xhr, status, error) {
                        console.log("Error al hacer los cambios: " + error);
                    }
                );

                function showError(error) {
                    // Agrega aquí tu lógica para mostrar el mensaje de error en la interfaz de usuario
                    alert("Ha ocurrido un error: " + error);
                }
            });



        });
    </script>



</body>

</html>