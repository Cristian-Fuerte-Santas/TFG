package com.tfg.imf.controladores;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tfg.imf.entidades.*;
import com.tfg.imf.modelo.GestorActividad;
import com.tfg.imf.modelo.GestorCarrito;
import com.tfg.imf.modelo.GestorDestino;
import com.tfg.imf.modelo.GestorHotel;
import com.tfg.imf.modelo.GestorMenuRestaurante;

import com.tfg.imf.modelo.GestorRestaurante;
import com.tfg.imf.modelo.GestorSalaHotel;
import com.tfg.imf.modelo.GestorUsuario;

import com.tfg.imf.persistencia.IRepositorioUsuario;
import com.tfg.imf.validaciones.*;

import java.util.Arrays;
import java.util.List;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import java.io.IOException;

@Controller
public class FormularioUsuarioControlador {

	// inyectando los modelos y creando la logica de negocio

	// llamamos a las persistencias

	@Autowired
	private GestorUsuario gestorUsuario;

	@Autowired
	private GestorHotel gestorHotel;

	@Autowired
	private GestorRestaurante gestorRestaurante;

	@Autowired
	private GestorSalaHotel gestorSalaHotel;

	@Autowired
	private GestorMenuRestaurante gestorMenuRestaurante;

	@Autowired
	private GestorActividad gestorActividad;

	@Autowired
	private GestorDestino gestorDestino;
	@Autowired
	private GestorCarrito gestorCarrito;

	@Autowired
	private IRepositorioUsuario repositorioUsuario;

	public FormularioUsuarioControlador() {
		super();
		System.out.println("Creando una instancia de FormularioUsuarioControlador");
	}

	// Cuando se añade un archivo .jsp, primero hay que venir aqui y mapearlo para
	// que despues se pueda mostrar

	// MAPEADO DE LOS ARCHIVOS .JSP

	// aqui va el nombre del archivo .jsp, como loginYregistro.jsp
	@GetMapping("/loginYregistro")
	public ModelAndView verLoginYRegistro() {

		System.out.println("FormularioUsuarioControlador.verLoginYRegistro");

		// crea la vista de la página
		ModelAndView mav = new ModelAndView("loginYregistro");

		mav.addObject("usuario", new Usuario());

		return mav;
	}

	@GetMapping("/areaPersonaAdmin")
	public ModelAndView verAreaPersonaAdmin() {

		System.out.println("FormularioUsuarioControlador.verAreaPersonaAdmin");

		ModelAndView mav = new ModelAndView("areaPersonaAdmin");

		return mav;
	}

	@GetMapping("/gestionarUsuariosAdmin")
	public ModelAndView gestionarUsuarios() {

		System.out.println("FormularioClientesControlador.gestionarUsuarios");

		List<Usuario> usuarios = gestorUsuario.verTodosLosUsuarios();

		ModelAndView mav = new ModelAndView("gestionarUsuariosAdmin");

		mav.addObject("usuarios", usuarios);

		return mav;
	}

	@GetMapping("/faq")
	public ModelAndView verFaq() {

		System.out.println("FormularioUsuarioControlador.verFaq");

		ModelAndView mav = new ModelAndView("faq");

		return mav;
	}

	@GetMapping("/busquedaPersonalizada")
	public ModelAndView verBusquedaPersonalizada() {

		System.out.println("FormularioUsuarioControlador.verBusquedaPersonalizada");

		ModelAndView mav = new ModelAndView("busquedaPersonalizada");

		return mav;
	}

	@GetMapping("/contacto")
	public ModelAndView verContacto() {

		System.out.println("FormularioUsuarioControlador.verContacto");

		ModelAndView mav = new ModelAndView("contacto");

		return mav;
	}

