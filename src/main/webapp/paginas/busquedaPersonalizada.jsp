<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/recursos/Bootstrap/Bootstrap4.6.2/css/bootstrap.min.css">

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

        .card {
            height: 360px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
            align-items: center;
        }

        .modal .modal-header {
            position: sticky;
            top: 0;
            background-color: #ffffff;
            /* Asegurar que el fondo del título no sea transparente */
            z-index: 10;
            /* Ajustar el índice z para que el título esté por encima del contenido del modal */
            padding: 1rem 1rem;
            /* Ajustar el padding del título según sea necesario */
        }

        .modal-dialog {
            max-width: 800px;
            /* Aumentar el ancho máximo del modal */
        }

        #contenedorMenus img {
            display: inline-block;
            margin-right: 10px;
        }

        .sala-imagen {
            width: 100%;
            /* ajusta el ancho como desees */
            max-width: 300px;
            /* establece un ancho máximo si lo necesitas */
            height: auto;
            /* mantiene la proporción de la imagen */
        }

        .subfiltroCss {
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

                        <img id="imagenCabecera" alt="" width=100% src="/imagenes/header.png">        
        </div>

           
    </div>
    <!-- MENU NAVEGAION CABECERA-->

    <!-- Fuente del menu: https://getbootstrap.com/docs/4.6/components/navbar/     -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">



        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav justify-content-between w-100">

                <li class="nav-item "><a class="nav-link" href="index.html">INICIO</a>
                </li>

                <li class="nav-item "><a class="nav-link" href="busquedaPersonalizada">BÚSQUEDA PERSONALIZADA</a></li>

                <li class="nav-item"><a class="nav-link" href="contacto">CONTACTO</a>
                </li>

                <li class="nav-item"><a class="nav-link" href="faq">FAQ</a></li>

                <li class="nav-item"><a id="iconoCarrito" href="carrito"> <img id="iconoCarritoImg"
                            src="recursos/Bootstrap/bootstrap-icons-1.10.4/cart-fill.svg" alt="Bootstrap" width="32"
                            height="32">
                    </a></li>

                <li class="nav-item"><a href="/redireccionUsuario" class="nav-link btn btn-primary"> <img
                            src="recursos/Bootstrap/bootstrap-icons-1.10.4/person-fill.svg" alt="Bootstrap" width="40"
                            height="32">
                    </a></li>

            </ul>
        </div>
    </nav>


    <!-- ********* FILTROS *********  -->
    <!-- PRINCIPAL -->
    <div class="container-fluid bg-light mt-3">
        <div class="row">
            <!-- Añade una fila para mantener las columnas -->
            <div class="col-lg-2 col-md-2 col-sm-2">
                <h2>FILTROS</h2>
                <!-- Botón para restablecer todos los filtros -->
                <button id="resetearFiltros" class="btn btn-primary mb-3">Resetear
                    filtros</button>

                <!-- Filtro Destino -->
                <div class="mb-3">
                    <h5>Destinos</h5>
                    <select class="form-select filtro" id="filtroDestinos">
                        <option selected value="">Ninguno</option>
                        <!-- Aquí se generarán las opciones de los destinos -->
                    </select>


                    <!-- Filtro por tipo de oferta -->
                    <h5>Tipo Oferta</h5>

                    <!-- Filtro Hotel -->
                    <div class="form-check">
                        <input class="form-check-input filtro" type="checkbox" value="hotel" id="filtroHotel"> <label
                            class="form-check-label" for="filtroHotel">Hoteles</label>

                        <!-- Subcategorías Hoteles -->
                        <div id="subcategoriasHoteles" style="display: none; margin-left: 20px;">
                            <div class="mb-3 ml-2">
                                <h6>Categoría Hotel:</h6>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="1"
                                        id="filtro1Estrella"> <label class="form-check-label" for="filtro1estrella"> 1
                                        <img class="estrella" src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
                                            alt="1 estrella" width="20" height="20">
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="2"
                                        id="filtro2Estrellas"> <label class="form-check-label" for="filtro2estrellas"> 2
                                        <img class="estrella" src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
                                            alt="2 estrellas" width="20" height="20">
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="3"
                                        id="filtro3Estrellas"> <label class="form-check-label" for="filtro3estrellas"> 3
                                        <img class="estrella" src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
                                            alt="3 estrellas" width="20" height="20">
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="4"
                                        id="filtro4Estrellas"> <label class="form-check-label" for="filtro4estrellas"> 4
                                        <img class="estrella" src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
                                            alt="4 estrellas" width="20" height="20">
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="5"
                                        id="filtro5Estrellas"> <label class="form-check-label" for="filtro5estrellas"> 5
                                        <img class="estrella" src="recursos/Bootstrap/bootstrap-icons-1.10.4/star.svg"
                                            alt="5 estrellas" width="20" height="20">
                                    </label>
                                </div>
                            </div>



                            <div class="mb-3 ml-2">
                                <h6>Precio Mín. Hotel:</h6>
                                <select id="precioMinimoHotel" class="filtro">
                                    <option value="">Ninguno</option>
                                    <option value="50">50€</option>
                                    <option value="100">100€</option>
                                    <option value="150">150€</option>
                                    <option value="200">200€</option>
                                    <option value="250">250€</option>
                                    <option value="300">300€</option>
                                    <option value="350">350€</option>
                                    <option value="400">400€</option>
                                </select>

                                <h6>Precio Máx. Hotel:</h6>
                                <select id="precioMaximoHotel" class="filtro">
                                    <option value="">Ninguno</option>
                                    <option value="50">50€</option>
                                    <option value="100">100€</option>
                                    <option value="150">150€</option>
                                    <option value="200">200€</option>
                                    <option value="250">250€</option>
                                    <option value="300">300€</option>
                                    <option value="350">350€</option>
                                    <option value="400">400€</option>
                                </select>
                            </div>

                            <div class="mb-3 ml-2">
                                <h6>Aforo Mín. Hotel:</h6>
                                <select id="aforoMinimoHotel" class="filtro">
                                    <option value="">Ninguno</option>
                                    <option value="10">10 personas</option>
                                    <option value="20">20 personas</option>
                                    <option value="30">30 personas</option>
                                    <option value="40">40 personas</option>
                                    <option value="50">50 personas</option>
                                    <option value="60">60 personas</option>
                                    <option value="70">70 personas</option>
                                    <option value="80">80 personas</option>
                                    <option value="90">90 personas</option>
                                    <option value="100">100 personas</option>

                                </select>

                                <h6>Aforo Máx. Hotel:</h6>
                                <select id="aforoMaximoHotel" class="filtro">
                                    <option value="">Ninguno</option>
                                    <option value="10">10 personas</option>
                                    <option value="20">20 personas</option>
                                    <option value="30">30 personas</option>
                                    <option value="40">40 personas</option>
                                    <option value="50">50 personas</option>
                                    <option value="60">60 personas</option>
                                    <option value="70">70 personas</option>
                                    <option value="80">80 personas</option>
                                    <option value="90">90 personas</option>
                                    <option value="100">100 personas</option>
                                </select>


                            </div>

                            <div class="mb-3 ml-2">
                                <h6>Servicios Hotel:</h6>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="piscina"
                                        id="filtroPiscina"> <label class="form-check-label"
                                        for="filtroPiscina">Piscina</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="gimnasio"
                                        id="filtroGimnasio"> <label class="form-check-label"
                                        for="filtroGimnasio">Gimnasio</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="terraza"
                                        id="filtroTerraza"> <label class="form-check-label"
                                        for="filtroTerraza">Terraza</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" value="spa" id="filtroSpa">
                                    <label class="form-check-label" for="filtroSpa">Spa</label>
                                </div>
                            </div>

                            <div class="mb-3">
                                <h6 class="subfiltroCss">Sala Hotel:</h6>


                                <div class="mb-3 ml-2">
                                    <h6>Aforo Mín.Sala Hotel:</h6>
                                    <select id="aforoMinimoSalaHotel" class="filtro">
                                        <option value="">Ninguno</option>
                                        <option value="10">10 personas</option>
                                        <option value="20">20 personas</option>
                                        <option value="30">30 personas</option>
                                        <option value="40">40 personas</option>
                                        <option value="50">50 personas</option>
                                        <option value="60">60 personas</option>
                                        <option value="70">70 personas</option>
                                        <option value="80">80 personas</option>
                                        <option value="90">90 personas</option>
                                        <option value="100">100 personas</option>

                                    </select>

                                    <h6>Aforo Máx.Sala Hotel:</h6>
                                    <select id="aforoMaximoSalaHotel" class="filtro">
                                        <option value="">Ninguno</option>
                                        <option value="10">10 personas</option>
                                        <option value="20">20 personas</option>
                                        <option value="30">30 personas</option>
                                        <option value="40">40 personas</option>
                                        <option value="50">50 personas</option>
                                        <option value="60">60 personas</option>
                                        <option value="70">70 personas</option>
                                        <option value="80">80 personas</option>
                                        <option value="90">90 personas</option>
                                        <option value="100">100 personas</option>
                                    </select>
                                </div>


                                <div class="mb-3 ml-3">
                                    <h6>Servicios Sala Hotel:</h6>
                                    <div class="form-check">
                                        <input class="form-check-input filtro" type="checkbox" value="equipoSonido"
                                            id="filtroEquipoSonido"> <label class="form-check-label"
                                            for="filtroEquipoSonido">Equipo
                                            de sonido</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input filtro" type="checkbox" value="proyector"
                                            id="filtroProyector"> <label class="form-check-label"
                                            for="filtroProyector">Proyector</label>
                                    </div>
                                </div>

                                <div class="mb-3 ml-2">
                                    <h6>Precio Mín. Sala Hotel:</h6>
                                    <select id="precioMinimoSalaHotel" class="filtro">
                                        <option value="">Ninguno</option>
                                        <option value="5">5€</option>
                                        <option value="10">10€</option>
                                        <option value="15">15€</option>
                                        <option value="20">20€</option>

                                    </select>

                                    <h6>Precio Máx. Sala Hotel:</h6>
                                    <select id="precioMaximoSalaHotel" class="filtro">
                                        <option value="">Ninguno</option>
                                        <option value="5">5€</option>
                                        <option value="10">10€</option>
                                        <option value="15">15€</option>
                                        <option value="20">20€</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                    </div>


                    <!-- Filtro Restaurante -->
                    <div class="form-check">
                        <input class="form-check-input filtro " type="checkbox" value="restaurante"
                            id="filtroRestaurante"> <label class="form-check-label"
                            for="filtroRestaurante">Restaurantes</label>
                    </div>


                    <!-- Subcategorías Restaurantes -->
                    <div id="subcategoriasRestaurantes" style="display: none; margin-left: 20px;">
                        <div class="mb-3 ml-2">
                            <h6>Tipo Restaurante:</h6>
                            <!-- Tipos de restaurantes -->
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="mediterraneo"
                                    id="filtroMediterraneo"> <label class="form-check-label"
                                    for="filtroMediterraneo">Mediterráneo</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="tapas" id="filtroTapas">
                                <label class="form-check-label" for="filtroTapas">Tapas</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="buffet" id="filtroBuffet">
                                <label class="form-check-label" for="filtroBuffet">Buffet</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="tematico"
                                    id="filtroTematico"> <label class="form-check-label"
                                    for="filtroTematico">Temático</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="italiano"
                                    id="filtroItaliano"> <label class="form-check-label"
                                    for="filtroItaliano">Italiano</label>
                            </div>

                        </div>


                        <div class="mb-3 ml-2">
                            <h6>Categoría Restaurante:</h6>
                            <!-- Imágenes de tenedores -->
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="1" id="tenedor1"> <img
                                    src="imagenes/tenedor.jpg" alt="1 tenedor" width="10" height="30">

                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="2" id="tenedor2"> <img
                                    src="imagenes/tenedor.jpg" alt="1 tenedor" width="10" height="30"> <img
                                    src="imagenes/tenedor.jpg" alt="2 tenedor" width="10" height="30">
                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="3" id="tenedor3"> <img
                                    src="imagenes/tenedor.jpg" alt="1 tenedor" width="10" height="30"> <img
                                    src="imagenes/tenedor.jpg" alt="2 tenedor" width="10" height="30"> <img
                                    src="imagenes/tenedor.jpg" alt="3 tenedor" width="10" height="30">
                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="4" id="tenedor4"> <img
                                    src="imagenes/tenedor.jpg" alt="1 tenedor" width="10" height="30"> <img
                                    src="imagenes/tenedor.jpg" alt="2 tenedor" width="10" height="30"> <img
                                    src="imagenes/tenedor.jpg" alt="3 tenedor" width="10" height="30"> <img
                                    src="imagenes/tenedor.jpg" alt="4 tenedor" width="10" height="30">
                            </div>
                        </div>


                        <div class="mb-3 ml-2">
                            <h6>Aforo Mín. Restaurante:</h6>
                            <select id="aforoMinimoRestaurante" class="filtro">
                                <option value="">Ninguno</option>
                                <option value="10">10 Personas</option>
                                <option value="20">20 Personas</option>
                                <option value="30">30 Personas</option>
                                <option value="40">40 Personas</option>
                                <option value="50">50 Personas</option>
                                <option value="60">60 Personas</option>
                                <option value="70">70 Personas</option>
                                <option value="80">80 Personas</option>
                                <option value="90">90 Personas</option>
                                <option value="100">100 Personas</option>
                            </select>

                            <h6>Precio Máx. Restaurante:</h6>
                            <select id="aforoMaximoRestaurante" class="filtro">
                                <option value="">Ninguno</option>
                                <option value="10">10 Personas</option>
                                <option value="20">20 Personas</option>
                                <option value="30">30 Personas</option>
                                <option value="40">40 Personas</option>
                                <option value="50">50 Personas</option>
                                <option value="60">60 Personas</option>
                                <option value="70">70 Personas</option>
                                <option value="80">80 Personas</option>
                                <option value="90">90 Personas</option>
                                <option value="100">100 Personas</option>
                            </select>
                        </div>

                        <div class="mb-3 ml-2">
                            <h6 class="subfiltroCss">Menú Restaurante:</h6>
                            <!-- Menús especiales -->
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="vegetariano"
                                    id="filtroVegetariano"> <label class="form-check-label"
                                    for="filtroVegetariano">Vegetariano</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="vegano" id="filtroVegano">
                                <label class="form-check-label" for="filtroVegano">Vegano</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input filtro" type="checkbox" value="celiaco"
                                    id="filtroCeliaco"> <label class="form-check-label"
                                    for="filtroCeliaco">Celíaco</label>
                            </div>
                        </div>

                    </div>


                    <!-- Filtro Actividades-->
                    <div class="form-check">
                        <input class="form-check-input filtro" type="checkbox" value="actividad" id="filtroActividad">
                        <label class="form-check-label" for="filtroActividad">Actividades</label>
                    </div>
                    <!-- Subcategorías Actividades-->
                    <div id="subcategoriasActividades" style="display: none;">
                        <div style="margin-left: 20px;">
                            <div class="mb-3 ml-4">
                                <h6>Tipo Actividad:</h6>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" id="aventura"> <label
                                        class="form-check-label" for="aventura">Aventura</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" id="cultura"> <label
                                        class="form-check-label" for="cultura">Cultura</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" id="ocio"> <label
                                        class="form-check-label" for="ocio">Ocio</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input filtro" type="checkbox" id="bienestar"> <label
                                        class="form-check-label" for="bienestar">Bienestar</label>
                                </div>
                            </div>

                            <div class="mb-3 ml-2">
                                <h6>Precio Mín. Actividad:</h6>
                                <select id="precioMinimoActividad" class="filtro">
                                    <option value="">Ninguno</option>
                                    <option value="50">50€</option>
                                    <option value="100">100€</option>
                                    <option value="150">150€</option>
                                    <option value="200">200€</option>
                                </select>

                                <h6>Precio Máx. Actividad:</h6>
                                <select id="precioMaximoActividad" class="filtro">
                                    <option value="">Ninguno</option>
                                    <option value="50">50€</option>
                                    <option value="100">100€</option>
                                    <option value="150">150€</option>
                                    <option value="200">200€</option>
                                </select>
                            </div>



                            <div class="mb-3 ml-2">
                                <h6>Aforo Mín. Actividad:</h6>
                                <select id="aforoMinimoActividad" class="filtro">
                                    <option value="">Ninguno</option>
                                    <option value="5">5 personas</option>
                                    <option value="10">10 personas</option>
                                    <option value="15">15 personas</option>
                                    <option value="20">20 personas</option>
                                </select>

                                <h6>Aforo Máx. Actividad:</h6>
                                <select id="aforoMaximoActividad" class="filtro">
                                    <option value="">Ninguno</option>
                                    <option value="5">5 personas</option>
                                    <option value="10">10 personas</option>
                                    <option value="15">15 personas</option>
                                    <option value="20">20 personas</option>
                                </select>

                            </div>
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
                    <!-- Aquí se agregarán las tarjetas de los hoteles, resturantes y actividades -->
                </div>
            </div>
        </div>
    </div>



    <!-----------------------------------------------------------MODALES--------------------------------------------------------------->

    <!-- MODAL HOTEL -->
    <div class="modal fade" id="hotelModal" tabindex="-1" role="dialog" aria-labelledby="hotelModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hotelModalLabel">Hotel</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>

                </div>
                <form action="/insertarElementoEnCarrito" method="POST">
                    <!-- OJO QUE HAY QUE PONER UNA RUTA -->
                    <div class="modal-body">
                        <div id="hotelContenedor">

                            <!-- Carrusel de imágenes -->
                            <div id="hotelImagenes">
                                <div id="hotelImagen">
                                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <!-- Las imágenes se agregarán aquí desde JavaScript -->
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                                            data-slide="prev"> <span class="carousel-control-prev-icon"
                                                aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a> <a class="carousel-control-next" href="#carouselExampleControls"
                                            role="button" data-slide="next"> <span class="carousel-control-next-icon"
                                                aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                            </div>


                            <!-- Datos del hotel -->
                            <div id="contenedorDatosHotel" style="width: 100%; padding: 0 10%; grid-column: 1/-1;">
                                <div id="hotelId" class="d-none text-center"></div>
                                <div id="nombreHotel" class="mb-3 text-center">
                                    <h4 class="text-center"></h4>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div id="categoriaHotel" class="mb-3"></div>
                                </div>
                                <div id="precioHotelContainer" class="mb-3 text-center">
                                    <h6>Precio</h6>
                                    <p id="precioHotelValor" class="text-center"></p>
                                </div>
                                <div id="serviciosHotel" class="mb-3 text-center">
                                    <h6>Servicios</h6>
                                    <p id="gimnaseoHotel" class="text-center"></p>
                                    <p id="piscinaHotel" class="text-center"></p>
                                    <p id="terrazaHotel" class="text-center"></p>
                                    <p id="spaHotel" class="text-center"></p>
                                </div>
                                <div id="direccionHotel" class="mb-3 text-center">
                                    <h6>Dirección</h6>
                                    <p id="direccionHotelValor" class="text-center"></p>
                                </div>
                            </div>
                        </div>

                        <!-- DATOS Y FOTOS DE SALA HOTEL -->
                        <div id="salasContenedor" class="mt-5" style="width: 100%; padding: 0 10%; grid-column: 1/-1;">
                            <div id="contenedorSalas" class="mb-3 mt-5 text-center">
                                <h6>Salas de Reuniones:</h6>
                            </div>
                            <div id="salaImagen"></div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <!-- Botón Reservar de Hotel -->
                        <button type="submit" class="btn btn-primary btn-reserva">Reservar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>



    <!------------------------------------ MODAL RESTAURANTE -------------------------------------------------------->
    <div class="modal fade" id="restauranteModal" tabindex="-1" role="dialog" aria-labelledby="restauranteModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="restauranteModalLabel">Restaurante</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/rutaControlador" method="POST">
                    <!-- OJO QUE HAY QUE PONER UNA RUTA -->
                    <div class="modal-body">
                        <div id="restauranteContenedor">


                            <!-- Carrusel de imágenes -->
                            <div id="restauranteImagenes">
                                <div id="restauranteImagen">
                                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <!-- Las imágenes se agregarán aquí desde JavaScript -->
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                                            data-slide="prev"> <span class="carousel-control-prev-icon"
                                                aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a> <a class="carousel-control-next" href="#carouselExampleControls"
                                            role="button" data-slide="next"> <span class="carousel-control-next-icon"
                                                aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                            </div>


                            <div id="contenedorDatosRestaurante"
                                style="width: 100%; padding: 0 10%; grid-column: 1/-1;">
                                <div id="restauranteId" class="d-none text-center"></div>
                                <div id="nombreRestaurante" class="mb-3 text-center">
                                    <h4 class="text-center"></h4>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div id="categoriaRestaurante" class="mb-3 text-center"></div>
                                </div>
                                <div id="tipoRestaurante" class="mb-3 text-center">
                                    <h6>Tipo de comida:</h6>
                                    <p id="mediterraneoRestaurante" class="text-center"></p>
                                    <p id="tapasRestaurante" class="text-center"></p>
                                    <p id="buffetRestaurante" class="text-center"></p>
                                    <p id="tematicoRestaurante" class="text-center"></p>
                                    <p id="italianoRestaurante" class="text-center"></p>
                                </div>
                                <div id="direccionRestaurante" class="mb-3 text-center">
                                    <h6>Dirección</h6>
                                    <p id="direccionRestauranteValor" class="text-center"></p>
                                </div>
                            </div>

                        </div>

                        <div class="mt-5" id="menusContenedor" style="width: 100%; padding: 0 10%; grid-column: 1/-1;">
                            <div id="contenedorMenus" class="mb-3 text-center">
                                <h6>Menus:</h6>
                            </div>
                            <!--<div class="menu-imagen-container d-flex justify-content-center flex-wrap"> añado desde jquery pq no sale de otra forma-->
                        </div>


                        <!-- BOTON RESERVA DE MODAL RESTAURANTE -->

                        <div class="modal-footer">
                            <!-- Botón Reservar -->
                            <button type="submit" class="btn btn-primary btn-reserva">Reservar</button>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!------------------------------------ MODAL ACTIVIDAD -------------------------------------------------------->
    <div class="modal fade" id="actividad-Modal" tabindex="-1" role="dialog" aria-labelledby="actividadModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="actividadModalLabel">Actividad</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/rutaControlador" method="POST">
                    <!-- OJO QUE HAY QUE PONER UNA RUTA -->
                    <div class="modal-body">


                        <!-- Carrusel de imágenes -->
                        <div id="restauranteActividad">
                            <div id="actividadImagen">
                                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <!-- Las imágenes se agregarán aquí desde JavaScript -->
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                                        data-slide="prev"> <span class="carousel-control-prev-icon"
                                            aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a> <a class="carousel-control-next" href="#carouselExampleControls" role="button"
                                        data-slide="next"> <span class="carousel-control-next-icon"
                                            aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div id="contenedorDatosActividad" style="width: 100%; padding: 0 10%; grid-column: 1/-1;">
                            <div id="actividadId" class="d-none"></div>

                            <div id="nombreActividad" class="mb-3 text-center mt-5">
                                <h4 class="text-center"></h4>
                            </div>

                            <div id="tipoActividad" class="mb-3 text-center">
                                <h6>Tipo de actividad</h6>
                                <p id="aventuraActividad" class="text-center "></p>
                                <p id="culturaActividad" class="text-center"></p>
                                <p id="ocioActividad" class="text-center"></p>
                                <p id="bienestarActividad" class="text-center"></p>
                            </div>
                            <div id="precioActividadContainer" class="mb-3 text-center">
                                <h6>Precio</h6>
                                <p id="precioActividadValor" class="text-center"></p>
                            </div>
                            <div id="direccionActividad" class="mb-3 text-center">
                                <h6>Dirección</h6>
                                <p id="direccionActividadValor" class="text-center"></p>
                            </div>
                        </div>
                        
                   <!-- BOTON RESERVA DE MODAL -->

                        <div class="modal-footer">
                            <!-- Botón Reservar -->
                            <button type="submit" class="btn btn-primary btn-reserva">Reservar</button>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>



    <!------------------------------------------------------------------- Footer----------------------------------------------------------------------->
    <!-- Footer-->
    <footer class="footer mt-auto py-3 mb-0">
        <div class="container" align="center">
            <span class="text-muted"> Gala Gallardo García Y Cristian
                Fuerte Santas</span>
        </div>
    </footer>
    <!----------------------------------------------------------------------- Fin de HTML --------------------------------------------------------------- -->
    <script>

        $(document).ready(function () {


            console.log('Id del usuario: ${sessionScope.idUsuario}');



            // Variable para guardar el id de la actividad seleccionada
            let idActividadSeleccionada = null;

            // Variable para guardar el id del hotel seleccionado
            let idHotelSeleccionado = null;

            // Variable para guardar el id del restaurante seleccionado
            let idRestauranteSeleccionado = null;

            // Array para guardar los ids de las salas seleccionadas
            let idsSalasSeleccionadas = [];


            // Array para guardar los ids de los precios de los menús seleccionados
            let preciosSeleccionados = [];




            //recoje el id de la actividad selccionada para añadirlo al carrito
            $(document).on('click', '.btn-actividad', function () {

                // Recoge el id de actividad
                var idActividad = $(this).data('actividad-id');

                idActividadSeleccionada = idActividad;
            });


            //recoje el id del hotel selccionado para añadirlo al carrito
            $(document).on('click', '.btn-hotel', function () {

                // Recoge el id del hotel
                var idHotel = $(this).data('hotel-id');

                idHotelSeleccionado = idHotel;
            });

            // Recoje el id del restaurante seleccionado para añadirlo al carrito
            $(document).on('click', '.btn-restaurante', function () {

                // Recoge el id del restaurante
                var idRestaurante = $(this).data('restaurante-id');

                idRestauranteSeleccionado = idRestaurante;
            });




            // Recoje los ids de las sala hotel seleccionadas para añadirlo al carrito
            $(document).on('change', 'input[name="salaSeleccionada"]', function () {

                // Recoge el id de la sala y lo convierte a número
                var idSala = Number($(this).val());

                if ($(this).is(':checked')) {

                    // Si el checkbox está marcado, añade el id al array
                    idsSalasSeleccionadas.push(idSala);

                } else {

                    // Si el checkbox se desmarca, elimina el id del array
                    const index = idsSalasSeleccionadas.indexOf(idSala);

                    if (index > -1) {
                        idsSalasSeleccionadas.splice(index, 1);
                    }
                }
            });





            $(document).on('click', '.menu-checkbox', function () {

                var menuSeleccionado = $(this);
                var parentDiv = $(this).parent();
                var precioMenu;
                var numeroMenu;

                if (parentDiv.hasClass('divPrecioMenuNormal')) {
                    precioMenu = Number(parentDiv.find('.precioMenuNormal').text().replace('Precio Menú Normal: ', ''));
                    numeroMenu = 1;
                } else if (parentDiv.hasClass('divPrecioMenuVegetariano')) {
                    precioMenu = Number(parentDiv.find('.precioMenuVegetariano').text().replace('Precio Menú Vegetariano: ', ''));
                    numeroMenu = 2;
                } else if (parentDiv.hasClass('divPrecioMenuVegano')) {
                    precioMenu = Number(parentDiv.find('.precioMenuVegano').text().replace('Precio Menú Vegano: ', ''));
                    numeroMenu = 3;
                } else if (parentDiv.hasClass('divPrecioMenuCeliaco')) {
                    precioMenu = Number(parentDiv.find('.precioMenuCeliaco').text().replace('Precio Menú Celiaco: ', ''));
                    numeroMenu = 4;
                }

                console.log('Menu ' + numeroMenu + ': ' + precioMenu);

                var menuPrecio = numeroMenu + ':' + precioMenu;

                if (menuSeleccionado.is(':checked')) {
                    preciosSeleccionados.push(menuPrecio);
                } else {
                    preciosSeleccionados = preciosSeleccionados.filter(function (menu) {
                        return menu !== menuPrecio;
                    });
                }
            });



            $(document).on('click', '.btn-reserva', function (e) {
                e.preventDefault();

                // Transforma los arrays de string a integers
                var idsSalas = idsSalasSeleccionadas.map(Number);
                // var idsMenus = idsMenusSeleccionados.map(Number);

                console.log(idHotelSeleccionado);
                console.log(typeof idsSalasSeleccionadas);
                console.log(idsSalasSeleccionadas);

                // Haz un POST al servidor
                $.ajax({
                    url: '/insertarElementoEnCarrito',
                    method: 'POST',
                    data: {
                        idHotel: idHotelSeleccionado,
                        idActividad: idActividadSeleccionada,
                        idsSalasHotelString: JSON.stringify(idsSalas),
                        idRestaurante: idRestauranteSeleccionado,
                        preciosSeleccionadosString: JSON.stringify(preciosSeleccionados)
                    },
                    success: function (response) {
                        console.log("Se ha enviado bien");
                        location.reload();

                    },
                    error: function () {
                        console.log("No se ha enviado bien");
                    }
                });
            });


            //FASE 1: PROCESAMOS LOS DATOS DE BD PARA MOSTRARLOS EN LA VISTA

            //PASO 1.RECOGEMOS LOS DATOS DE LA BD CON SOLICITUD AJAX 
            //Nota: mediante llamada AJAX al backend obtenemos todos los objetos con peticion GET segun la ruta url. 
            //Cuando la llamada está en 200, recibimos los datos de los objetos pero en JSON

            //1.1 HOTELES
            function obtenerHoteles() {
                return new Promise((resolve, reject) => {
                    $.ajax({
                        url: "/obtenerHoteles",
                        method: "GET",
                        dataType: "json",
                        success: function (hoteles) {						  //Cuando ajax haya recogido los datos JSON
                            const hotelesAplanados = aplanarHoteles(hoteles); //Llamamos a la funcion aplanarHoteles para guardarlos en arrays
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


            //1.2 RESTAURANTES
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

            //1.3 ACTIVIDADES
            function obtenerActividades() {
                return new Promise((resolve, reject) => {
                    $.ajax({
                        url: "/obtenerActividades",
                        method: "GET",
                        dataType: "json",
                        success: function (actividades) {

                            const actividadesAplanados = aplanarActividades(actividades);
                            window.actividadesAplanados = actividadesAplanados;
                            resolve();
                        },
                        error: function (error) {
                            console.error("Error al obtener las actividades:", error);
                            reject(error);
                        }
                    });
                });
            }


            //PASO 2. en success de ajax, PROCESAMOS LOS DATOS RECIBIDOS
            // Nota: 



            //2.1 HOTELES: Guardamos los datos y los devolvemos array
            function aplanarHoteles(hoteles) {

                var hotelesAplanados = [];

                function procesarHotel(hotel) {

                    if (typeof hotel === "object" && hotel !== null) {
                        hotelesAplanados.push(hotel); //llamamos 

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


            //2.2 RESTURANTE: Guardamos los datos y los devolvemos array      
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

            //2.2 ACTIVIDADES: Guardamos los datos y los devolvemos array
            //nota: bueno, pues resulta que este no funcioba pq duplicaba los objetos :/ así que lo he modificado 

            function aplanarActividades(actividades) {
                var actividadesAplanadas = [];
                var actividadesAgregadas = new Set(); // Set para mantener un registro de los objetos que ya se agregaron

                function procesarActividad(actividad) {
                    if (typeof actividad === "object" && actividad !== null && !actividadesAgregadas.has(actividad.idActividad)) { // Verificar si el objeto ya se agregó
                        actividadesAgregadas.add(actividad.idActividad); // Agregar el objeto al Set de objetos agregados
                        actividadesAplanadas.push(actividad);
                    }
                }

                for (var i = 0; i < actividades.length; i++) {
                    procesarActividad(actividades[i]);
                    if (actividades[i].destino && actividades[i].destino.actividades) {
                        for (var j = 0; j < actividades[i].destino.actividades.length; j++) {
                            procesarActividad(actividades[i].destino.actividades[j]);
                        }
                    }
                }

                return actividadesAplanadas;
            }




            //PASO 3. USAMOS LOS OBJETOS (arrays) PROCESADOS, Y LOS PREPAREMOS PARA LA VISTA  

            //3.1 HOTEL: Funcion para mostrar los hoteles
            function mostrarHoteles(hoteles) {


                const resultadosContainer = $("#resultadosContainer");

                //PASO 1. CARDS HOTEL: Llamamos a la funcion para crear las cards en el DOM 
                //PASO 1. TARJETAS: Crear elementos DOM para las CARDS DE HOTEL


                hoteles.forEach((hotel) => {

                    const imagenUrl = hotel.listadoImagenesHotel && hotel.listadoImagenesHotel.length > 0 ? hotel.listadoImagenesHotel[0].urlImagenHotel : "ruta_de_la_imagen_predeterminada";

                    const cardDiv = $("<div>").addClass("col-md-4 mb-4");
                    const cardContent = $("<div>").addClass("card");

                    const img = $("<img>").attr("src", imagenUrl).attr("alt", hotel.nombreHotel).addClass("card-img-top").css({ "text-align": "center", "width": "100%", "height": "200px", "object-fit": "cover" });

                    const cardBody = $("<div>").addClass("card-body");
                    const cardTitle = $("<h5>").addClass("card-title").text(hotel.nombreHotel).css({ "text-align": "center" });

                    const cardText = $("<p>").addClass("card-text").css({ "text-align": "center" });

                    // Añadir icono de estrella tantas veces como la cantidad de estrellas del hotel
                    for (let i = 0; i < hotel.categoriaHotel; i++) {
                        const starIcon = $("<img>").attr("src", "recursos/Bootstrap/bootstrap-icons-1.10.4/star-fill.svg").css({ "width": "16px", "height": "16px" });
                        cardText.append(starIcon);
                    }



                    //const cardButton = $("<a>").attr("href", "#").attr("data-hotel-id", hotel.idHotel).addClass("btn btn-primary").text("Ver más"); //recogemos el ID del Hotel Pulasdo
                    const cardButton = $("<a>").attr("href", "#").attr("data-hotel-id", hotel.idHotel).addClass("btn btn-primary btn-hotel").text("Ver más");
                    const buttonContainer = $("<div>").addClass("text-center").append(cardButton);

                    // Agregar elementos al DOM
                    cardBody.append(cardTitle, cardText, buttonContainer);
                    cardContent.append(img, cardBody);
                    cardDiv.append(cardContent);
                    resultadosContainer.append(cardDiv);
                });



                //PASO 2. MODAL HOTEL: Añadir elementos DOM para el MODAL DE HOTEL que se activará cuando el usuario pulse el btn VER MAS 
                $(document).on("click", ".btn-hotel", function () {
                    const hotelId = $(this).data("hotel-id");
                    const hotel = hoteles.find(h => h.idHotel === hotelId);
                    const contador = 0;

                    if (!hotel) return;

                    // Limpiar imágenes anteriores del carrusel
                    $("#carouselExampleControls .carousel-inner").empty();

                    //FOTOS HOTEL: Agregar imágenes del restaurante al carrusel
                    const listadoImagenesHotel = hotel.listadoImagenesHotel;
                    if (listadoImagenesHotel && listadoImagenesHotel.length > 0) { //Recorremos el array y si lenght es > de 0, es que hay fotos
                        listadoImagenesHotel.forEach((imagenHotel, index) => {
                            const carouselItem = $("<div>").addClass("carousel-item");
                            if (index === 0) {
                                carouselItem.addClass("active");
                            }
                            const img = $("<img>")
                                .attr("src", imagenHotel.urlImagenHotel)
                                .attr("alt", `Imagen ${index + 1} de ${hotel.nombreHotel}`)
                                .css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                            carouselItem.append(img);
                            $("#carouselExampleControls .carousel-inner").append(carouselItem);
                        });
                    } else {
                        // Agregar imagen predeterminada si no hay imágenes disponibles
                        const carouselItem = $("<div>").addClass("carousel-item active");
                        const img = $("<img>")
                            .attr("src", "ruta_de_la_imagen_predeterminada")
                            .attr("alt", `Imagen predeterminada de ${hotel.nombreHotel}`)
                            .css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                        carouselItem.append(img);
                        $("#carouselExampleControls .carousel-inner").append(carouselItem);
                    }


                    // Rellenamos los datos del hotel en el modal
                    $("#hotelModalLabel").text(hotel.nombreHotel);
                    $("#categoriaHotel").html(createStarsHTML(hotel.categoriaHotel)); //llamo a la función del bucle for para crear las estrellas 
                    $("#direccionHotelValor").text(hotel.direccionHotel);
                    $("#precioHotelValor").text(hotel.precioHotel + "€");


                    //Campos booleanos de Hotel (true o false)
                    $("#gimnaseoHotel").text(hotel.gimnaseoHotel ? "Gimnasio" : "");
                    $("#piscinaHotel").text(hotel.piscinaHotel ? "Piscina" : "");
                    $("#terrazaHotel").text(hotel.terrazaHotel ? "Terraza" : "");
                    $("#spaHotel").text(hotel.spaHotel ? "Spa" : "");

                    $("#contenedorSalas").empty(); //Limpiamos el contenedor 
                    for (let i = 0; i < hotel.salasHotel.length; i++) {
                        // Añadimos los datos del objeto al Modal
                        // Verificamos que hayan datos y fotos, si no el modal no se abre 
                        if (hotel.salasHotel[i].listadoImagenesSalaHotel && hotel.salasHotel[i].listadoImagenesSalaHotel.length > 0) {
                            $("#contenedorSalas").append(
                                '<div class="row mb-4 mt-5">' + // Le damos el diseño 
                                '<div class="col-sm-6 d-flex align-items-center justify-content-center">' + // Columna de la izquierda con los datos de la sala
                                '<div class="sala-info">' +
                                '<input type="checkbox" name="salaSeleccionada" value="' + hotel.salasHotel[i].idSalaHotel + '"> Seleccionar sala : <br>' + // Checkbox
                                '<p><strong> ' + hotel.salasHotel[i].nombreSala + '</strong></p>' +
                                '<p>Aforo: ' + hotel.salasHotel[i].aforoSala + ' personas</p>' +
                                '<p>Metros: ' + hotel.salasHotel[i].metrosSala + 'm2</p>' +
                                '<p>Precio: ' + hotel.salasHotel[i].precioSala + '€</p>' +
                                '<p>Equipo de sonido: ' + (hotel.salasHotel[i].equipoSonidoSala ? 'Sí' : 'No') + '</p>' +
                                '<p>Proyector: ' + (hotel.salasHotel[i].proyectorSala ? 'Sí' : 'No') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-sm-6 d-flex align-items-center justify-content-center">' + // Columna de la derecha con la imagen
                                '<div class="sala-imagen-container">' +
                                '<img class="sala-imagen" src=" ' + hotel.salasHotel[i].listadoImagenesSalaHotel[0].urlImagenSalaHotel + '" alt="Imagen de la sala ' + hotel.salasHotel[i].nombreSala + '">' +
                                '</div>' +
                                '</div>' +
                                '</div>'
                            );
                        }
                    }




                    // Mostramos el modal
                    $("#hotelModal").modal("show");

                });

            }//ESTE ES EL CIERRE DE LA FUNCION MOSTRAR HOTEL. NO LO ELIMINES

            //3.2 RESTAURANTE: Funcion para mostrar los restaurantes
            function mostrarRestaurantes(restaurantes) {

                //PASO 1. CARD RESTAURANTE: Llamamos a la funcion para crear las cards
                const resultadosContainer = $("#resultadosContainer");

                restaurantes.forEach((restaurante) => {
                    const imagenUrl = restaurante.listadoImagenesRestaurante && restaurante.listadoImagenesRestaurante.length > 0 ? restaurante.listadoImagenesRestaurante[0].urlImagenRestaurante : "ruta_de_la_imagen_predeterminada";


                    // Crear elementos DOM para la tarjeta
                    const cardDiv = $("<div>").addClass("col-md-4 mb-4");
                    const cardContent = $("<div>").addClass("card");
                    const img = $("<img>").attr("src", imagenUrl).attr("alt", restaurante.nombreRestaurante).addClass("card-img-top").css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                    const cardBody = $("<div>").addClass("card-body");
                    const cardTitle = $("<h5>").addClass("card-title").text(restaurante.nombreRestaurante).css({ "text-align": "center" });
                    const cardButton = $("<a>").attr("href", "#").addClass("btn btn-primary btn-restaurante").text("Ver más").attr("data-restaurante-id", restaurante.idRestaurante);



                    const buttonContainer = $("<div>").addClass("text-center").append(cardButton);

                    // Agregar elementos al DOM
                    cardBody.append(cardTitle, buttonContainer);
                    cardContent.append(img, cardBody);
                    cardDiv.append(cardContent);
                    resultadosContainer.append(cardDiv);
                });



                //PASO 2. MODAL RESTAURANTE: Añadir elementos DOM para el MODAL DE RESTAURANTE que se activará cuando el usuario pulse el btn VER MAS 
                $(document).on("click", ".btn-restaurante", function () {
                    const restauranteId = $(this).data("restaurante-id");
                    const restaurante = restaurantes.find(h => h.idRestaurante === restauranteId);

                    if (!restaurante) return;

                    // Limpiar imágenes anteriores del carrusel
                    $("#carouselExampleControls .carousel-inner").empty();

                    //FOTOS RESTURANTE: Agregar imágenes del restaurante al carrusel
                    const listadoImagenesRestaurante = restaurante.listadoImagenesRestaurante;
                    if (listadoImagenesRestaurante && listadoImagenesRestaurante.length > 0) { //Recorremos el array y si lenght es > de 0, es que hay fotos
                        listadoImagenesRestaurante.forEach((imagenRestaurante, index) => {
                            const carouselItem = $("<div>").addClass("carousel-item");
                            if (index === 0) {
                                carouselItem.addClass("active");
                            }
                            const img = $("<img>")
                                .attr("src", imagenRestaurante.urlImagenRestaurante)
                                .attr("alt", `Imagen ${index + 1} de ${restaurante.nombreRestaurante}`)
                                .css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                            carouselItem.append(img);
                            $("#carouselExampleControls .carousel-inner").append(carouselItem);
                        });
                    } else {
                        // Agregar imagen predeterminada si no hay imágenes disponibles
                        const carouselItem = $("<div>").addClass("carousel-item active");
                        const img = $("<img>")
                            .attr("src", "ruta_de_la_imagen_predeterminada")
                            .attr("alt", `Imagen predeterminada de ${restaurante.nombreRestaurante}`)
                            .css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                        carouselItem.append(img);
                        $("#carouselExampleControls .carousel-inner").append(carouselItem);
                    }


                    //FOTOS MENUS: Añadimos también las fotos de los menus const menus = restaurante.menusRestaurante;
                    const menus = restaurante.menusRestaurante;
                    const imagenesMenus = []; // Nuevo array para almacenar las imagenes creadas

                    menus.forEach((menu, index) => {
                        const menuElement = $("<div>").addClass("menu-element");
                        menuElement.append($("<h6>").text(`Menú ${index + 1}`));

                        const menuImagenContainer = $("<div>").addClass("menu-imagen-container");
                        const listadoImagenesMenuRestaurante = menu.listadoImagenesMenuRestaurante;
                        if (listadoImagenesMenuRestaurante && listadoImagenesMenuRestaurante.length > 0) {//Recorremos el array y si lenght es > de 0, es que hay fotos
                            listadoImagenesMenuRestaurante.forEach((imagen, imgIndex) => {
                                const imgElement = $("<img>")
                                    .attr("src", imagen.urlImagenMenuRestaurante)
                                    .attr("alt", `Imagen menú ${index + 1} imagen ${imgIndex + 1}`)
                                    .css("width", "100px")
                                    .css("height", "100px")
                                    .css("margin-top", "20px")
                                    .css("margin-right", "10px");
                                imagenesMenus.push(imgElement); // Guardamos la imagen en el array
                            });
                        } else { // Si no hay fotos del menu, agrego una imagen predeterminada si no hay imágenes disponibles

                            const imgElement = $("<img>")
                                .attr("src", "ruta_de_la_imagen_predeterminada")
                                .attr("alt", `Imagen predeterminada del menú ${index + 1}`)
                                .css("width", "100px")
                                .css("height", "100px");
                            imagenesMenus.push(imgElement); // Añado al array
                        }

                        menuElement.append(menuImagenContainer);
                    });

                    //MODAL RESTAURANTE: 
                    // Rellenamos los datos del restaurante en el modal
                    $("#restauranteModalLabel").text(restaurante.nombreRestaurante);
                    $("#categoriaRestaurante").html(createTenedoresHTML(restaurante.categoriaRestaurante)); // Llamo a la función del bucle for para crear las estrellas ***ME HE QUEDADO AQUI
                    $("#direccionRestauranteValor").text(restaurante.direccionRestaurante);

                    //Le pasamos el tipo de restaurante al Modal
                    let tipoRestaurante = "";
                    switch (restaurante.tipoRestaurante) { //no puedo usar el mismo patrón que en hotel, no me lo imprime bien los booleanos para restaurantes. Dejamos switch
                        case "Mediterraneo":
                            tipoRestaurante = "Mediterraneo";
                            break;
                        case "Tapas":
                            tipoRestaurante = "Tapas";
                            break;
                        case "Buffet":
                            tipoRestaurante = "Buffet";
                            break;
                        case "Temático":
                            tipoRestaurante = "Temático";
                            break;
                        case "Italiano":
                            tipoRestaurante = "Italiano";
                            break;
                        default:
                            tipoRestaurante = "Desconocido";
                    }
                    $("#tipoRestaurante").text(tipoRestaurante);

                    $("#contenedorMenus").empty(); //Limpia el contenedor    

                    //Recogemos el menuRestaurante de Menu y los imprimimos
                    //Añadimos tambien un checkbox en cada línea del tipo de menu, que al pulsar activará un input number para saber el núm de personas por menu (enfocado para la reserva y el calculo del precio)
                    for (let i = 0; i < restaurante.menusRestaurante.length; i++) {

                        const menu = restaurante.menusRestaurante[i];

                        console.log(menu)

                        let menuDisponible = '';

                        if (menu.precioMenuNormal > 0) {
                            menuDisponible += '<div class=" menu-div divPrecioMenuNormal"><input type="checkbox" class="menu-checkbox menuNormalSeleccionado" value="' + menu.precioMenuNormal + '"> <p class="precioMenuNormal">Precio Menú Normal: ' + menu.precioMenuNormal + '</div>';
                        }


                        if (menu.precioMenuVegetariano > 0) {
                            menuDisponible += '<div class="menu-div divPrecioMenuVegetariano"><input type="checkbox" class="menu-checkbox" name="menuVegetarianoSeleccionado" value="' + menu.idMenusRestaurante + '"> <p class="precioMenuVegetariano">Precio Menú Vegetariano: ' + menu.precioMenuVegetariano + '</div>';
                        }

                        if (menu.precioMenuVegano > 0) {
                            menuDisponible += '<div class="menu-div divPrecioMenuVegano"><input type="checkbox"  class="menu-checkbox" name="menuVeganoSeleccionado" value="' + menu.idMenusRestaurante + '"> <p class="precioMenuVegano">Precio Menú Vegano: ' + menu.precioMenuVegano + '</div>';
                        }

                        if (menu.precioMenuCeliaco > 0) {
                            menuDisponible += '<div class="menu-div divPrecioMenuCeliaco"><input type="checkbox"  class="menu-checkbox" name="menuRestauranteSeleccionado" value="' + menu.idMenusRestaurante + '"> <p class="precioMenuCeliaco">Precio Menú Celiaco: ' + menu.precioMenuCeliaco + '</div>';

                        }

                        if (menuDisponible) {
                            $("#contenedorMenus").append('<div class="menu-item">' +
                                '<div class="menu-info">' +
                                '<div class="menu-text-container">' +
                                menuDisponible +
                                '</div>' +
                                '</div>' +
                                '<div class="menu-imagen-container">' +
                                // Aquí es donde agregaremos las imágenes del array
                                '</div>' +
                                '</div><br>');
                        }

                        // Metos imágenes del array al contenedor #contenedorMenus
                        for (let i = 0; i < imagenesMenus.length; i++) {
                            $("#contenedorMenus").append(imagenesMenus[i]);
                        }


                    }

                    // Mostramos el modal
                    $("#restauranteModal").modal("show");

                }); //cierre del evento para crear checkbox. NO BORRAR. DANGER     



            }//ESTO ES EL CIERRE DE LA FUNCION OBTENER RESTAURANTE 


            //////////////////////////////////////////ACTIVIDAD//////////////////////////////////////////////////////////////////////////       

            //3.2 ACTIVIDAD: Funcion para mostrar las actividades
            //*************************************************
            // Agregar una variable global para controlar si el evento "click" ya se ha asignado    	    

            function mostrarActividades(actividades) {

                //PASO 1. CREAR CARD ACTIVIDAD
                const resultadosContainer = $("#resultadosContainer");


                actividades.forEach((actividad) => {


                    const imagenUrl = actividad.listadoImagenesActividad && actividad.listadoImagenesActividad.length > 0 ? actividad.listadoImagenesActividad[0].urlImagenActividad : "ruta_de_la_imagen_predeterminada";
                    //const imagenUrl = "Barcelona_Gallery-Hotel_Hotel_1.jpg"; 


                    // Crear elementos DOM para la tarjeta
                    const cardDiv = $("<div>").addClass("col-md-4 mb-4");
                    const cardContent = $("<div>").addClass("card");
                    const img = $("<img>").attr("src", imagenUrl).attr("alt", actividad.nombreActividad).addClass("card-img-top").css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                    const cardBody = $("<div>").addClass("card-body");
                    const cardTitle = $("<h5>").addClass("card-title").text(actividad.nombreActividad).css({ "text-align": "center" });
                    const cardButton = $("<a>").attr("href", "#").attr("data-actividad-id", actividad.idActividad).addClass("btn btn-primary btn-actividad").text("Ver más");
                    const buttonContainer = $("<div>").addClass("text-center").append(cardButton);

                    // Agregar elementos al DOM
                    cardBody.append(cardTitle, buttonContainer);
                    cardContent.append(img, cardBody);
                    cardDiv.append(cardContent);
                    resultadosContainer.append(cardDiv);


                });



                //PASO 2. PREPARAR LOS DATOS DEL MODAL: 

                $(document).on("click", ".btn-actividad", function () {

                    const actividadId = $(this).data("actividad-id");
                    const actividad = actividades.find(h => h.idActividad === actividadId);


                    if (!actividad) return;

                    //MODAL ACTIVIDAD CONTIENE: 
                    // Rellenamos los datos del hotel en el modal
                    $("#actividadModalLabel").text(actividad.nombreActividad);
                    $("#direccionActividadValor").text(actividad.direccionActividad);
                    $("#precioActividadValor").text(actividad.precioActividad + "€");

                    //Campos booleanos de Actividad Tipo 
                    $("#aventuraActividad").text(actividad.tipoActividad === "Aventura" ? "Aventura" : "");
                    $("#culturaActividad").text(actividad.tipoActividad === "Cultura" ? "Cultura" : "");
                    $("#ocioActividad").text(actividad.tipoActividad === "Ocio" ? "Ocio" : "");
                    $("#bienestarActividad").text(actividad.tipoActividad === "Bienestar" ? "Bienestar" : "");

                    //Añadimos la descripcion
                    $("#descripcionActividadValor").text(actividad.descripcionActividad);

                    // FOTOS ACTIVIDAD: Agregar imágenes de la actividad al carrusel
                    const listadoImagenesActividad = actividad.listadoImagenesActividad;

                    if (listadoImagenesActividad && listadoImagenesActividad.length > 0) { //Recorremos el array y si lenght es > de 0, es que hay fotos

                        listadoImagenesActividad.forEach((imagenActividad, index) => {

                            const carouselItem = $("<div>").addClass("carousel-item");

                            if (index === 0) {
                                carouselItem.addClass("active");
                            }

                            const img = $("<img>")
                                .attr("src", imagenActividad.urlImagenActividad)
                                .attr("alt", `Imagen ${index + 1} de ${actividad.nombreActividad}`)
                                .css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                            carouselItem.append(img);
                            $("#carouselExampleControls .carousel-inner").append(carouselItem);
                        });

                    } else {
                        // Agregar imagen predeterminada si no hay imágenes disponibles
                        const carouselItem = $("<div>").addClass("carousel-item active");
                        const img = $("<img>")
                            .attr("src", "ruta_de_la_imagen_predeterminada")
                            //.attr("alt", `Imagen predeterminada de ${actividad.nombreActividad}`)
                            .css({ "width": "100%", "height": "200px", "object-fit": "cover" });
                        carouselItem.append(img);
                        $("#carouselExampleControls .carousel-inner").append(carouselItem);
                    }

                    // Antes de mostrar el modal, nos aseguramos que se han cargado todas las imganes 
                    // Tenemos un problema, si pulsamos demasiado rapido en Ver Mas, en Actividades no de la tiempo a cargar img 
                    setTimeout(() => {
                        $("#actividad-Modal").modal("show");
                    }, 200);


                    // Mostramos el modal
                    $("#actividad-Modal").modal("show");

                });


            }//CIERRE FUNCION mostrarActividades. Por tu madre no la eliminas o CAOS


            //PASO 4. FILTROS DE BUSQUEDA: UNA VEZ TENEMOS LOS DATOS Y HEMOS PREPARARADO COMO SE MOSTRARÁN EN LAS VISTAS, PASAMOS LOS DATOS AL METODO MOSTRAR
            //                             ESTE EVENTO SE ACTIVARÁ SEGUN LOS CHECKBOX QUE PULSE EL USUARIO 
            //                             MOSTRANDO LAS OFERTAS EN CARDS, CON LOS DATOS CARGADOS SEGUN EL FILTRO SELECCIONADO





            //FUENTE: https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Array/filter

            //Funcion para aplicar filtros de las cards segun checkbox pulsados
            function aplicarFiltros() {

                let FILTRODESTINO = ""; // Este valor cambiará según el destino seleccionado por el usuario


                // Verificando los filtros principales
                const FILTRODESTINOSELECCIONADO = $('#filtroDestinos option:selected').text();
                const FILTRORESTAURANTE = $("#filtroRestaurante").prop("checked");
                const FILTROHOTEL = $("#filtroHotel").prop("checked");
                const FILTROACTIVIDAD = $("#filtroActividad").prop("checked");

                // Subfiltros de Hotel
                const FILTROPISCINA = $("#filtroPiscina").prop("checked");
                const FILTROGIMNASIO = $("#filtroGimnasio").prop("checked");
                const FILTROTERRAZA = $("#filtroTerraza").prop("checked");
                const FILTROSPA = $("#filtroSpa").prop("checked");

                const FILTRO1ESTRELLA = $("#filtro1Estrella").prop("checked");
                const FILTRO2ESTRELLAS = $("#filtro2Estrellas").prop("checked");
                const FILTRO3ESTRELLAS = $("#filtro3Estrellas").prop("checked");
                const FILTRO4ESTRELLAS = $("#filtro4Estrellas").prop("checked");
                const FILTRO5ESTRELLAS = $("#filtro5Estrellas").prop("checked");

                const PRECIOMINIMOHOTEL = parseFloat($("#precioMinimoHotel").val());
                const PRECIOMAXIMOHOTEL = parseFloat($("#precioMaximoHotel").val());

                //Subfiltros de Sala Hotel    
                const PRECIOMINIMOSALAHOTEL = parseFloat($("#precioMinimoSalaHotel").val());
                const PRECIOMAXIMOSALAHOTEL = parseFloat($("#precioMaximoSalaHotel").val());

                const AFOROMINIMOSALAHOTEL = parseInt($("#aforoMinimoSalaHotel").val());
                const AFOROMAXIMOSALAHOTEL = parseInt($("#aforoMaximoSalaHotel").val());

                const FILTROEQUIPOSONIDO = $("#filtroEquipoSonido").prop("checked");
                const FILTROPROYECTOR = $("#filtroProyector").prop("checked");

                //Subfiltros de Restaurante    
                const FILTROMEDITERRANEO = $("#filtroMediterraneo").prop("checked");
                const FILTROTAPAS = $("#filtroTapas").prop("checked");
                const FILTROBUFFET = $("#filtroBuffet").prop("checked");
                const FILTROTEMATICO = $("#filtroTematico").prop("checked");
                const FILTROITALIANO = $("#filtroItaliano").prop("checked");

                const FILTRO1TENEDOR = $("#tenedor1").prop("checked");
                const FILTRO2TENEDOR = $("#tenedor2").prop("checked");
                const FILTRO3TENEDOR = $("#tenedor3").prop("checked");
                const FILTRO4TENEDOR = $("#tenedor4").prop("checked");


                const AFOROMINIMORESTAURANTE = parseInt($("#aforoMinimoRestaurante").val());
                const AFOROMAXIMORESTAURANTE = parseInt($("#aforoMaximoRestaurante").val());

                //Subfiltros de Menu Restaurante
                const MENUVEGETARIANO = $("#filtroVegetariano").prop("checked");
                const MENUVEGANO = $("#filtroVegano").prop("checked");
                const MENUCELIACO = $("#filtroCeliaco").prop("checked");

                //Subfiltros de Actividad
                const FILTROAVENTURA = $("#aventura").prop("checked");
                const FILTROCULTURA = $("#cultura").prop("checked");
                const FILTROOCIO = $("#ocio").prop("checked");
                const FILTROBIENESTAR = $("#bienestar").prop("checked");

                const PRECIOMINIMOACTIVIDAD = parseFloat($("#precioMinimoActividad").val());
                const PRECIOMAXIMOACTIVIDAD = parseFloat($("#precioMaximoActividad").val());

                const AFOROMINIMOACTIVIDAD = parseInt($("#aforoMinimoActividad").val());
                const AFOROMAXIMOACTIVIDAD = parseInt($("#aforoMaximoActividad").val());


                // Limpio los resultados antes de agregar nuevos
                $("#resultadosContainer").empty();


                if (FILTRODESTINOSELECCIONADO) {

                    let destinos = [];
                    $.get("/obtenerDestinos", function (data) {
                        destinos = data; // Guarda los datos de los destinos en una variable global
                        // Carga las opciones del menú desplegable con los destinos obtenidos
                        let filtroDestinos = $('#filtroDestinos');
                        filtroDestinos.empty(); // Limpiar las opciones existentes
                        filtroDestinos.append($('<option>', { value: "", text: "Ninguno", selected: true })); // Opción predeterminada
                        destinos.forEach(destino => {
                            filtroDestinos.append($('<option>', { value: destino.idDestino, text: destino.ciudad }));
                        });

                        // Obtiene los ids de las ciudades
                        let idMadrid = destinos.find(destino => destino.ciudad === 'Madrid').idDestino;
                        let idBarcelona = destinos.find(destino => destino.ciudad === 'Barcelona').idDestino;

                        // Filtrar hoteles por ciudad
                        let hotelesMadrid = window.hotelesAplanados.filter(hotel => typeof hotel.destino === 'object' ? hotel.destino.idDestino === idMadrid : hotel.destino === idMadrid);
                        let hotelesBarcelona = window.hotelesAplanados.filter(hotel => typeof hotel.destino === 'object' ? hotel.destino.idDestino === idBarcelona : hotel.destino === idBarcelona);


                        // Filtrar actividades por ciudad
                        let actividadesMadrid = window.actividadesAplanados.filter(actividad => typeof actividad.destino === 'object' ? actividad.destino.idDestino === idMadrid : actividad.destino === idMadrid);
                        let actividadesBarcelona = window.actividadesAplanados.filter(actividad => typeof actividad.destino === 'object' ? actividad.destino.idDestino === idBarcelona : actividad.destino === idBarcelona);



                        // Filtrar restaurantes por ciudad
                        let restaurantesMadrid = window.restaurantesAplanados.filter(restaurante => typeof restaurante.destino === 'object' ? restaurante.destino.idDestino === idMadrid : restaurante.destino === idMadrid);
                        let restaurantesBarcelona = window.restaurantesAplanados.filter(restaurante => typeof restaurante.destino === 'object' ? restaurante.destino.idDestino === idBarcelona : restaurante.destino === idBarcelona);



                        if (FILTRODESTINOSELECCIONADO === 'Madrid') {
                            // Limpio los resultados antes de agregar nuevos
                            $("#resultadosContainer").empty();

                            mostrarHoteles(hotelesMadrid);
                            mostrarActividades(actividadesMadrid);
                            mostrarRestaurantes(restaurantesMadrid);
                        } else if (FILTRODESTINOSELECCIONADO === 'Barcelona') {
                            // Limpio los resultados antes de agregar nuevos
                            $("#resultadosContainer").empty();

                            mostrarHoteles(hotelesBarcelona);
                            mostrarActividades(actividadesBarcelona);
                            mostrarRestaurantes(restaurantesBarcelona);
                        }

                        //meter todos los otros filtros aqui

                    });
                }



                //filtros de Hotel
                if (FILTROHOTEL) {

                    //para obtenertodos los hoteles y despues trabajar con ellos
                    let hotelesFiltrados = window.hotelesAplanados;

                    //para los filtros de los booleans de hotel
                    if (FILTROPISCINA) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.piscinaHotel);
                    }
                    if (FILTROGIMNASIO) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.gimnasioHotel);
                    }
                    if (FILTROTERRAZA) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.terrazaHotel);
                    }
                    if (FILTROSPA) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.spaHotel);
                    }

                    //para los filtros de estrella, los de categoria

                    if (FILTRO1ESTRELLA) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.categoriaHotel == 1);
                    }
                    if (FILTRO2ESTRELLAS) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.categoriaHotel == 2);
                    }
                    if (FILTRO3ESTRELLAS) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.categoriaHotel == 3);
                    }
                    if (FILTRO4ESTRELLAS) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.categoriaHotel == 4);
                    }
                    if (FILTRO5ESTRELLAS) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.categoriaHotel == 5);
                    }


                    //para los filtros de precio minimo hotel y precio maximo hotel
                    if (!isNaN(PRECIOMINIMOHOTEL)) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.precioHotel >= PRECIOMINIMOHOTEL);
                    }
                    if (!isNaN(PRECIOMAXIMOHOTEL)) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => hotel.precioHotel <= PRECIOMAXIMOHOTEL);
                    }

                    //para los filtros de precio minimo sala hotel y precio maximo sala hotel
                    if (!isNaN(PRECIOMINIMOSALAHOTEL)) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => {
                            // Asegurarse de que el hotel tiene una lista de salas antes de tratar de acceder a ella
                            if (hotel.salasHotel) {
                                // Esto comprobará si al menos una sala en el hotel cumple con el filtro de precio mínimo
                                return hotel.salasHotel.some(sala => sala.precioSala >= PRECIOMINIMOSALAHOTEL);
                            } else {
                                console.log("No hay una sala de hotel con ese precio minimo");
                                return false;
                            }
                        });
                    }

                    if (!isNaN(PRECIOMAXIMOSALAHOTEL)) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => {
                            // Asegurarse de que el hotel tiene una lista de salas antes de tratar de acceder a ella
                            if (hotel.salasHotel) {
                                // Esto comprobará si al menos una sala en el hotel cumple con el filtro de precio máximo
                                return hotel.salasHotel.some(sala => sala.precioSala <= PRECIOMAXIMOSALAHOTEL);
                            } else {
                                console.log("No hay una sala de hotel con ese precio maximo");
                                return false;
                            }
                        });
                    }


                    //para los filtros de aforo minimo sala hotel y aforo maximo sala hotel
                    if (!isNaN(AFOROMINIMOSALAHOTEL)) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => {
                            // Asegurarse de que el hotel tiene una lista de salas antes de tratar de acceder a ella
                            if (hotel.salasHotel) {
                                // Esto comprobará si al menos una sala en el hotel cumple con el filtro de precio mínimo
                                return hotel.salasHotel.some(sala => sala.aforoSala >= AFOROMINIMOSALAHOTEL);
                            } else {
                                console.log("No hay una sala de hotel con ese precio minimo");
                                return false;
                            }
                        });
                    }

                    if (!isNaN(AFOROMAXIMOSALAHOTEL)) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => {
                            // Asegurarse de que el hotel tiene una lista de salas antes de tratar de acceder a ella
                            if (hotel.salasHotel) {
                                // Esto comprobará si al menos una sala en el hotel cumple con el filtro de precio máximo
                                return hotel.salasHotel.some(sala => sala.aforoSala <= AFOROMAXIMOSALAHOTEL);
                            } else {
                                console.log("No hay una sala de hotel con ese precio maximo");
                                return false;
                            }
                        });
                    }

                    //para los filtros de equipo sonido sala hotel y proyector sala hotel
                    if (FILTROEQUIPOSONIDO) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => {
                            if (hotel.salasHotel) {
                                return hotel.salasHotel.some(sala => sala.equipoSonidoSala);
                            } else {
                                return false;
                            }
                        });
                    }

                    if (FILTROPROYECTOR) {
                        hotelesFiltrados = hotelesFiltrados.filter(hotel => {
                            if (hotel.salasHotel) {
                                return hotel.salasHotel.some(sala => sala.proyectorSala);
                            } else {
                                return false;
                            }
                        });
                    }

                    //mostramos los resultados
                    mostrarHoteles(hotelesFiltrados);
                }



                // Subfiltros para Restaurantes
                if (FILTRORESTAURANTE) {
                    // Para obtener todos los restaurantes y después trabajar con ellos
                    let restaurantesFiltrados = window.restaurantesAplanados;

                    // Filtros de tipo de restaurante
                    if (FILTROMEDITERRANEO) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.tipoCocinaRestaurante == "Mediterráneo");
                    }
                    if (FILTROTAPAS) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.tipoCocinaRestaurante == "Tapas");
                    }
                    if (FILTROBUFFET) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.tipoCocinaRestaurante == "Buffet");
                    }
                    if (FILTROTEMATICO) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.tipoCocinaRestaurante == "Temático");
                    }
                    if (FILTROITALIANO) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.tipoCocinaRestaurante == "Italiano");
                    }

                    // Filtros de categoría
                    if (FILTRO1TENEDOR) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.categoriaRestaurante == 1);
                    }
                    if (FILTRO2TENEDOR) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.categoriaRestaurante == 2);
                    }
                    if (FILTRO3TENEDOR) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.categoriaRestaurante == 3);
                    }
                    if (FILTRO4TENEDOR) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.categoriaRestaurante == 4);
                    }



                    // Filtros de aforo
                    if (!isNaN(AFOROMINIMORESTAURANTE)) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.aforoRestaurante >= AFOROMINIMORESTAURANTE);
                    }
                    if (!isNaN(AFOROMAXIMORESTAURANTE)) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante => restaurante.aforoRestaurante <= AFOROMAXIMORESTAURANTE);
                    }


                    //Filtros de menu restaurante
                    //Si algún menú del restaurante tiene un precio de menú mayor que 0, significa que el restaurante tiene ese menu. 
                    if (MENUVEGETARIANO) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante =>
                            restaurante.menusRestaurante.some(menu => menu.precioMenuVegetariano > 0)
                        );
                    }


                    if (MENUVEGANO) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante =>
                            restaurante.menusRestaurante.some(menu => menu.precioMenuVegano > 0)
                        );
                    }


                    if (MENUCELIACO) {
                        restaurantesFiltrados = restaurantesFiltrados.filter(restaurante =>
                            restaurante.menusRestaurante.some(menu => menu.precioMenuCeliaco > 0)
                        );
                    }



                    // Mostramos los resultados
                    mostrarRestaurantes(restaurantesFiltrados);
                }



                // filtros de Actividad
                if (FILTROACTIVIDAD) {

                    // Para obtener todas las actividades y después trabajar con ellas
                    let actividadesFiltradas = window.actividadesAplanados;

                    // Filtros de tipo de actividad
                    if (FILTROAVENTURA) {
                        console.log("Ha entrado dentro del if  FILTROAVENTURA");
                        actividadesFiltradas = actividadesFiltradas.filter(actividad => actividad.tipoActividad.toLowerCase() === "aventura");
                        console.log(actividadesFiltradas);
                    } else {
                        console.log("No ha entrado dentro del if FILTROAVENTURA");
                    }

                    if (FILTROCULTURA) {
                        console.log("Ha entrado dentro del if  FILTROCULTURA");
                        actividadesFiltradas = actividadesFiltradas.filter(actividad => actividad.tipoActividad.toLowerCase() === "cultura");
                        console.log(actividadesFiltradas);
                    } else {
                        console.log("No ha entrado dentro del if FILTROCULTURA");
                    }

                    if (FILTROOCIO) {
                        console.log("Ha entrado dentro del if  FILTROOCIO");
                        actividadesFiltradas = actividadesFiltradas.filter(actividad => actividad.tipoActividad.toLowerCase() === "ocio");
                        console.log(actividadesFiltradas);
                    } else {
                        console.log("No ha entrado dentro del if FILTROOCIO");
                    }

                    if (FILTROBIENESTAR) {
                        console.log("Ha entrado dentro del if  FILTROBIENESTAR");
                        actividadesFiltradas = actividadesFiltradas.filter(actividad => actividad.tipoActividad.toLowerCase() === "bienestar");
                        console.log(actividadesFiltradas);
                    } else {
                        console.log("No ha entrado dentro del if FILTROBIENESTAR");
                    }

                    // Filtros de precio
                    if (!isNaN(PRECIOMINIMOACTIVIDAD)) {
                        actividadesFiltradas = actividadesFiltradas.filter(actividad => actividad.precioActividad >= PRECIOMINIMOACTIVIDAD);
                    }
                    if (!isNaN(PRECIOMAXIMOACTIVIDAD)) {
                        actividadesFiltradas = actividadesFiltradas.filter(actividad => actividad.precioActividad <= PRECIOMAXIMOACTIVIDAD);
                    }

                    // Filtros de aforo
                    if (!isNaN(AFOROMINIMOACTIVIDAD)) {
                        actividadesFiltradas = actividadesFiltradas.filter(actividad => actividad.aforoActividad >= AFOROMINIMOACTIVIDAD);
                    }
                    if (!isNaN(AFOROMAXIMOACTIVIDAD)) {
                        actividadesFiltradas = actividadesFiltradas.filter(actividad => actividad.aforoActividad <= AFOROMAXIMOACTIVIDAD);
                    }

                    // Mostramos las actividades filtradas
                    mostrarActividades(actividadesFiltradas, "#carouselExampleControls");
                }


                // Pero si ningun filtro esta seleccionado, mostramos todo
                if (!FILTRORESTAURANTE && !FILTROHOTEL && !FILTROACTIVIDAD) {
                    mostrarHoteles(window.hotelesAplanados);
                    mostrarRestaurantes(window.restaurantesAplanados);
                    mostrarActividades(window.actividadesAplanados, "#carouselExampleControls");
                }
            }


            function cumpleConFiltros(cardData) {
                // Verificar si cumple con el filtro de destino:
                if (FILTRODESTINOSELECCIONADO !== "Todos" && cardData.destino !== FILTRODESTINOSELECCIONADO) {
                    return false;
                }

                // Verificar si cumple con el filtro de hotel:
                if (FILTROHOTEL && cardData.tipo !== "Hotel") {
                    return false;
                }

                // Verificar si cumple con el filtro de restaurante:
                if (FILTRORESTAURANTE && cardData.tipo !== "Restaurante") {
                    return false;
                }

                // Verificar si cumple con el filtro de actividad:
                if (FILTROACTIVIDAD && cardData.tipo !== "Actividad") {
                    return false;
                }

                // Aquí debes agregar el resto de las condiciones para verificar los otros filtros.
                // Si cardData cumple con todos los filtros, devuelve true:
                return true;
            }



            //PASO 5. PROMISE: CUANDO FINALICE LA CARGA DE AJAX Y SE HAYA GUARDADO LOS DATOS EN ARRAY, ENTONCES ES CUANDO SE LLAMA LA FUNCION APLICAR FILTROS (carga paso 4 y a su vez paso 3)


            Promise.all([obtenerHoteles(), obtenerRestaurantes(), obtenerActividades()]).then(aplicarFiltros).catch(function (error) {
                console.error("Error al obtener los datos:", error);
            });



            // PASO 6. EVENTO PARA ACTUALIZAR LAS VISTAS MEDIANTE FUNCION APLICARFILTORS(paso 5 y a suvez paso 4)                


            $(".filtro").on("change", function () {
                aplicarFiltros();
            });



            // PASO 7. FINLAMENTE, LLAMAMOS A LAS FUNCIONES AJAX PARA DESENCADENAR TODO EL FLUJO: 

            obtenerHoteles();
            obtenerRestaurantes();
            obtenerActividades();

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //FASE 2: DESARROLLO DE LAS FUNCIONES DE LOS FILTROS (div izq)

            //PASO 1. CATEGORÍAS Y SUBCATEGORIAS: habilitamos los filtros



            $("#filtroHotel").change(function () {
                if (this.checked) {
                    $("#subcategoriasHoteles").show();
                } else {
                    $("#subcategoriasHoteles").hide();
                }
            });

            $("#filtroRestaurante").change(function () {
                if (this.checked) {
                    $("#subcategoriasRestaurantes").show();
                } else {
                    $("#subcategoriasRestaurantes").hide();
                }
            });

            $("#filtroActividad").change(function () {
                if (this.checked) {
                    $("#subcategoriasActividades").show();
                } else {
                    $("#subcategoriasActividades").hide();
                }
            });

            //para resetear los filtros, lo que tambien recarga la pagina
            $("#resetearFiltros").click(function () {
                $(".filtro").prop("checked", false);
                $("#subcategoriasHoteles").hide();
                $("#subcategoriasRestaurantes").hide();
                $("#subcategoriasActividades").hide();
                location.reload();
            });




            //PASO 2. HABILITAMOS EL BOTÓN RESETAR FILTROS
            //RESETEAR TODOS LOS FILTROS    
            $("#resetearFiltros").on("click", function () {
                $(".filtro").prop("checked", false);

                // Resetear las barras de precios y aforos
                $("#aforoHotel").val(1);
                $("#precioNocheHotel").val(1);
                $("#precioSalaHotel").val(1);
                $("#aforoRestaurante").val(1);
                $("#precioPersona").val(1);
                $("#aforoActividad").val(1);
                $("#precioActividad").val(1);
            });

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////      !OJO -CON ESTO SI LO MOVEMOS-DEPENDE DE FUNCION OBTENER
            //FASE 3. MODALES

            //HOTEL. AÑADIR ESTRELLAS SEGUN EL RESULTADO DE CATEGORIA ***OJO CON ESTO, SI SEPARAMOS LOS JS CREO QUE HOTEL MODAL NO SE ABRIRÁ. CUIDADO DONDE SE QUEDA ESTO
            function createStarsHTML(starCount) {
                let starsHTML = '';
                for (let i = 0; i < starCount; i++) {
                    starsHTML += '<img class="estrella" src="recursos/Bootstrap/bootstrap-icons-1.10.4/star-fill.svg" alt="' + (i + 1) + ' estrella" width="20" height="20">';
                }
                return starsHTML;
            }

            //RESTAURANTE. AÑADIR TENEDOES SEGUN EL RESULTADO DE CATEGORIA ***OJO CON ESTO, SI SEPARAMOS LOS JS CREO QUE HOTEL MODAL NO SE ABRIRÁ. CUIDADO DONDE SE QUEDA ESTO
            function createTenedoresHTML(tenedorCount) {
                let tenedoresHTML = '';
                for (let i = 0; i < tenedorCount; i++) {
                    tenedoresHTML += '<img class="forks" src="imagenes/tenedor.jpg"  alt="' + (i + 1) + ' tenedor" width="10" height="30">';///!OJO-NO TENGO CLARO QUE ESTO ESTE BIEN
                }
                return tenedoresHTML;
            }

            ////////////////////////////////////////

        });//ESTE ES EL CIERRE DE DOCUMENT.READY.NO ELIMINAR

    </script>
</body>

</html>