<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--  Directivas  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>busquedaPersonalizada</title>



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
.btn-purple {
  background-color: #6f42c1;
  border-color: #6f42c1;
}
.estrella {
    cursor: pointer;
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
						id="iconoCarritoImg"
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
	<div class="container-fluid bg-light mt-3">
		<div class="row">
			<!-- Añade una fila para mantener las columnas -->

			<!-- Filtros  -->
			<div class="col-lg-2 col-md-2 col-sm-2">
				<h2>FILTROS</h2>


				<!-- Botón para restablecer todos los filtros -->
				<button id="resetearFiltros" class="btn btn-primary mb-3">Resetear
					filtros</button>

				<!-- Filtro por tipo de oferta -->
				<div class="mb-3">
					<h5>Tipo Oferta</h5>

					<!-- Filtro Hotel -->
					<div class="form-check">
						<input class="form-check-input filtro" type="checkbox"
							value="hotel" id="filtroHotel"> <label
							class="form-check-label" for="filtroHotel">Hoteles</label>
					</div>


					<!-- Subcategorías Hoteles -->
					<div id="subcategoriasHoteles"
						style="display: none; margin-left: 20px;">
						<div class="mb-3 ml-2">
							<h6>Categoría:</h6>
							<img class="estrella" src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
								alt="1 estrella" width="20" height="20"> <img class="estrella"
								src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
								alt="2 estrellas" width="20" height="20"> <img class="estrella"
								src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
								alt="3 estrellas" width="20" height="20"> <img class="estrella"
								src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
								alt="4 estrellas" width="20" height="20">
						</div>


						<div class="mb-3 ml-2">
							<h6>Precio noche:</h6>
							<input type="range" class="custom-range" min="1" max="3"
								id="precioHotel">
							<div class="d-flex justify-content-between">
								<span>20€</span> <span>50€</span> <span>+100€</span>
							</div>
						</div>

						<div class="mb-3">
							<h6>Sala Hotel:</h6>
							<div class="mb-2 ml-3">
								<h6>Aforo Sala Hotel:</h6> <input type="range"
									class="custom-range" min="1" max="3" id="aforoSalaHotel">
								<div class="d-flex justify-content-between">
									<span>25p</span> <span>50p</span> <span>+100p</span>
								</div>
							</div>
							<div class="mb-3 ml-3">
								<h6>Servicios Sala Hotel:</h6>
								<div class="form-check">
									<input class="form-check-input filtro" type="checkbox"
										value="equipoSonido" id="filtroEquipoSonido"> <label
										class="form-check-label" for="filtroEquipoSonido">Equipo
										de sonido</label>
								</div>
								<div class="form-check">
									<input class="form-check-input filtro" type="checkbox"
										value="proyector" id="filtroProyector"> <label
										class="form-check-label" for="filtroProyector">Proyector</label>
								</div>
							</div>
							<div class="mb-3 ml-3">
								<h6>Precio Sala Hotel:</h6> <input type="range"
									class="custom-range" min="1" max="3" id="precioSalaHotel">
								<div class="d-flex justify-content-between">
									<span>150€</span> <span>250€</span> <span>+400€</span>
								</div>
							</div>
						</div>


						<div class="mb-3 ml-2">
							<h6>Servicios Hotel:</h6>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="piscina" id="filtroPiscina"> <label
									class="form-check-label" for="filtroPiscina">Piscina</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="gimnasio" id="filtroGimnasio"> <label
									class="form-check-label" for="filtroGimnasio">Gimnasio</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="terraza" id="filtroTerraza"> <label
									class="form-check-label" for="filtroTerraza">Terraza</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="spa" id="filtroSpa"> <label
									class="form-check-label" for="filtroSpa">Spa</label>
							</div>
						</div>
						<button id="aplicarFiltrosRestaurante" class="btn btn-purple mb-3 ml-5">Aplicar
					filtros</button>
						
					</div>


					<!-- Filtro Restaurante -->
					<div class="form-check">
						<input class="form-check-input filtro" type="checkbox"
							value="restaurante" id="filtroRestaurante"> <label
							class="form-check-label" for="filtroRestaurante">Restaurantes</label>
					</div>

					<!-- Subcategorías Restaurantes -->
					<div id="subcategoriasRestaurantes"
						style="display: none; margin-left: 20px;">
						<div class="mb-3 ml-2">
							<h6>Tipo:</h6>
							<!-- Tipos de restaurantes -->
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="mediterraneo" id="filtroMediterraneo"> <label
									class="form-check-label" for="filtroMediterraneo">Mediterráneo</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="mediterraneo" id="filtroMediterraneo"> <label
									class="form-check-label" for="filtroMediterraneo">Tapas</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="mediterraneo" id="filtroMediterraneo"> <label
									class="form-check-label" for="filtroMediterraneo">Buffet</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="mediterraneo" id="filtroMediterraneo"> <label
									class="form-check-label" for="filtroMediterraneo">Temático</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="mediterraneo" id="filtroMediterraneo"> <label
									class="form-check-label" for="filtroMediterraneo">Italiano</label>
							</div>

						</div>
						<div class="mb-3 ml-2">
							<h6>Categoría:</h6>
							<!-- Imágenes de tenedores 
							Imagen recortada de: https://www.gettyimages.es/detail/ilustraci%C3%B3n/utensils-icon-on-black-and-white-ilustraciones-libres-de-derechos/816471658?adppopup=true-->
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="tenedor2" id="tenedor2"> <label
									class="form-check-label" for="filtroMediterraneo"></label> <img
									src="imagenes/tenedor.jpg" alt="1 tenedor" width="10"
									height="30"> <img src="imagenes/tenedor.jpg"
									alt="2 tenedor" width="10" height="30">
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="tenedor3" id="tenedor3"> <label
									class="form-check-label" for="filtroMediterraneo"></label> <img
									src="imagenes/tenedor.jpg" alt="1 tenedor" width="10"
									height="30"> <img src="imagenes/tenedor.jpg"
									alt="2 tenedor" width="10" height="30"> <img
									src="imagenes/tenedor.jpg" alt="3 tenedor" width="10"
									height="30">
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="tenedor3" id="tenedor3"> <label
									class="form-check-label" for="filtroMediterraneo"></label> <img
									src="imagenes/tenedor.jpg" alt="1 tenedor" width="10"
									height="30"> <img src="imagenes/tenedor.jpg"
									alt="2 tenedor" width="10" height="30"> <img
									src="imagenes/tenedor.jpg" alt="3 tenedor" width="10"
									height="30">
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="tenedor4" id="tenedor4"> <label
									class="form-check-label" for="filtroMediterraneo"></label> <img
									src="imagenes/tenedor.jpg" alt="1 tenedor" width="10"
									height="30"> <img src="imagenes/tenedor.jpg"
									alt="2 tenedor" width="10" height="30"> <img
									src="imagenes/tenedor.jpg" alt="3 tenedor" width="10"
									height="30"> <img src="imagenes/tenedor.jpg"
									alt="4 tenedor" width="10" height="30">
							</div>

						</div>
						<div class="mb-3 ml-2">
							<h6>Precio por persona:</h6>
							<input type="range" class="custom-range" min="1" max="3"
								id="precioRestaurante">
							<div class="d-flex justify-content-between">
								<span>15€</span> <span>25€</span> <span>+50€</span>
							</div>
						</div>
						<div class="mb-3 ml-2">
							<h6>Aforo:</h6>
							<input type="range" class="custom-range" min="1" max="3"
								id="aforoRestaurante">
							<div class="d-flex justify-content-between">
								<span>25p</span> <span>50p</span> <span>+100p</span>
							</div>
						</div>
						<div class="mb-3 ml-2">
							<h6>Menú Restaurante:</h6>
							<!-- Menús especiales -->
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="vegetariano" id="filtroVegetariano"> <label
									class="form-check-label" for="filtroVegetariano">Vegetariano</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="vegetariano" id="filtroVegetariano"> <label
									class="form-check-label" for="filtroVegetariano">Vegano</label>
							</div>
							<div class="form-check">
								<input class="form-check-input filtro" type="checkbox"
									value="vegetariano" id="filtroVegetariano"> <label
									class="form-check-label" for="filtroVegetariano">Celíaco</label>
							</div>
						</div>
						<!-- Botón para aplicar todos los filtros -->
				<button id="aplicarFiltrosRestaurante" class="btn btn-purple mb-3 ml-5">Aplicar
					filtros</button>
					</div>




					<!-- Filtro Actividades-->
					<div class="form-check">
						<input class="form-check-input filtro" type="checkbox"
							value="actividad" id="filtroActividad"> <label
							class="form-check-label" for="filtroActividad">Actividades</label>
					</div>
					<!-- Subcategorías Actividades-->
					<div id="subcategoriasActividades" style="display: none;">
					 <div style="margin-left: 20px;">
						<div class="mb-3 ml-4">
							<h6>Tipo:</h6>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="aventura">
								<label class="form-check-label" for="aventura">Aventura</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="cultura">
								<label class="form-check-label" for="cultura">Cultura</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="ocio">
								<label class="form-check-label" for="ocio">Ocio</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="bienestar">
								<label class="form-check-label" for="bienestar">Bienestar</label>
							</div>
						</div>

						<div class="mb-3 ml-4">
							<h6>Aforo:</h6>
							<input type="range" class="custom-range" min="1" max="4"
								id="aforoActividad">
							<div class="d-flex justify-content-between">
								<span>10p</span> <span>25p</span> <span>50p</span><span>+100p</span>
							</div>
						</div>

						<div class="mb-3 ml-4">
							<h6>Precio por persona:</h6>
							<input type="range" class="custom-range" min="1" max="3"
								id="precioActividad">
							<div class="d-flex justify-content-between">
								<span>15€</span> <span>20€</span> <span>+30€</span>
							</div>
						</div>
						<button id="aplicarFiltrosActividades" class="btn btn-purple mb-3 ml-5">Aplicar
					filtros</button>
					</div>
					</div>
					

				</div>
				
				



			</div>





			<!-- Espacio en blanco (1 columna) -->
			<div class="col-lg-1 col-md-1 col-sm-1"></div>


			<!-- Resultados  -->
			<div class="col-lg-9  col-md-9 col-sm-9 bg-light">
				<h2 align="center">RESULTADOS</h2>
				<div id="resultadosContainer" class="row">
					<!-- Aquí se agregarán las tarjetas de los hoteles -->
				</div>
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

	<script>
    $(document).ready(function(){

    	
    	//CODIGO GALA EN LOCAL: en desarrollo... 
    		
    	//FILTROS: MENU DESPLEGABLE IZQ  
    	
        //HOTELES: Mostrar u ocultar subcategorías de hoteles al marcar o desmarcar la casilla de verificación
        $("#filtroHotel").on("change", function () {
            if ($("#filtroHotel").is(":checked")) {
                $("#subcategoriasHoteles").slideDown();
            } else {
                $("#subcategoriasHoteles").slideUp();
            }
        });
    	
       //RESTAURANTE: idem
        $("#filtroRestaurante").on("change", function () {
            if ($("#filtroRestaurante").is(":checked")) {
                $("#subcategoriasRestaurantes").slideDown();
            } else {
                $("#subcategoriasRestaurantes").slideUp();
            }
        });
    	
      //ACITIVIDADES: idem
        $("#filtroActividad").on("change", function () {
            if ($("#filtroActividad").is(":checked")) {
                $("#subcategoriasActividades").slideDown();
            } else {
                $("#subcategoriasActividades").slideUp();
            }
        });
 
    		

    	//A PARTIR DE AQUÍ: CODIGO CRISTIAN - NO TOCAR

        //Resetear todos los filtros
        $("#resetearFiltros").on("click", function () {

            $(".filtro").prop("checked", false);
            
            //GALA - reseteamos laos filtros del range (barra)            
            $("#precioHotel").val(1);
            $("#precioSalaHotel").val(1);
            $("#aforoSalaHotel").val(1);
            $("#aforoRestaurante").val(1);
            $("#precioRestaurante").val(1);
            $("#aforoActividad").val(1);
            $("#precioActividad").val(1);
        });


        function obtenerHoteles() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: "/obtenerHoteles",
                    method: "GET",
                    dataType: "json",
                    success: function (hoteles) {
                        const hotelesAplanados = aplanarHoteles(hoteles);
                        window.hotelesAplanados = hotelesAplanados;
                        resolve();
                    },
                    error: function (error) {
                        console.error("Error al obtener los hoteles:", error);
                        reject(error);
                    }
                });
            });
        }

        function obtenerRestaurantes() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: "/obtenerRestaurantes",
                    method: "GET",
                    dataType: "json",
                    success: function (restaurantes) {
                        const restaurantesAplanados = aplanarRestaurantes(restaurantes);
                        window.restaurantesAplanados = restaurantesAplanados;
                        resolve();
                    },
                    error: function (error) {
                        console.error("Error al obtener los restaurantes:", error);
                        reject(error);
                    }
                });
            });
        }


        // Método AJAX para obtener salas de hotel
        // Método AJAX para obtener salas de hotel
        function obtenerSalasHotel() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: "/obtenerSalaHotel",
                    method: "GET",
                    dataType: "json",
                    success: function (salasHotel) {
                        const salasHotelAplanadas = aplanarSalasHotel(salasHotel);
                        window.salasHotelAplanadas = salasHotelAplanadas;
                        resolve();
                    },
                    error: function (error) {
                        console.error("Error al obtener las salas de hotel:", error);
                        reject(error);
                    }
                });
            });
        }






        Promise.all([obtenerHoteles(), obtenerRestaurantes(), obtenerSalasHotel()]).then(aplicarFiltros).catch(function (error) {
            console.error("Error al obtener los datos:", error);
        });


        // Función para aplanar los hoteles
        function aplanarHoteles(hoteles) {

            var hotelesAplanados = [];

            function procesarHotel(hotel) {

                if (typeof hotel === "object" && hotel !== null) {
                    hotelesAplanados.push(hotel);

                    if (hotel.destino && hotel.destino.hoteles) {

                        for (var i = 0; i < hotel.destino.hoteles.length; i++) {

                            procesarHotel(hotel.destino.hoteles[i]);

                        }
                    }
                }
            }

            for (var i = 0; i < hoteles.length; i++) {

                procesarHotel(hoteles[i]);


            }

            return hotelesAplanados;
        }


        // Función para aplanar los restaurantes

        function aplanarRestaurantes(restaurantes) {
            var restaurantesAplanados = [];

            function procesarRestaurante(restaurante) {
                if (typeof restaurante === "object" && restaurante !== null) {
                    restaurantesAplanados.push(restaurante);

                    if (restaurante.destino && restaurante.destino.restaurantes) {
                        for (var i = 0; i < restaurante.destino.restaurantes.length; i++) {
                            procesarRestaurante(restaurante.destino.restaurantes[i]);
                        }
                    }
                }
            }

            for (var i = 0; i < restaurantes.length; i++) {
                procesarRestaurante(restaurantes[i]);
            }

            return restaurantesAplanados;
        }


        // Función para aplanar las salas de hotel
        function aplanarSalasHotel(salasHotel) {
            var salasHotelAplanadas = [];

            function procesarSalaHotel(salaHotel) {
                if (typeof salaHotel === "object" && salaHotel !== null) {
                    salasHotelAplanadas.push(salaHotel);

                    if (salaHotel.destino && salaHotel.destino.salasHotel) {
                        for (var i = 0; i < salaHotel.destino.salasHotel.length; i++) {
                            procesarSalaHotel(salaHotel.destino.salasHotel[i]);
                        }
                    }
                }
            }

            for (var i = 0; i < salasHotel.length; i++) {
                procesarSalaHotel(salasHotel[i]);
            }

            return salasHotelAplanadas;
        }


        function mostrarHoteles(hoteles) {

            const resultadosContainer = $("#resultadosContainer");

           
            hoteles.forEach((hotel) => {

            	//ESTE ERA EL ORIGINAL
            //	const imagenUrl = hotel.listadoImagenesHotel && hotel.listadoImagenesHotel.length > 0 ? "imagenesHoteles/" + hotel.listadoImagenesHotel[0].urlImagenHotel : "ruta_de_la_imagen_predeterminada";
            	
            	const imagenUrl = hotel.listadoImagenesHotel && hotel.listadoImagenesHotel.length > 0 ? hotel.listadoImagenesHotel[0].urlImagenHotel : "ruta_de_la_imagen_predeterminada";



                // Crear elementos DOM para la tarjeta
                const cardDiv = $("<div>").addClass("col-md-4 mb-4");
                const cardContent = $("<div>").addClass("card");

                const img = $("<img>").attr("src", imagenUrl).attr("alt", hotel.nombreHotel).addClass("card-img-top").css({ "width": "100%", "height": "200px", "object-fit": "cover" });


                const cardBody = $("<div>").addClass("card-body");
                const cardTitle = $("<h5>").addClass("card-title").text(hotel.nombreHotel).css({ "text-align": "center" });

                const cardText = $("<p>").addClass("card-text").css({ "text-align": "center" });

                // Añadir ícono de estrella tantas veces como la cantidad de estrellas del hotel
                for (let i = 0; i < hotel.categoriaHotel; i++) {
                    const starIcon = $("<img>").attr("src", "recursos/Bootstrap/bootstrap-icons-1.10.4/star-fill.svg").css({ "width": "16px", "height": "16px" });
                    cardText.append(starIcon);
                }

                const cardButton = $("<a>").attr("href", "#").addClass("btn btn-primary").text("Ver más");
                const buttonContainer = $("<div>").addClass("text-center").append(cardButton);


                // Agregar elementos al DOM
                cardBody.append(cardTitle, cardText, buttonContainer);
                cardContent.append(img, cardBody);
                cardDiv.append(cardContent);
                resultadosContainer.append(cardDiv);
            });


        }

        // Función para mostrar los restaurantes
        function mostrarRestaurantes(restaurantes) {
            const resultadosContainer = $("#resultadosContainer");


            restaurantes.forEach((restaurante) => {
                const imagenUrl = restaurante.listadoImagenesRestaurante && restaurante.listadoImagenesRestaurante.length > 0 ? restaurante.listadoImagenesRestaurante[0].urlImagenRestaurante : "ruta_de_la_imagen_predeterminada";

                // Crear elementos DOM para la tarjeta
                const cardDiv = $("<div>").addClass("col-md-4 mb-4");
                const cardContent = $("<div>").addClass("card");
                const img = $("<img>").attr("src", imagenUrl).attr("alt", restaurante.nombreRestaurante).addClass("card-img-top").css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                const cardBody = $("<div>").addClass("card-body");
                const cardTitle = $("<h5>").addClass("card-title").text(restaurante.nombreRestaurante).css({ "text-align": "center" });
                const cardButton = $("<a>").attr("href", "#").addClass("btn btn-primary").text("Ver más");
                const buttonContainer = $("<div>").addClass("text-center").append(cardButton);

                // Agregar elementos al DOM
                cardBody.append(cardTitle, buttonContainer);
                cardContent.append(img, cardBody);
                cardDiv.append(cardContent);
                resultadosContainer.append(cardDiv);
            });
        }


        // Función para mostrar las salas de hotel
        function mostrarSalasHotel(salasHotel) {
            const resultadosContainer = $("#resultadosContainer");

        

            salasHotel.forEach((salaHotel) => {
   
                const imagenUrl = salaHotel.listadoImagenesSalaHotel && salaHotel.listadoImagenesSalaHotel.length > 0 ? salaHotel.listadoImagenesSalaHotel[0].urlImagenSalaHotel : "ruta_de_la_imagen_predeterminada";


                // Crear elementos DOM para la tarjeta
                const cardDiv = $("<div>").addClass("col-md-4 mb-4");
                const cardContent = $("<div>").addClass("card");
                const img = $("<img>").attr("src", imagenUrl).attr("alt", salaHotel.nombreSala).addClass("card-img-top").css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                const cardBody = $("<div>").addClass("card-body");
                const cardTitle = $("<h5>").addClass("card-title").text(salaHotel.nombreSala).css({ "text-align": "center" });
                const cardButton = $("<a>").attr("href", "#").addClass("btn btn-primary").text("Ver más");
                const buttonContainer = $("<div>").addClass("text-center").append(cardButton);

                // Agregar elementos al DOM
                cardBody.append(cardTitle, buttonContainer);
                cardContent.append(img, cardBody);
                cardDiv.append(cardContent);
                resultadosContainer.append(cardDiv);
            });
        }



        // Modificar la función para aplicar filtros
        function aplicarFiltros() {
            // Limpiar los resultados antes de agregar nuevos
            $("#resultadosContainer").empty();

            // Verifica los filtros
            if ($("#filtroRestaurante").prop("checked")) {
                mostrarRestaurantes(window.restaurantesAplanados);
            }

            if ($("#filtroHotel").prop("checked")) {
                mostrarHoteles(window.hotelesAplanados);
            }

            if ($("#filtroSalaHotel").prop("checked")) {
                mostrarSalasHotel(window.salasHotelAplanadas);
            }

            // Si ningún filtro está seleccionado, mostrar todo
            if (!$("#filtroRestaurante").prop("checked") && !$("#filtroHotel").prop("checked") && !$("#filtroSalaHotel").prop("checked")) {
                mostrarHoteles(window.hotelesAplanados);
                mostrarRestaurantes(window.restaurantesAplanados);
                mostrarSalasHotel(window.salasHotelAplanadas);
            }
        }

        // Escuchar los cambios en los checkboxes de los filtros de tipo de oferta
        $("#filtroHotel, #filtroRestaurante, #filtroSalaHotel").on("change", function () {
            aplicarFiltros();
        });

        // Llamar a las funciones para obtener hoteles y restaurantes cuando la página se carga
        obtenerHoteles();
        obtenerRestaurantes();
        obtenerSalasHotel();

    });

    </script>

</body>

</html>