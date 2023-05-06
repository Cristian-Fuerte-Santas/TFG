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



	<!--  VER LISTADO DE RESTAURANTES -->

	<div id="verRestaurantesAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
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
											style="max-width: 100px; max-height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!--  MODAL DE MODIFICAR RESTAURANTES -->

	<!-- Modal -->
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
								type="text" id="tipoRestauranteModal"
								name="tipoRestaurante" class="form-control" />
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
        <label for="destinoIdModal">Destino del Restaurante</label> 
        <select id="destinoIdModal" name="idDestino" class="form-control">
            <c:forEach var="destino" items="${listaDestinos}">
                <option value="${destino.idDestino}">${destino.ciudad}</option>
            </c:forEach>
        </select>
    </div>

						<div class="form-group">

							<label>Imágenes actuales:</label>
							<div id="imagenes-actuales-modal"></div>

						</div>

						<input type="hidden" name="multipartFiles" id="multipartFiles">

						<div class="form-group">
							<label for="imagenesRestauranteModal">Subir Nuevas
								Imagenes a Este Restaurante</label> <input type="file"
								id="imagenesRestauranteModal" name="listadoImagenesRestaurante"
								class="form-control" multiple />
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" id="botonCancelarModificacion"
						class="btn btn-warning" data-bs-dismiss="modal">Cancelar
						Modificación</button>
					<button type="button" id="botonHacerCambios"
						class="btn btn-primary" >Hacer
						Modificación</button>
				</div>
			</div>
		</div>
	</div>




	<div id="verHotelesAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
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
								<td>
									<form action="borrarHotel" method="post">
										<input type="hidden" name="idHotel" value="${hotel.idHotel}" />
										<button type="submit" class="btn btn-danger">Borrar
											Hotel</button>
									</form>
								</td>
							</tr>
							<tr>
								<td colspan="10"><c:forEach
										items="${hotel.listadoImagenesHotel}" var="imagen">
										<img src="${imagen.urlImagenHotel}" alt="Imagen del hotel"
											style="max-width: 100px; max-height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<div id="verSalasHotelAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
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
								<td>
									<form action="borrarSalaHotel" method="post">
										<input type="hidden" name="idSala" value="${sala.idSalaHotel}" />
										<button type="submit" class="btn btn-danger">Borrar
											Sala</button>
									</form>
								</td>
							</tr>
							<tr>
								<td colspan="7"><c:forEach
										items="${sala.listadoImagenesSalaHotel}" var="imagen">
										<img src="${imagen.urlImagenSalaHotel}"
											alt="Imagen de la sala"
											style="max-width: 100px; max-height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!-- Gestionar Menu Restaurante-->

	<div id="verMenusRestauranteAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
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
											Menú</button>
									</form>
								</td>

							</tr>
							<tr>
								<td colspan="6"><c:forEach
										items="${menu.listadoImagenesMenuRestaurante}" var="imagen">
										<img src="${imagen.urlImagenMenuRestaurante}"
											alt="Imagen del Menú"
											style="max-width: 100px; max-height: 100px;">
									</c:forEach></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<div id="verActividadesAdmin" class="container-fluid w-75">
		<div class="row mt-5">
			<div class="col-sm-12 offset-sm-0 col-md-8 offset-md-2">
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
							</tr>
							<tr>
								<td colspan="7"><c:forEach
										items="${actividad.listadoImagenesActividad}" var="imagen">
										<img src="${imagen.urlImagenActividad}"
											alt="Imagen de la actividad"
											style="max-width: 100px; max-height: 100px;">
									</c:forEach></td>
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

	
	
	<script>
  $(document).ready(function() {
	  
	  
	  // Cerrar el modal si da en la x o en CancelarModificacion
	  $(document).on('click', '.btn-close, #botonCancelarModificacion', function() {
	    $('#modificarRestauranteModal').modal('hide');
		});


	 // Eliminar una imagen actual
	    $(document).on('click', '.eliminar-imagen', function() {
	      var idImagen = $(this).data('id');
	      var imagenElement = $(this).closest('.imagen-actual');
	      if (confirm('¿Estás seguro de que quieres eliminar esta imagen?')) {
	        $.post('/eliminarUnaImagenRestaurante', {
	          idImagen: idImagen
	        }, function(response) {
	          console.log(response);
	          if (response === 'ok') {
	            // Eliminar la imagen del DOM en el modal
	            imagenElement.remove();

	            // Obtén el elemento de la imagen en la página principal y elimínalo
	            var imagenEnPaginaPrincipal = $('img[src="' + imagenElement.find('img').attr('src') + '"]').closest('.imagen-actual');
	            imagenEnPaginaPrincipal.remove();

	            // Recargar la página
	            location.reload();
	          }
	        });
	      }
	    });
	    
	 
	 // Botón de modificar restaurante para que aparezca el modal con los datos rellenos
	    $('.modificarRestauranteButton').click(function() {
	        var idRestaurante = $(this).data('idrestaurante');

	        // Asignar el idRestaurante al modal
	        $('#modificarRestauranteModal').data('idRestaurante', idRestaurante);

	        $.get('/obtenerRestaurantePorId', { idRestaurante: idRestaurante }, function(restaurante) {
	            console.log(restaurante);

	            // Rellenar los campos del formulario con los datos de la oferta seleccionada
	            $('#idRestaurante').val(restaurante.idRestaurante);
	            $('#nombreRestauranteModal').val(restaurante.nombreRestaurante);
	            $('#tipoRestauranteModal').val(restaurante.tipoRestaurante);
	            $('#categoriaRestauranteModal').val(restaurante.categoriaRestaurante);
	            $('#direccionRestauranteModal').val(restaurante.direccionRestaurante);
	            $('#aforoRestauranteModal').val(restaurante.aforoRestaurante);
	            $('#destinoIdModal').val(restaurante.destino ? restaurante.destino.idDestino : '');

	        console.log();
	            

	         // Cargar imágenes actuales
				var imagenesActuales = restaurante.listadoImagenesRestaurante;
				console.log(imagenesActuales);
				if (imagenesActuales.length > 0) {
				    var imagenesHtml = '';
				    imagenesActuales.forEach(function(imagen) {
				        imagenesHtml += '<div class="imagen-actual"><img style="max-width: 150px; height: 150px; margin-right: 10px;" src="' +
				            imagen.urlImagenRestaurante + '" /><div class="acciones-imagen"><button type="button" class="btn btn-danger btn-sm eliminar-imagen" data-id="'  +
				            imagen.idImagenRestaurante + '">Eliminar</button></div></div>';
				    });
				    $('#imagenes-actuales-modal').html(imagenesHtml);
				    $('#imagenes-actuales-modal').css({
				        'display': 'flex',
				        'flex-wrap': 'wrap',
				        'justify-content': 'space-between',
				    });
				}


	            // Abrir el modal
	            $('#modificarRestauranteModal').modal('show');
	        });
	    });

	 
	    $('#botonHacerCambios').click(function (e) {
	    	  e.preventDefault();

	    	  var form = $('#modificarRestauranteForm')[0];
	    	  var formData = new FormData(form);

	    	  // Obtener las nuevas imágenes del formulario y agregarlas al objeto FormData
	    	  var nuevasImagenes = $('#imagenesRestauranteModal')[0].files;
	    	  if (nuevasImagenes) {
	    	    for (var i = 0; i < nuevasImagenes.length; i++) {
	    	      formData.append('nuevasImagenes', nuevasImagenes[i]);
	    	    }
	    	  }
	    	  
	    	// Agregar idDestino al objeto FormData
	    	    var idDestino = $('#destinoIdModal').val();
	    	    formData.append('idDestino', idDestino);
				
	    	  console.log("ADIOOOS");
	    	  console.log(formData);
	    	  console.log("ADIOOOS 2");
	    	  for (var pair of formData.entries()) {
	    		    console.log(pair[0]+ ', '+ pair[1]); 
	    		}
	    	  
	    	  $.ajax({
	    		    url: $(form).attr('action'),
	    		    type: 'POST',
	    		    data: formData,
	    		    processData: false,
	    		    contentType: false,
	    		    success: function(data) {
	    		        console.log(data);
	    		        console.log("ha salido en success");
	    		        // location.reload();
	    		    },
	    		    error: function(xhr, status, error) {
	    		    	console.log("ha salido en error");
	    		        showError(error);
	    		    }
	    		});

	    		function showError(error) {
	    		    // Agrega aquí tu lógica para mostrar el mensaje de error en la interfaz de usuario
	    		    alert('Ha ocurrido un error: ' + error);
	    		}


	    	  
	    	});







 

  });
</script>
	
	

</body>

</html>