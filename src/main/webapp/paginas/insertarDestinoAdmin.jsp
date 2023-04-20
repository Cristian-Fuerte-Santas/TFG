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
<title>areaPersonaAdmin</title>

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
						class="nav-link" href="gestionarUsuariosAdmin">Gestionar Usuarios</a></li>

					<li id="menuAdminInsertarOfertas" class="nav-item"><a
						class="nav-link" href="insertarOfertasAdmin">Insertar Ofertas</a></li>

					<li id="menuAdminActualizarOfertas" class="nav-item"><a
						class="nav-link" href="actualizarOfertasAdmin">Actualizar Ofertas</a></li>

					<li id="menuAdminBorrarOfertas" class="nav-item"><a
						class="nav-link" href="borrarOfertasAdmin">Borrar Ofertas</a></li>
						
					<li id="menuAdminInsertarDestino" class="nav-item"><a
						class="nav-link" href="insertarDestinoAdmin">Insertar Destino</a></li>


				</ul>
			</div>
		</nav>



	</div>




  

	<div id="verDestinoAdmin" class="container-fluid w-75">
	
		
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
			
			<h2 align="center">LISTADO DE DESTINOS</h2>
				<table id="tablaDestino" class="table table-hover table-striped">

					<thead>
						<tr>
							<th>Destino</th>
							<th>Acción</th>
							
						</tr>
					</thead>
					<tbody>


						<c:forEach items="${destinos}" var="destino">
							<tr>
								<td>${destino.ciudad}</td>
							
								<td>
									<form action="borrarDestino" method="post">
										<input type="hidden" name="idDestino"
											value="${destino.idDestino}" />
										<button type="submit" class="btn btn-danger">Borrar Destino</button>
									</form>
								</td>
							</tr>
						</c:forEach>



					</tbody>
				</table>
			</div>
		</div>




	</div>
	
	<div id="insertarDestinoAdmin" class="container-fluid w-100" >
	
		
		<div class="row mt-5" >
	<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
	<!-- FORMULARIO INSERTAR DESTINO -->
		<form:form id="formularioInsertarDestino" class="form-signin mt-5" align="center"
			modelAttribute="destino" method="POST" action="insertarDestino">
			
			<h2 align="center">INSERTAR DESTINO</h2>
			
			<form:hidden path="idDestino" id="idDestino"></form:hidden>

			<label for="inputDestino">Nombre del Destino</label>
			<form:input path="ciudad" type="text"
				id="inputDestino" class="form-control "
				placeholder="Valencia" required="true"></form:input>

			

			<button 
				class="btn btn-lg btn-primary btn-block mt-2" type="submit">INSERTAR NUEVO DESTINO</button>
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