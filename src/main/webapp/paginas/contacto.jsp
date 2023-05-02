<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  Directivas  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>index TFG</title>

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

#map {
	width: 50%;
	height: 400px;
	background-color: grey;
}

.text-container {
	margin-left: 20px;
}

.mapa-container {
	display: flex;
	justify-content: center;
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





	<!-- PRINCIPAL -->
	<div class="flex-grow-1 bg-light">




		<div class="row justify-content-center align-items-center">


			<div class="col-md-6 my-auto mapa-container">


				<div id="map" class="mt-5 mb-5 ml-5"
					style="width: 100%; height: 400px;"></div>


			</div>


			<div class="col-md-6 my-auto">
				<h1 class="mt-5 mb-4" align="left">Nuestras oficinas</h1>
				<p class="lead" align="left" style="font-style: italic;">Calle
					del Dr Cortezo, 11</p>
				<p class="lead" align="left" style="font-style: italic;">28012
					Madrid</p>
				<p class="lead" align="left" style="font-weight: bold;">Teléfono
					de Atención al Cliente</p>
				<p class="lead" align="left" style="font-style: italic;">91 221
					94 05</p>
				<p class="lead" align="left" style="font-weight: bold;">Horario
					de Anteción al Cliente</p>
				<p class="lead" align="left" style="font-style: italic;">De
					lunes a vieres de 9 a 19h</p>
			</div>
		</div>
	</div>


	<!-- Footer-->
	<footer class="footer mt-auto py-3 mb-0">
		<div class="container" align="center">
			<span class="text-muted"> Gala Gallardo García Y Cristian
				Fuerte Santas</span>
		</div>
	</footer>


</body>

<script>
                 function initMap() {
                     // The location of Uluru
                     const madrid = { lat: 40.4138, lng: -3.7038 };
                     // The map, centered at Uluru
                     const map = new google.maps.Map(document.getElementById("map"), {
                       zoom: 12,
                       center: madrid,
                     });
                     // The marker, positioned at Uluru
                     const marker = new google.maps.Marker({
                       position: madrid,
                       map: map,
                     });
                   }

                   window.initMap = initMap;
                   </script>

<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiHsROEwzwI6zd6kUadBnvYklxfhKvalI&callback=initMap"></script>

</html>