	@GetMapping("/gestionarOfertasAdmin")
	public ModelAndView verGestionarOfertasAdmin() {

		System.out.println("FormularioUsuarioControlador.verGestiornarOfertaAdmin");

		List<Hotel> hoteles = gestorHotel.verTodosLosHoteles();

		List<Restaurante> restaurantes = gestorRestaurante.verTodosLosRestaurantes();

		List<SalaHotel> salashoteles = gestorSalaHotel.verTodasLasSalasHotel();

		List<MenuRestaurante> menusRestaurantes = gestorMenuRestaurante.verTodosLosMenusRestaurantes();

		List<Actividad> actividades = gestorActividad.verTodasLasActividades();

		List<Destino> listaDestinos = gestorDestino.verTodosLosDestinos();
		List<Usuario> usuarios = gestorUsuario.verTodosLosUsuarios();

		ModelAndView mav = new ModelAndView("gestionarOfertasAdmin");
		mav.addObject("hoteles", hoteles);
		mav.addObject("restaurantes", restaurantes);
		mav.addObject("salashoteles", salashoteles);
		mav.addObject("menusRestaurantes", menusRestaurantes);
		mav.addObject("actividades", actividades);
		mav.addObject("listaDestinos", listaDestinos);
		mav.addObject("usuarios", usuarios);

		return mav;
	}

	@GetMapping("/carrito")
	public ModelAndView verCarrito() {

		System.out.println("FormularioUsuarioControlador.verCarrito");

		List<Hotel> hoteles = gestorHotel.verTodosLosHoteles();

		List<Restaurante> restaurantes = gestorRestaurante.verTodosLosRestaurantes();

		List<SalaHotel> salashoteles = gestorSalaHotel.verTodasLasSalasHotel();

		List<MenuRestaurante> menusRestaurantes = gestorMenuRestaurante.verTodosLosMenusRestaurantes();

		List<Actividad> actividades = gestorActividad.verTodasLasActividades();

		List<Destino> listaDestinos = gestorDestino.verTodosLosDestinos();

		List<Usuario> usuarios = gestorUsuario.verTodosLosUsuarios();

		ModelAndView mav = new ModelAndView("carrito");
		mav.addObject("hoteles", hoteles);
		mav.addObject("restaurantes", restaurantes);
		mav.addObject("salashoteles", salashoteles);
		mav.addObject("menusRestaurantes", menusRestaurantes);
		mav.addObject("actividades", actividades);
		mav.addObject("listaDestinos", listaDestinos);
		mav.addObject("usuarios", usuarios);

		return mav;
	}

