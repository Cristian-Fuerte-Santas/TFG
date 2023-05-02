<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  Directivas  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>loginYregistro.jsp</title>

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

#principal {
	text-align: center;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.bi {
	width: 32px;
	height: 32px;
	color: currentColor;
}

.bi:hover {
	color: green;
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
	<div id="principal" class="flex-grow-1 bg-light">


		<!-- LOGIN -->
		<form:form id="formularioLogin" class="form-signin mt-5"
			modelAttribute="usuario" method="POST" action="formularioLogin">



			<label for="inputEmail" class="sr-only">Email address</label>
			<form:input path="emailUsuario" type="email" id="inputEmail"
				class="form-control" placeholder="Correo electrónico"
				required="true" autofocus="true" />
			<c:if test="${errorEmailInvalido}">
				<div class="alert alert-danger">Antes y después de la @ los
					símbolos válidos son '.', '_', '-'. El dominio debe ser mínimo de
					dos letras.</div>
			</c:if>
			<c:if test="${errorEmailNoEncontrado}">
				<div class="alert alert-danger">Email o la contraseña
					ingresados no se encuentra registrado. Por favor, verifica e
					inténtalo de nuevo.</div>
			</c:if>




			<label for="inputPassword" class="sr-only">Password</label>
			<form:input path="contraseniaUsuario" type="password"
				id="inputPassword" class="form-control" placeholder="Contraseña"
				required="true" autofocus="true" />
			<c:if test="${errorContraseniaInvalida}">
				<div class="alert alert-danger">La contraseña debe tener entre
					5 y 8 dígitos.</div>
			</c:if>
			<c:if test="${errorContraseniaNoEncontrada}">
				<div class="alert alert-danger">Email o la contraseña
					ingresados no se encuentra registrado. Por favor, verifica e
					inténtalo de nuevo.</div>
			</c:if>





			<div class="checkbox mb-3">

				<label> <input type="checkbox" value="remember-me">
					Recuérdame
				</label>

			</div>



			<button id="botonEnviarForlumarioLogin"
				class="btn btn-lg btn-primary btn-block mb-4" type="submit">Iniciar


				Sesión</button>

			<a href="contraseniaOlvidada"> <span>He olvidado la
					contraseña</span>
			</a>


		</form:form>





		<!-- Mensaje el Registro se ha completado correctamente -->
		<c:if test="${exitoRegistro}">
			<div id="mensajeExitoRegistro" class="alert alert-success mt-5"
				role="alert">
				EL REGISTRO SE HA COMPLETADO CORRECTAMENTE <br> <a
					href="http://localhost:8080/loginYregistro">Volver al area de
					Login</a>

			</div>

		</c:if>




		<!-- MENSAJE DE REGISTRARSE Y FLECHA ABAJO-->

		<div id="mensajeRegistrase">

			<h3 class="mt-5">Si aún no tiene cuenta, puede registrase aquí</h3>

			<p>(haga click en la flecha)</p>

			<img id="flechaAbajo"
				src="recursos/Bootstrap/bootstrap-icons-1.10.4/arrow-down-circle-fill.svg"
				alt="Bootstrap" width="32" height="32">

		</div>



		<!-- MENSAJE DE OCULTAR REGISTRARSE Y FLECHA ARRIBA-->

		<div id="mensajeOcultarRegistrarse" hidden="true">

			<h3 class="mt-5">Ocultar el formulario de registrarse</h3>

			<p>(haga click en la flecha)</p>

			<img id="flechaArriba"
				src="recursos/Bootstrap/bootstrap-icons-1.10.4/arrow-up-circle-fill.svg"
				alt="Bootstrap" width="32" height="32">

		</div>





		<form:form id="formularioRegistrarse" class="form-signin mt-5"
			modelAttribute="usuario" hidden="true" method="POST"
			action="insertarUsuario">

			<input type="hidden" id="registroAbierto" name="registroAbierto"
				value="${registroAbierto}">


			<form:hidden path="idUsuario" id="idUsuario"></form:hidden>


			<label for="inputNombreDeEmpresa">Nombre de su empresa</label>
			<form:input path="nombreEmpresa" type="text"
				id="inputNombreDeEmpresa" class="form-control"
				placeholder="AGUAS BUENAS S.L. ..." required="true"></form:input>
			<c:if test="${errorNombreEmpresaInvalido}">
				<div class="alert alert-danger">Nombre de empresa inválido.</div>
			</c:if>



			<label for="inputNifEmpresa">NIF EMPRESA</label>
			<form:input path="nifEmpresa" type="text" id="inputNifEmpresa"
				class="form-control" placeholder="A12345678" required="true"></form:input>

			<c:if test="${errorNifEmpresaInvalido}">
				<div class="alert alert-danger">NIF Empresa inválido.</div>
			</c:if>



			<label for="inputNombreDeUsuario">Nombre</label>
			<form:input path="nombreUsuario" type="text"
				id="inputNombreDeUsuario" class="form-control" placeholder="Manuel"
				required="true"></form:input>
			<c:if test="${errorNombreUsuarioInvalido}">
				<div class="alert alert-danger">Nombre de usuario inválido.</div>
			</c:if>



			<label for="inputTelefonoUsuario">Teléfono Móvil</label>
			<form:input path="telefonoUsuario" type="tel"
				id="inputTelefonoUsuario" class="form-control"
				placeholder="666555444" required="true"></form:input>
			<!-- Pendiente TELF -->



			<label for="inputEmailUsuario">Correo Electrónico</label>
			<form:input path="emailUsuario" type="email" id="inputEmailUsuario"
				class="form-control" placeholder="manuel@gmail.com" required="true"></form:input>
			<c:if test="${errorEmailInvalido}">
				<div class="alert alert-danger">Correo electrónico inválido.</div>
			</c:if>



			<label for="inputContrasenia">Contraseña</label>
			<form:input path="contraseniaUsuario" type="password"
				id="inputContrasenia" class="form-control" placeholder="Contraseña"
				required="true"></form:input>
			<c:if test="${errorPasswordInvalido}">
				<div class="alert alert-danger">Contraseña inválida.</div>
			</c:if>



			<label for="inputVerificarContrasenia">Vuelva a introducir su
				contraseña</label>
			<input name="verificarContrasenia" type="password"
				id="inputVerificarContrasenia" class="form-control"
				placeholder="Vuelva a introducir la contraseña" />
			<c:if test="${errorPasswordNoCoincide}">
				<div class="alert alert-danger">Las contraseñas no coinciden.</div>
			</c:if>

			<button id="botonEnviarFormularioRegistrarse"
				class="btn btn-lg btn-primary btn-block" type="submit">REGISTRARSE</button>
		</form:form>
	</div>

	<!-- Footer-->
	<footer class="footer mt-auto py-3 mb-0">
		<div class="container" align="center">
			<span class="text-muted"> Gala Gallardo García y Cristian
				Fuerte Santas</span>
		</div>
	</footer>




	<script>
		$(document).ready(function() {

			//cuando le damos a la flecha hacia abajo
			$("#flechaAbajo").click(function() {

				//aparece el formulario de registrase
				$("#formularioRegistrarse").removeAttr("hidden");

				//oculta el mensaje de registrase
				$("#mensajeRegistrase").attr("hidden", true);

				//oculta el formulario de login
				$("#formularioLogin").attr("hidden", true);

				//muestra el mensaje de ocultar registrase
				$("#mensajeOcultarRegistrarse").removeAttr("hidden");

			});

			//cuando le damos a la flecha hacia arriba
			$("#flechaArriba").click(function() {

				//oculta el formulario de registrase
				$("#formularioRegistrarse").attr("hidden", true);

				//muestra el mensaje de registrase
				$("#mensajeRegistrase").removeAttr("hidden");

				//oculta el mensaje de ocultar registrase
				$("#mensajeOcultarRegistrarse").attr("hidden", true);

				//oculta el formulario de login
				$("#formularioLogin").removeAttr("hidden");

			});

			//REGISTRO - EXITO; si existe el mensaje de éxito, quitar el atributo hidden

			if ($("#mensajeExitoRegistro").length) {

				$("#mensajeRegistrase").attr("hidden", true);
				$("#formularioLogin").attr("hidden", true);
				$("#mensajeExitoRegistro").removeAttr("hidden");
			}

			//REGISTRO - ERRORES; ocultar formulario Login y flecha si hay errores en validacion Registro
			if ($("#formularioRegistrarse .alert-danger").length) {

				console.log("TENGO ERRORES")

				$("#formularioLogin").attr("hidden", true);
				$("#mensajeRegistrase").attr("hidden", true);
				$("#mensajeOcultarRegistrarse").removeAttr("hidden");
				$("#formularioRegistrarse").removeAttr("hidden");
			}
		});
	</script>


</body>

</html>


