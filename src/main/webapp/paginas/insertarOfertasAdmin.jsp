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


	<!--  SUBMENU DE INSERTAR -->

	<div id="subMenuInsertarOfertas">
		<div class="row justify-content-around w-100 mt-5">
			<button id="botonSubMenuInsertarHotel" class="btn btn-primary">Insertar
				Hotel</button>
			<button id="botonSubMenuInsertarRestaurante" class="btn btn-primary">Insertar
				Restaurante</button>
			<button id="botonSubMenuInsertarMenuRestaurante"
				class="btn btn-primary">Insertar Menu Restaurante</button>
			<button id="botonSubMenuInsertarSalaHotel" class="btn btn-primary">Insertar
				Sala Hotel</button>
		</div>
	</div>




	<div id="insertarHotelAdmin" class="container-fluid w-100 d-none">
		<div class="row">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">

				<form:form id="formularioInsertarHotel" class="form-signin mt-5"
					align="center" modelAttribute="hotel" method="POST"
					action="insertarHotel" enctype="multipart/form-data">


					<h2 align="center">INSERTAR HOTEL</h2>

				

					<label for="inputNombreHotel">Nombre del Hotel</label>
					<form:input path="nombreHotel" type="text" id="inputNombreHotel"
						class="form-control" placeholder="Hotel Example" required="true"></form:input>

					<label for="inputDestino">Destino del Hotel</label>
					<form:select path="destino.idDestino" id="inputDestino"
						class="form-control" required="true">
						<form:option value="" label="Selecciona un destino"
							disabled="true" />
						<form:options items="${destinos}" itemValue="idDestino"
							itemLabel="ciudad" />
					</form:select>



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
					<input type="file" name="multipartFiles" id="inputImagenesHotel"
						class="form-control" multiple="true" />


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





	<div id="insertarRestauranteAdmin" class="container-fluid w-100 d-none">
		<div class="row">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">


				<form:form id="formularioInsertarRestaurante"
					class="form-signin mt-5" align="center"
					modelAttribute="restaurante" method="POST"
					action="insertarRestaurante" enctype="multipart/form-data">


					<h2 align="center">INSERTAR RESTAURANTE</h2>

			

					<label for="inputNombreRestaurante">Nombre del Restaurante</label>
					<form:input path="nombreRestaurante" type="text"
						id="inputNombreRestaurante" class="form-control"
						placeholder="Restaurante Example" required="true"></form:input>

					<label for="inputDestino">Destino del Restaurante</label>
					<form:select path="destino.idDestino" id="inputDestino"
						class="form-control" required="true">
						<form:option value="" label="Selecciona un destino"
							disabled="true" />
						<form:options items="${destinos}" itemValue="idDestino"
							itemLabel="ciudad" />
					</form:select>


					<label for="inputTipoRestaurante">Tipo de Restaurante</label>
					<form:input path="tipoRestaurante" type="text"
						id="inputTipoRestaurante" class="form-control"
						placeholder="Italiano" required="true"></form:input>

					<label for="inputCategoriaRestaurante">Categoría del
						Restaurante</label>
					<form:input path="categoriaRestaurante" type="number"
						id="inputCategoriaRestaurante" class="form-control"
						placeholder="4" required="true"></form:input>

					<label for="inputAforoRestaurante">Aforo del Restaurante</label>
					<form:input path="aforoRestaurante" type="number"
						id="inputAforoRestaurante" class="form-control" placeholder="200"
						required="true"></form:input>

					<label for="inputDireccionRestaurante">Dirección del
						Restaurante</label>
					<form:input path="direccionRestaurante" type="text"
						id="inputDireccionRestaurante" class="form-control"
						placeholder="Calle Ejemplo 123" required="true"></form:input>



					<label for="inputImagenesRestaurante">Imágenes del Restaurante</label>
					<input type="file" name="multipartFiles"
						id="inputImagenesRestaurante" class="form-control" multiple="true" />


					<button class="btn btn-lg btn-primary btn-block mt-2" type="submit">INSERTAR
						NUEVO RESTAURANTE</button>

				</form:form>

			</div>
		</div>
	</div>





	<div id="insertarSalaHotelAdmin" class="container-fluid w-100 d-none">

		<div class="row">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">

				<form:form id="formularioInsertarSalaHotel" class="form-signin mt-5"
					align="center" modelAttribute="salaHotel" method="POST"
					action="insertarSalaHotel" enctype="multipart/form-data">

					<h2 align="center">INSERTAR SALA DE HOTEL</h2>

			

					<label for="inputNombreSala">Nombre de la Sala</label>
					<form:input path="nombreSala" type="text" id="inputNombreSala"
						class="form-control" placeholder="Sala Ejemplo" required="true"></form:input>

					<label for="inputHotel">Hotel al que pertenece la Sala</label>
					<form:select path="hotel.idHotel" id="inputHotel"
						class="form-control" required="true">
						<form:option value="" label="Selecciona un hotel" disabled="true" />
						<form:options items="${hoteles}" itemValue="idHotel"
							itemLabel="nombreHotel" />
					</form:select>

					<label for="inputAforoSala">Aforo de la Sala</label>
					<form:input path="aforoSala" type="number" id="inputAforoSala"
						class="form-control" placeholder="100" required="true"></form:input>

					<label for="inputMetrosSala">Metros de la Sala</label>
					<form:input path="metrosSala" type="text" id="inputMetrosSala"
						class="form-control" placeholder="50 m²" required="true"></form:input>

					<label for="inputEquipoSonidoSala">Equipo de Sonido</label>
					<form:checkbox path="equipoSonidoSala" id="inputEquipoSonidoSala"
						class="form-control"></form:checkbox>

					<label for="inputProyectorSala">Proyector</label>
					<form:checkbox path="proyectorSala" id="inputProyectorSala"
						class="form-control"></form:checkbox>

					<label for="inputPrecioSala">Precio de la Sala</label>
					<form:input path="precioSala" type="number" id="inputPrecioSala"
						class="form-control" placeholder="150" step="0.01" required="true"></form:input>



					<label for="inputImagenesSalaHotel">Imágenes de la Sala</label>
					<input type="file" name="multipartFiles"
						id="inputImagenesSalaHotel" class="form-control" multiple="true" />

					<button class="btn btn-lg btn-primary btn-block mt-2" type="submit">INSERTAR
						SALA DE HOTEL</button>

				</form:form>

			</div>
		</div>
	</div>



	<div id="insertarMenuRestauranteAdmin"
		class="container-fluid w-100 d-none">

		<div class="row">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">


				<form:form id="formularioInsertarMenuRestaurante"
					class="form-signin mt-5" align="center"
					modelAttribute="menuRestaurante" method="POST"
					action="insertarMenuRestaurante" enctype="multipart/form-data">

					<h2 align="center">INSERTAR MENÚ DE RESTAURANTE</h2>

			

					<label for="inputRestaurante">Restaurante al que pertenece
						el Menú</label>
					<form:select path="restaurante.idRestaurante" id="inputRestaurante"
						class="form-control" required="true">
						<form:option value="" label="Selecciona un restaurante"
							disabled="true" />
						<form:options items="${restaurantes}" itemValue="idRestaurante"
							itemLabel="nombreRestaurante" />
					</form:select>

					<label for="inputPrecioMenuNormal">Precio Menú Normal</label>
					<form:input path="precioMenuNormal" type="number"
						id="inputPrecioMenuNormal" class="form-control"
						placeholder="10.00" step="0.01" required="true"></form:input>

					<label for="inputPrecioMenuVegetariano">Precio Menú
						Vegetariano</label>
					<form:input path="precioMenuVegetariano" type="number"
						id="inputPrecioMenuVegetariano" class="form-control"
						placeholder="12.00" step="0.01" required="true"></form:input>

					<label for="inputPrecioMenuVegano">Precio Menú Vegano</label>
					<form:input path="precioMenuVegano" type="number"
						id="inputPrecioMenuVegano" class="form-control"
						placeholder="14.00" step="0.01" required="true"></form:input>

					<label for="inputPrecioMenuCeliaco">Precio Menú Celíaco</label>
					<form:input path="precioMenuCeliaco" type="number"
						id="inputPrecioMenuCeliaco" class="form-control"
						placeholder="16.00" step="0.01" required="true"></form:input>



					<label for="inputImagenesMenuRestaurante">Imágenes del Menú</label>
					<input type="file" name="multipartFiles"
						id="inputImagenesMenuRestaurante" class="form-control"
						multiple="true" />

					<button class="btn btn-lg btn-primary btn-block mt-2" type="submit">INSERTAR
						MENÚ DE RESTAURANTE</button>

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

	<script>
		$(document).ready(
				function() {

					function mostrarDiv(element) {

						$(element).removeClass("d-none");

					}

					function esconderDivs(elements) {

						elements.forEach(function(element) {

							$(element).addClass("d-none");

						});
					}

					$("#botonSubMenuInsertarHotel").click(
							function() {

								esconderDivs([ "#insertarRestauranteAdmin",
										"#insertarMenuRestauranteAdmin",
										"#insertarSalaHotelAdmin" ]);
								mostrarDiv("#insertarHotelAdmin");

							});

					$("#botonSubMenuInsertarRestaurante").click(
							function() {
								esconderDivs([ "#insertarHotelAdmin",
										"#insertarMenuRestauranteAdmin",
										"#insertarSalaHotelAdmin" ]);
								mostrarDiv("#insertarRestauranteAdmin");
							});

					$("#botonSubMenuInsertarMenuRestaurante").click(
							function() {
								esconderDivs([ "#insertarHotelAdmin",
										"#insertarRestauranteAdmin",
										"#insertarSalaHotelAdmin" ]);
								mostrarDiv("#insertarMenuRestauranteAdmin");
							});

					$("#botonSubMenuInsertarSalaHotel").click(
							function() {
								esconderDivs([ "#insertarHotelAdmin",
										"#insertarRestauranteAdmin",
										"#insertarMenuRestauranteAdmin" ]);
								mostrarDiv("#insertarSalaHotelAdmin");
							});

				});
	</script>


</body>

</html>