<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  Directivas  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title> faq.jsp</title>

    <!-- jQuery 3.6.4 -->
<script src="/recursos/jQuery3.6.4/jQuery3.6.4.js"></script>

    <!-- Bootstrap 4.6.2 -->
<link rel="stylesheet" href="/recursos/Bootstrap/Bootstrap4.6.2/css/bootstrap.min.css">
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

        #contenedorPequenio {
            overflow-y: inherit;
            overflow-x: inherit;
        }

        .contenedorGrande::after {
            overflow-y: inherit;
            overflow-x: inherit;
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



        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav justify-content-between w-100">

                <li class="nav-item ">
                    <a class="nav-link" href="index.html">INICIO</a>
                </li>

                <li class="nav-item ">
                    <a class="nav-link" href="busquedaPersonalizada">BÚSQUEDA PERSONALIZADA</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="contacto">CONTACTO</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="faq">FAQ</a>
                </li>

                <li class="nav-item">
                    <a id="iconoCarrito" href="carrito">
                        <img id="iconoCarrito" src="recursos/Bootstrap//bootstrap-icons-1.10.4/cart-fill.svg" alt="Bootstrap" width="32"
                            height="32">
                    </a>
                </li>

                <li class="nav-item">
                    <a href="loginYregistro" class=" nav-link btn btn-primary"><img src="recursos/Bootstrap//bootstrap-icons-1.10.4/person-fill.svg"
                            alt="Bootstrap" width="40" height="32"></a>
                </li>

            </ul>
        </div>
    </nav>


    <!-- Principal -->

    <!-- Fuente: https://www.bootdey.com/snippets/view/paq-page#html -->
    <div class="container-fluid flex-grow-1 mt-5">
    
        <div class="row">
            <div class="container mt-sm-60 mt-30">
                <div class="row">
                
                
                    <!-- Cuadro pequeño de la izquierda, el de Categorías -->
                    <div id="contenedorPequenio" class="col-xl-4">
                        <div class="card">

                            <h6 class="card-header" align="center">
                                CATEGORÍA
                            </h6>

                            <ul class="list-group list-group-flush">

                                <li id="terminosCondicionesMenuCategoria"
                                    class="list-group-item d-flex justify-content-between active">
                                    <span>Términos y Condiciones</span>
                                    <span class="badge badge-light badge-pill">3</span>
                                </li>
                                <li id="hotelesMenuCategoria" class="list-group-item d-flex justify-content-between">
                                    <span>Hoteles</span>
                                    <span class="badge badge-light badge-pill">2</span>
                                </li>
                                <li id="transporteMenuCategoria" class="list-group-item d-flex justify-content-between">
                                    <span>Transporte</span>
                                    <span class="badge badge-light badge-pill">2</span>
                                </li>
                                <li id="restaurantesMenuCategoria"
                                    class="list-group-item d-flex justify-content-between">
                                    <span>Restaurantes</span>
                                    <span class="badge badge-light badge-pill">2</span>
                                </li>
                                <li id="actividadesMenuCategoria"
                                    class="list-group-item d-flex justify-content-between">
                                    <span>Actividades</span>
                                    <span class="badge badge-light badge-pill">1</span>
                                </li>
                            </ul>

                        </div>
                    </div>


                    <!-- Cuadro grande de la derecha , en este caso Terminos y Condiciones-->
                    <div id="explicacionTerminosCondiciones" class="col-xl-8  contenedorGrande">
                        <div class="card">
                            <h3 class="card-header border-bottom-0">
                                Términos y Condiciones
                            </h3>
                            <div class="accordion accordion-type-2 accordion-flush" id="accordion_2">


                                <div class="card">
                                    <div class="card-header d-flex justify-content-between activestate">
                                        <a role="button" data-toggle="collapse" href="#collapse_1i"
                                            aria-expanded="true">Propiedad Intelectual</a>
                                    </div>
                                    <div id="collapse_1i" class="collapse show" data-parent="#accordion_2"
                                        role="tabpanel">
                                        <div class="card-body ">Las fotos y descripciones que aparecen en esta web,
                                            pertenecen
                                            a sus autores, no a esta página. Es decir, las fotos del "Hotel Y de
                                            Barcelona", pertenecen
                                            a ese hotel, no a Agencia X. Simplemente las ponemos en la web para
                                            facilitar la información al usuario
                                            de forma más fácil </div>
                                    </div>
                                </div>


                                <div class="card">
                                    <div class="card-header d-flex justify-content-between">
                                        <a role="button" data-toggle="collapse" href="#collapse_1i_1"
                                            aria-expanded="true">Cancelación Y Reembolsos</a>
                                    </div>
                                    <div id="collapse_1i_1" class="collapse" data-parent="#accordion_2" role="tabpanel">
                                        <div class="card-body "> Una vez nuestros agentes han confirmado la reserva
                                            con el usuario,
                                            y este ha completado el pago, tiene 15 días naturales para cancelar la
                                            reserva y recuperar
                                            el dinero si así se desea. Una vez pasados los 15 días, no se harán
                                            reembolsos, independientemente de que los usuarios no hagan uso de alguno o
                                            ninguno de los servicios contratados.
                                            Si uno de los servicios contratados no pudiera llevarse a cabo por causa de
                                            un
                                            error de Gestión y/o administración por parte de Agencia X, también se
                                            procederá al reembolso del mismo. </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header d-flex justify-content-between">
                                        <a role="button" data-toggle="collapse" href="#collapse_1i_2"
                                            aria-expanded="true">Derechos de Admisión</a>
                                    </div>
                                    <div id="collapse_1i_2" class="collapse" data-parent="#accordion_2" role="tabpanel">
                                        <div class="card-body"> Agencia X se encarga de las reservas, pero una vez
                                            que las personas llegen al sitio para hacer la actividad (hotel,
                                            restaurante, actividad o transporte), serán las empresas propietarias de
                                            esos servicios los que se reservan el derecho de admisión a los mismos. Por
                                            lo general, no hay ningún problema, pero si alguien dice que es programador
                                            de HTML, normalmente no lo dejan entrar.
                                        </div>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                    <!-- Cuadro grande de la derecha , en este caso Hoteles-->
                    <div id="explicacionHoteles" class="col-xl-8 d-none">
                        <div class="card card-lg">
                            <h3 class="card-header border-bottom-0">
                                Hoteles
                            </h3>
                            <div class="accordion accordion-type-2 accordion-flush" id="accordion_2">

                                <div class="card">
                                    <div class="card-header d-flex justify-content-between activestate">
                                        <a role="button" data-toggle="collapse" href="#collapse_1i"
                                            aria-expanded="true">Repartición de Habitaciones</a>
                                    </div>
                                    <div id="collapse_1i" class="collapse show" data-parent="#accordion_2"
                                        role="tabpanel">
                                        <div class="card-body ">Cuando se hace una reserva de un hotel para "x"
                                            personas,
                                            es el hotel el encargado de dividir a esas personas según los tipos de
                                            habitaciones
                                            que se tengan, generalmente habitaciones de 1,2,3 y hasta 4 personas.
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between">
                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse_2i"
                                            aria-expanded="false">Cambio de Habitaciones</a>
                                    </div>
                                    <div id="collapse_2i" class="collapse" data-parent="#accordion_2">
                                        <div class="card-body ">Como hotel elige la distribución de los huéspedes
                                            en los
                                            distintos tipos de habitaciones, si se desea realizar un cambio o una
                                            petición, habrá de
                                            dirigirse a ese hotel en específico. La disponibilidad de esos cambios
                                            depende
                                            del aforo del hotel en esas fechas. Por lo general, se recomienda informar
                                            al hotel de estas peticiones lo antes posible. </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>


                    <!-- Cuadro grande de la derecha , en este caso Transporte-->
                    <div id="explicacionTransporte" class="col-xl-8 d-none">
                        <div class="card card-lg">
                            <h3 class="card-header border-bottom-0">
                                Transporte
                            </h3>
                            <div class="accordion accordion-type-2 accordion-flush" id="accordion_2">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between activestate">
                                        <a role="button" data-toggle="collapse" href="#collapse_1i"
                                            aria-expanded="true">Medio de Transporte</a>
                                    </div>
                                    <div id="collapse_1i" class="collapse show" data-parent="#accordion_2"
                                        role="tabpanel">
                                        <div class="card-body ">El único transporte que ofrecemos son autobuses.
                                            Los autobuses siempre son de 80 plazas. No se pueden alquilar minibuses, o
                                            pagar menos porque no se van a ocupar las plazas completas del autobús
                                            alquilado.
                                            Se puede alquilar más de 1 autobús por viaje.
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between">
                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse_2i"
                                            aria-expanded="false">Duración del Transporte</a>
                                    </div>
                                    <div id="collapse_2i" class="collapse" data-parent="#accordion_2">
                                        <div class="card-body ">Cuando se elige añadir transporte a la oferta,
                                            ese bus se alquila durante todo el día (8 horas, que son las permitidas
                                            para los conductores de los mismos). No se pueden alquilar por tramos de
                                            tiempo.
                                            Es decir, no se puede alquilar por 1 o 5 horas, por ejemplo. A cambio, no
                                            existe límite
                                            de los kilómetros que se pueden hacer en él, ya que solo se tienen en cuenta
                                            el tiempo que
                                            legalmente puede ser conducido. </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>


                    <!-- Cuadro grande de la derecha , en este caso Restaurantes-->
                    <div id="explicacionRestaurantes" class="col-xl-8 d-none">
                        <div class="card card-lg">
                            <h3 class="card-header border-bottom-0">
                                Restaurantes
                            </h3>
                            <div class="accordion accordion-type-2 accordion-flush" id="accordion_2">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between activestate">
                                        <a role="button" data-toggle="collapse" href="#collapse_1i"
                                            aria-expanded="true">Aforo</a>
                                    </div>
                                    <div id="collapse_1i" class="collapse show" data-parent="#accordion_2"
                                        role="tabpanel">
                                        <div class="card-body"> La web muestra restaurantes con un aforo
                                            predefinido. Por ejemplo,
                                            si el usuario está buscando una oferta para 80 personas, en la página
                                            aparecerán restaurantes con
                                            un mínimo de aforo de 80 personas. Esto NO QUIERE DECIR QUE HAYA SITIO, si
                                            no que el restaurante
                                            tiene sitio potencial para acoger a todas las personas. De ahí que al final
                                            de todo el proceso,
                                            un agente de Agencia X se pone en contacto con el cliente y con el
                                            restaurante, para saber si es
                                            posible reservar en ese restaurante y en esas fechas. Si no es así, se
                                            informará al ususario lo antes posible,
                                            o bien para que elija otro restaurante o para que cancele la reserva del
                                            mismo sin coste alguno.
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between">
                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapse_2i"
                                            aria-expanded="false">Cancelación Imprevista</a>
                                    </div>
                                    <div id="collapse_2i" class="collapse" data-parent="#accordion_2">
                                        <div class="card-body"> Si, por motivos de causa mayor, la reserva del
                                            restaurante se llegase
                                            a cancelar, Agencia X devolverá el dinero de la reserva del mismo. </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>


                    <!-- Cuadro grande de la derecha , en este caso Actividades-->
                    <div id="explicacionActividades" class="col-xl-8 d-none">
                        <div class="card card-lg">
                            <h3 class="card-header border-bottom-0">
                                Actividades
                            </h3>
                            <div class="accordion accordion-type-2 accordion-flush" id="accordion_2">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between activestate">
                                        <a role="button" data-toggle="collapse" href="#collapse_1i"
                                            aria-expanded="true">Climatología</a>
                                    </div>
                                    <div id="collapse_1i" class="collapse show" data-parent="#accordion_2"
                                        role="tabpanel">
                                        <div class="card-body"> En las actividades al aire libre, como parques de
                                            atracciones o
                                            piscina descubierta, recomendamos que se mire la previsión meteorológica.
                                            Entendemos que no se
                                            puede preveer el tiempo a 3 meses vista, pero rogamos sentido común, como
                                            por ejemplo no solicitar
                                            ir a una piscina descubierta en Diciembre.
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
   
    
    <!-- Footer-->
    <footer class="footer mt-auto py-3 mb-0">
        <div class="container" align="center">
            <span class="text-muted"> Gala Gallardo García y Cristian Fuerte Santas</span>
        </div>
    </footer>


    <script>

        $(document).ready(function () {

            function subrayarCategoriaSeleccionada(element) {

                $(".list-group-item").removeClass("active");

                $(element).addClass("active");
            }

            function mostrarDiv(element) {

                $(element).removeClass("d-none");

            }

            function esconderDivs(elements) {

                elements.forEach(function (element) {

                    $(element).addClass("d-none");

                });
            }


            //TERMINOS Y CONDICIONES
            $("#terminosCondicionesMenuCategoria").click(function () {

                subrayarCategoriaSeleccionada(this);

                //muestro el div solicitado          
                mostrarDiv(explicacionTerminosCondiciones);

                //escondo el resto de los divs
                esconderDivs(["#explicacionHoteles", "#explicacionTransporte", "#explicacionRestaurantes", "#explicacionActividades"]);

            });

            //HOTELES
            $("#hotelesMenuCategoria").click(function () {

                subrayarCategoriaSeleccionada(this);

                mostrarDiv(explicacionHoteles);

                esconderDivs(["#explicacionTerminosCondiciones", "#explicacionTransporte", "#explicacionRestaurantes", "#explicacionActividades"]);

            });

            //TRANSPORTE
            $("#transporteMenuCategoria").click(function () {

                subrayarCategoriaSeleccionada(this);

                mostrarDiv(explicacionTransporte);

                esconderDivs(["#explicacionTerminosCondiciones", "#explicacionHoteles", "#explicacionRestaurantes", "#explicacionActividades"]);

            });



            //RESTAURANTES
            $("#restaurantesMenuCategoria").click(function () {

                subrayarCategoriaSeleccionada(this);

                mostrarDiv(explicacionRestaurantes);

                esconderDivs(["#explicacionTerminosCondiciones", "#explicacionHoteles", "#explicacionTransporte", "#explicacionActividades"]);

            });


            //ACTIVIDADES
            $("#actividadesMenuCategoria").click(function () {

                subrayarCategoriaSeleccionada(this);

                mostrarDiv(explicacionActividades);

                esconderDivs(["#explicacionTerminosCondiciones", "#explicacionHoteles", "#explicacionTransporte", "#explicacionRestaurantes"]);

            });

        });

    </script>
</body>

</html>