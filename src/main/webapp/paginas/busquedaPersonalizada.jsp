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
	<div class="container-fluid bg-light mt-3">
		<div class="row">
			<!-- Añade una fila para mantener las columnas -->

			<!-- Filtros  -->
			<div class="col-lg-2">
				<h2>FILTROS</h2>


				<!-- Botón para restablecer todos los filtros -->
				<button id="resetearFiltros" class="btn btn-primary mb-3">Resetear
					filtros</button>

				<!-- Filtro por tipo de oferta -->
				<div class="mb-3">
					<h5>Tipo Oferta</h5>
					<div class="form-check">
						<input class="form-check-input filtro" type="checkbox"
							value="hotel" id="filtroHotel"> <label
							class="form-check-label" for="filtroHotel">Hoteles</label>
					</div>
					<div class="form-check">
						<input class="form-check-input filtro" type="checkbox"
							value="restaurante" id="filtroRestaurante"> <label
							class="form-check-label" for="filtroRestaurante">Restaurantes</label>
					</div>
					<div class="form-check">
						<input class="form-check-input filtro" type="checkbox"
							value="actividad" id="filtroActividad"> <label
							class="form-check-label" for="filtroActividad">Actividades</label>
					</div>
				</div>


				<!-- Filtro por servicios del hotel -->
				<div class="mb-3">
					<h5>Servicios Hotel</h5>
					<div class="form-check">
						<input class="form-check-input filtro servicios-hotel-checkbox"
							type="checkbox" value="piscina" id="filtroPiscina"> <label
							class="form-check-label" for="filtroPiscina">Piscina</label>
					</div>
					<div class="form-check">
						<input class="form-check-input filtro servicios-hotel-checkbox"
							type="checkbox" value="gimnasio" id="filtroGimnasio"> <label
							class="form-check-label" for="filtroGimnasio">Gimnasio</label>
					</div>
					<div class="form-check">
						<input class="form-check-input filtro servicios-hotel-checkbox"
							type="checkbox" value="terraza" id="filtroTerraza"> <label
							class="form-check-label" for="filtroTerraza">Terraza</label>
					</div>
					<div class="form-check">
						<input class="form-check-input filtro servicios-hotel-checkbox"
							type="checkbox" value="spa" id="filtroSpa"> <label
							class="form-check-label" for="filtroSpa">Spa</label>
					</div>
				</div>

			</div>





			<!-- Espacio en blanco (1 columna) -->
			<div class="col-lg-1"></div>


			<!-- Resultados  -->
			<div class="col-lg-9 bg-light">
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
	
		//Resetear todos los filtros
		$("#resetearFiltros").on("click", function() {

			$(".filtro").prop("checked", false);
		});
		

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


		function obtenerHoteles() {
		    $.ajax({
		        url: "/obtenerHoteles",
		        method: "GET",
		        dataType: "json", 
		        success: function(hoteles) {
		            // Aplanar hoteles y luego aplicar filtros
		            const hotelesAplanados = aplanarHoteles(hoteles);

		            // Guardar hotelesAplanados en una variable global para que esté disponible para otras funciones
		            window.hotelesAplanados = hotelesAplanados;
		            
		            aplicarFiltros();
		        },
		        error: function(error) {
		            console.error("Error al obtener los hoteles:", error);
		        }
		    });
		}

		

	
		function mostrarHoteles(hoteles) {
	   
		    const resultadosContainer = $("#resultadosContainer");
		    	 
		    // Limpiar el contenedor de resultados antes de agregar nuevas tarjetas
		    resultadosContainer.empty();

		    hoteles.forEach((hotel) => {

		        const imagenUrl = hotel.listadoImagenesHotel && hotel.listadoImagenesHotel.length > 0 ? hotel.listadoImagenesHotel[0].urlImagenHotel : "ruta_de_la_imagen_predeterminada";
   		     // Crear elementos DOM para la tarjeta
		        const cardDiv = $("<div>").addClass("col-md-4 mb-4");
		        const cardContent = $("<div>").addClass("card");
		        
		        const img = $("<img>").attr("src", imagenUrl).attr("alt", hotel.nombreHotel).addClass("card-img-top").css({"width": "100%", "height": "200px", "object-fit": "cover"});

		        
		        const cardBody = $("<div>").addClass("card-body");
		        const cardTitle = $("<h5>").addClass("card-title").text(hotel.nombreHotel).css({"text-align" : "center"});

		        const cardText = $("<p>").addClass("card-text").css({"text-align" : "center"});

		        // Añadir ícono de estrella tantas veces como la cantidad de estrellas del hotel
		        for (let i = 0; i < hotel.categoriaHotel; i++) {
		            const starIcon = $("<img>").attr("src", "recursos/Bootstrap/bootstrap-icons-1.10.4/star-fill.svg").css({"width": "16px", "height": "16px"});
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
		function aplicarFiltros() {
		    const hotelesFiltrados = hotelesAplanados.filter((hotel) => {
		        // Para cada checkbox de servicio, verifica si está seleccionado y si el hotel ofrece el servicio correspondiente
		        const cumpleFiltro = $(".servicios-hotel-checkbox").toArray().every((checkbox) => {
		            const servicio = checkbox.value; // Modifica esta línea para usar el valor del checkbox
		            return !checkbox.checked || hotel[servicio] === true;
		        });

		        return cumpleFiltro;
		    });

		    mostrarHoteles(hotelesFiltrados);
		}

		
		$(".servicios-hotel-checkbox").on("change", function() {
		    aplicarFiltros();
		});


		
		obtenerHoteles();
	
	</script>

</body>

</html>