	@PostMapping("/insertarElementoEnCarrito")
	public ModelAndView insertarElementoEnCarrito(@RequestParam(required = false) Integer idHotel,
			@RequestParam(required = false) Integer idActividad,
			@RequestParam(required = false) String idsSalasHotelString,
			@RequestParam(required = false) Integer idRestaurante,
			@RequestParam(required = false) String preciosSeleccionadosString, HttpSession session) {

		System.out.println("FormularioUsuarioControlador.insertarElementoEnCarrito");

		if (session == null) {
			System.out.println("No hay una sesión activa.");
			// Redirige al usuario a la página de inicio de sesión
			return new ModelAndView("redirect:/loginYregistro");
		}

		Usuario usuario = (Usuario) session.getAttribute("usuario");

		if (usuario == null) {
			System.out.println("El usuario no está en la sesión.");
			// Redirige al usuario a la página de inicio de sesión
			return new ModelAndView("redirect:/loginYregistro");
		}

		// Convertir el array de strings que viene de la vista a integers
		List<Integer> idsSalasHotel = new ArrayList<>();

		ObjectMapper mapper = new ObjectMapper();

		try {
			idsSalasHotel = Arrays.asList(mapper.readValue(idsSalasHotelString, Integer[].class));

		} catch (IOException e) {
			e.printStackTrace();
		}

		// Buscar el objeto Destino usando el destinoId y asignarlo al Hotel
		List<Object> itemsParaAgregar = new ArrayList<>();

		if (idHotel != null) {
			Hotel hotel = gestorHotel.obtenerHotelPorId(idHotel);

			if (hotel != null) {
				System.out.println(" HOTEL que se va agregar: " + hotel.toString());
				itemsParaAgregar.add(hotel);
			} else {
				System.out.println("No se encontró el hotel con el id: " + idHotel);
			}
		}

		if (idsSalasHotel != null) {
			for (Integer idSala : idsSalasHotel) {
				SalaHotel sala = gestorSalaHotel.obtenerSalaHotelPorId(idSala);
				if (sala != null) {

					System.out.println("SALA HOTEL que se va agregar: " + sala.toString());
					itemsParaAgregar.add(sala);
				} else {
					System.out.println("No se encontró la sala de hotel con el id: " + idSala);
				}
			}
		}

		if (idActividad != null) {
			Actividad actividad = gestorActividad.obtenerActividadPorId(idActividad);

			if (actividad != null) {

				System.out.println("ACTIVIDAD que se va agregar: " + idActividad.toString());
				itemsParaAgregar.add(actividad);

			} else {
				System.out.println("No se encontró la actividad con el id: " + idActividad);
			}

		}

		if (idRestaurante != null) {
			Restaurante restaurante = gestorRestaurante.obtenerRestaurantePorId(idRestaurante);

			if (restaurante != null) {
				Hibernate.initialize(restaurante.getMenusRestaurante());

				ObjectMapper mapper2 = new ObjectMapper();
				try {
					List<String> preciosSeleccionados = mapper2.readValue(preciosSeleccionadosString,
							new TypeReference<List<String>>() {
							});

					for (String precioSeleccionado : preciosSeleccionados) {
						String[] splitData = precioSeleccionado.split(":");
						int numeroMenu = Integer.parseInt(splitData[0]);
						float precioMenu = Float.parseFloat(splitData[1]);

						if (numeroMenu > restaurante.getMenusRestaurante().size()) {
							System.out.println("El número de menú es mayor que la cantidad de menús en el restaurante");
							continue;
						}

						for (MenuRestaurante menu : restaurante.getMenusRestaurante()) {

							if (numeroMenu == 1 && menu.getPrecioMenuNormal() != 0) {
								System.out.println("=============== PRECIO NORMAL ANTES  =============");
								System.out.println(menu.getPrecioMenuNormal());
								menu.setPrecioMenuNormal(precioMenu);
								System.out.println("=============== PRECIO NORMAL DESPUES  =============");
								System.out.println(menu.getPrecioMenuNormal());
							}
							if (numeroMenu == 2 && menu.getPrecioMenuVegetariano() != 0) {
								menu.setPrecioMenuVegetariano(precioMenu);
							}
							if (numeroMenu == 3 && menu.getPrecioMenuVegano() != 0) {
								menu.setPrecioMenuVegano(precioMenu);
							}
							if (numeroMenu == 4 && menu.getPrecioMenuCeliaco() != 0) {
								menu.setPrecioMenuCeliaco(precioMenu);
							}
						}
					}
					System.out.println("=============== RESTAURANTE ===============");
					System.out.println("RESTAURANTE que se va agregar: " + restaurante.toString());
					itemsParaAgregar.add(restaurante);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("No se encontró el restaurante con el id: " + idRestaurante);
			}
		} else {
			System.out.println(" =============== RESTAURANTE ES NULL ===========");
		}

		for (Object item : itemsParaAgregar) {
			gestorCarrito.agregarItemAlCarrito(session, item);
		}

		return new ModelAndView("redirect:/busquedaPersonalizada");
	}

	@PostMapping("/eliminarDelCarrito")
	public ModelAndView eliminarDelCarrito(@RequestParam("itemId") int itemId, HttpSession session) {
		System.out.println("FormularioUsuarioControlador.eliminarDelCarrito");
		System.out.println("itemId: " + itemId);

		List<Object> carritoTemporal = (List<Object>) session.getAttribute("carritoTemporal");
		if (carritoTemporal != null) {
			List<Object> elementosARemover = new ArrayList<>();
			for (Object item : carritoTemporal) {
				if ((item instanceof Hotel && ((Hotel) item).getIdHotel() == itemId)
						|| (item instanceof SalaHotel && ((SalaHotel) item).getIdSalaHotel() == itemId)
						|| (item instanceof Actividad && ((Actividad) item).getIdActividad() == itemId)
						|| (item instanceof Restaurante && ((Restaurante) item).getIdRestaurante() == itemId)) {
					elementosARemover.add(item);
				}
			}
			carritoTemporal.removeAll(elementosARemover);
			session.setAttribute("carritoTemporal", carritoTemporal);
		}

		return new ModelAndView("redirect:/carrito");
	}

	// PARA CERRAR SESION

	@PostMapping("/cerrarSesion")
	public String cerrarSesion(HttpSession session) {
		// Invalidar la sesión
		session.invalidate();
		// Redirigir al usuario a la página de inicio de sesión
		return "redirect:/loginYregistro";
	}

	// PARA REDIGIRIR A UN LADO O A OTRO SEGUN SE HAYA HECHO LOGIN O NO Y SEGUN ES
	// ADMIN O NO

	@GetMapping("/redireccionUsuario")
	public String redireccionarUsuario(HttpSession session) {
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		if (usuario != null) {
			if (usuario.getIdUsuario() >= 1 && usuario.getIdUsuario() <= 4) {
				return "redirect:/areaPersonaAdmin";
			} else {
				return "redirect:/areaPersonaUsuario";
			}
		} else {
			return "redirect:/loginYregistro";
		}
	}

	// PARA VISTA LOGIN Y USUARIO

	@PostMapping("/insertarUsuario")
	public ModelAndView insertarUsuario(@ModelAttribute Usuario usuario,

			@RequestParam("verificarContrasenia") String verificarContrasenia) {

		UsuarioValidaciones validaciones = new UsuarioValidaciones();

		ModelAndView mav = new ModelAndView("loginYregistro");

		// Si no hay errores, intentamos insertar el usuario en la base de datos

		Usuario nuevoUsuario = new Usuario();

		if (!validaciones.isValidNombreEmpresa(usuario.getNombreEmpresa())) {
			mav.addObject("errorNombreEmpresaInvalido", true);

			System.out.println(usuario.getNombreEmpresa());

			System.out.println(!validaciones.isValidNombreEmpresa(usuario.getNombreEmpresa()));

		} else if (!validaciones.isValidNifEmpresa(usuario.getNifEmpresa())) {
			mav.addObject("errorNifEmpresaInvalido", true);

		} else if (!validaciones.isValidNombreUsuario(usuario.getNombreUsuario())) {

			mav.addObject("errorNombreUsuarioInvalido", true);

		} else if (!validaciones.isValidEmail(usuario.getEmailUsuario())) {
			mav.addObject("errorEmailInvalido", true);

		} else if (!validaciones.isValidPassword(usuario.getContraseniaUsuario())) {

			mav.addObject("errorPasswordInvalido", true);

		} else if (!usuario.getContraseniaUsuario().equals(verificarContrasenia)) {

			mav.addObject("errorPasswordNoCoincide", true);

		} else {

			nuevoUsuario.setNombreEmpresa(usuario.getNombreEmpresa());

			nuevoUsuario.setNifEmpresa(usuario.getNifEmpresa());

			nuevoUsuario.setNombreUsuario(usuario.getNombreUsuario());

			nuevoUsuario.setEmailUsuario(usuario.getEmailUsuario());

			nuevoUsuario.setTelefonoUsuario(usuario.getTelefonoUsuario());

			nuevoUsuario.setContraseniaUsuario(usuario.getContraseniaUsuario());

			System.out.println("Datos recogidos son correctos " + nuevoUsuario);

			try {

				System.out.println("Ha entrado dentro del try");

				System.out.println("Objeto Usuario antes de insertar: " + nuevoUsuario.toString());
				gestorUsuario.insertar(nuevoUsuario);

				// Si se inserta correctamente, agregamos un mensaje de éxito al ModelAndView

				mav.addObject("exitoRegistro", true);

			} catch (Exception e) {
				System.out.println("Ha entrado dentro del catch");
				// Si algo falla, agregamos un mensaje de error al ModelAndView
				mav.addObject("errorInsertar", "Error al insertar el usuario en la base de datos");

				e.printStackTrace();

			}

		}

		return mav;

	}

	@PostMapping("/formularioLogin")
	public ModelAndView formularioLogin(@ModelAttribute Usuario usuario, HttpSession session) {

		boolean emailEncontrado;

		boolean contraseniaEncontrada;

		Integer idUsuario;

		String buscandoEmail;

		UsuarioValidaciones validaciones = new UsuarioValidaciones();

		ModelAndView mav = new ModelAndView("loginYregistro");

		// aqui guardo los datos recibidos de la vista

		String emailRecibido = usuario.getEmailUsuario();

		String contraseniaRecibido = usuario.getContraseniaUsuario();

		// los imprimo

		System.out.println("Datos de login son: " + emailRecibido + " y " + contraseniaRecibido);

		if (!validaciones.isValidEmail(emailRecibido)) {

			mav.addObject("errorEmailInvalido", true);

		} else if (!validaciones.isValidPassword(contraseniaRecibido)) {

			mav.addObject("errorContraseniaInvalida", true);

		} else {

			// Si no hay errores, intentamos buscar el usuario en la base de datos

			// 1. Confirmo que no me devuelva un Null o bien por recibirlo o bien por no
			// encontrarlo y lo guardo en string

			buscandoEmail = repositorioUsuario.findEmail(emailRecibido);

			// 2. Luego confirmo que el string recibido NO sea null y que se haya encontrado
			// con un boolean

			emailEncontrado = buscandoEmail != null && buscandoEmail.equals(emailRecibido);

			// emailEncontrado =
			// repositorioUsuario.findEmail(emailRecibido).equals(emailRecibido);    

			System.out.println("email encontrado: " + emailEncontrado);

			if (!emailEncontrado) {

				System.out.println("Hay que sacarle: el email no se ha localizado");

				mav.addObject("errorEmailNoEncontrado", true);

			} else {

				// como he encontrado el email, ahora me quedo con la ID del email

				idUsuario = repositorioUsuario.findIdByEmail(emailRecibido);

				System.out.println("El id del usuario es: " + idUsuario);

				// busco que la id del email corresponda con la contraseña con un boolean

				contraseniaEncontrada = repositorioUsuario.findContraseniaById(idUsuario).equals(contraseniaRecibido);

				System.out
						.println("Tiene id de la contraseña tiene la misma contraseña en la BD que la que dice tener? "
								+ contraseniaEncontrada);

				if (!contraseniaEncontrada) {

					System.out.println("Hay que sacarle: datos introducidos no son correcto");

					mav.addObject("errorContraseniaNoEncontrada", true);

				} else {

					// guardamos la ID en SESSION
					session.setAttribute("idUsuario", idUsuario);

					// Recuperar el usuario completo de la base de datos
					Usuario usuarioCompleto = repositorioUsuario.findById(idUsuario).orElse(null);
					// Guardar el objeto usuarioCompleto en la sesión
					session.setAttribute("usuario", usuarioCompleto);

					if (repositorioUsuario.findContraseniaById(idUsuario).equals(contraseniaRecibido) && idUsuario <= 4
							&& contraseniaEncontrada) {

						System.out.println("Eres ADMIN");

						mav.addObject("exitoRegistro", true);

						return new ModelAndView("redirect:/areaPersonaAdmin");

					} else {

						System.out.println("Eres USUARIO");

						mav.addObject("exitoRegistro", true);

						return new ModelAndView("redirect:/areaPersonaUsuario");

					}

				}

			}

		}

		return mav;

	}

	// VISTA AREA PERSONA USUARIO

	@GetMapping("/areaPersonaUsuario")
	public ModelAndView verAreaPersonaUsuario(HttpSession session) {

		System.out.println("FormularioUsuarioControlador.verAreaPersonaUsuario");

		Integer idUsuario = (Integer) session.getAttribute("idUsuario");
		System.out.println("ID de session de Usuario es: " + idUsuario);

		Usuario usuario = repositorioUsuario.findById(idUsuario).orElse(null);
		System.out.println("Los datos del usuario son: " + usuario);

		ModelAndView mav = new ModelAndView("areaPersonaUsuario");

		mav.addObject("usuario", usuario);

		return mav;
	}

	@PostMapping("/actualizarDatosPersonales")
	public ModelAndView actualizarDatosPersonales(HttpSession session, @ModelAttribute Usuario usuarioActualizado,
			@RequestParam("verificarContrasenia") String verificarContrasenia) {

		System.out.println("Estoy dentro de ActualizarDatosPersonales de vista areaPersonaUsusario");
		ModelAndView mav = new ModelAndView("areaPersonaUsuario");

		Integer idUsuario = (Integer) session.getAttribute("idUsuario");
		Usuario usuario = repositorioUsuario.findById(idUsuario).orElse(null);

		UsuarioValidaciones validaciones = new UsuarioValidaciones();

		if (!validaciones.isValidNombreEmpresa(usuarioActualizado.getNombreEmpresa())) {
			mav.addObject("errorNombreEmpresaInvalido", true);

			System.out.println(usuario.getNombreEmpresa());

			System.out.println(!validaciones.isValidNombreEmpresa(usuarioActualizado.getNombreEmpresa()));

		} else if (!validaciones.isValidNifEmpresa(usuarioActualizado.getNifEmpresa())) {
			mav.addObject("errorNifEmpresaInvalido", true);

		} else if (!validaciones.isValidNombreUsuario(usuarioActualizado.getNombreUsuario())) {

			mav.addObject("errorNombreUsuarioInvalido", true);

		} else if (!validaciones.isValidPassword(usuarioActualizado.getContraseniaUsuario())) {

			mav.addObject("errorContraseniaUsuarioInvalido", true);

		} else if (!usuarioActualizado.getContraseniaUsuario().equals(verificarContrasenia)) {

			mav.addObject("errorPasswordNoCoincide", true);
		}

		else {

			System.out.println("NO SE HAN ENCONTRADO ERRORES");

			usuario.setNombreEmpresa(usuarioActualizado.getNombreEmpresa());

			usuario.setNifEmpresa(usuarioActualizado.getNifEmpresa());

			usuario.setNombreUsuario(usuarioActualizado.getNombreUsuario());

			usuario.setTelefonoUsuario(usuarioActualizado.getTelefonoUsuario());

			usuario.setContraseniaUsuario(usuarioActualizado.getContraseniaUsuario());

			System.out.println("Datos recogidos son correctos " + usuario);

			// Guardo la información actualizada en la base de datos
			repositorioUsuario.save(usuario);

			// Redirijo a la misma página para mostrar los datos actualizados
			return new ModelAndView("redirect:/areaPersonaUsuario");

		}

		// Si hay errores de validación, retorno el objeto ModelAndView con los mensajes
		// de error
		return mav;

	}

	@GetMapping("/seleccionarUsuario")
	public ModelAndView seleccionarUsuario(@RequestParam("idUsuario") Integer idUsuario) {

		System.out.println("Seleccionar usuario: " + idUsuario);

		// buscar usuario por id, si no lo encuentra, crea un objeto de usuario vacio
		Usuario usuario = repositorioUsuario.findById(idUsuario).orElse(new Usuario());

		ModelAndView mav = new ModelAndView("formularioUsuario");

		mav.addObject("usuario", usuario);

		return mav;
	}

	// mismo patron
	@PostMapping("/modificarUsuario")
	public ModelAndView modificarUsuario(@ModelAttribute Usuario usuario) {

		System.out.println("FormularioOfertaControlador.modificarUsuario : " + usuario);

		gestorUsuario.modificar(usuario);

		ModelAndView mav = new ModelAndView("redirect:listadoUsuario"); // vista

		return mav;

	}

	@PostMapping("/borrarUsuario")
	public ModelAndView borrarUsuario(@RequestParam("idUsuario") Integer idUsuario) {

		System.out.println("FormularioClientesControlador.borrarUsuario");

		Usuario usuario = repositorioUsuario.findById(idUsuario).orElse(null);

		if (usuario != null) {
			gestorUsuario.borrar(usuario);

			ModelAndView mav = new ModelAndView("redirect:gestionarUsuariosAdmin");
			return mav;
		} else {
			// Si el usuario no se encuentra, redirigir a una página de error o manejarlo de
			// otra manera
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al borrar el usuario: no se encontró el usuario con el ID especificado");
			return mav;
		}
	}

}
