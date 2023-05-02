package com.tfg.imf.controladores;

import org.hibernate.tool.schema.internal.AbstractSchemaValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tfg.imf.entidades.*;
import com.tfg.imf.modelo.GestorHotel;
import com.tfg.imf.modelo.GestorMenuRestaurante;
import com.tfg.imf.modelo.GestorRestaurante;
import com.tfg.imf.modelo.GestorSalaHotel;
import com.tfg.imf.modelo.GestorUsuario;
import com.tfg.imf.persistencia.IRepositorioUsuario;
import com.tfg.imf.validaciones.*;
import javax.servlet.http.HttpSession;

import java.util.List;

import javax.validation.Valid;

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

	@GetMapping("/gestionarUsuariosAdmin")
	public ModelAndView gestionarUsuarios() {

		System.out.println("FormularioClientesControlador.gestionarUsuarios");

		List<Usuario> usuarios = gestorUsuario.verTodosLosUsuarios();

		ModelAndView mav = new ModelAndView("gestionarUsuariosAdmin");

		mav.addObject("usuarios", usuarios);

		return mav;
	}

	@GetMapping("/gestionarOfertasAdmin")
	public ModelAndView verGestionarOfertasAdmin() {

		System.out.println("FormularioUsuarioControlador.verGestiornarOfertaAdmin");

		List<Hotel> hoteles = gestorHotel.verTodosLosHoteles();

		List<Restaurante> restaurantes = gestorRestaurante.verTodosLosRestaurantes();

		List<SalaHotel> salashoteles = gestorSalaHotel.verTodasLasSalasHotel();
		
		List<MenuRestaurante> menusRestaurantes = gestorMenuRestaurante.verTodosLosMenusRestaurantes();
		// como el header de php, redirige a donde queramos
		ModelAndView mav = new ModelAndView("gestionarOfertasAdmin");
		mav.addObject("hoteles", hoteles);
		mav.addObject("restaurantes", restaurantes);
		mav.addObject("salashoteles", salashoteles);
		mav.addObject("menusRestaurantes", menusRestaurantes);

		return mav;
	}

	// VISTA LOGIN Y USUARIO

	@PostMapping("/insertarUsuario")
	public ModelAndView insertarUsuario(@ModelAttribute Usuario usuario,

			@RequestParam("verificarContrasenia") String verificarContrasenia) {

		UsuarioValidaciones validaciones = new UsuarioValidaciones();

		ModelAndView mav = new ModelAndView("loginYregistro");

		// Si no hay errores, intentamos insertar el usuario en la base de datos

		Usuario nuevoUsuario = new Usuario();

		// OJO que no ha validado el telefono

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

		boolean admin = false;

		boolean valido = false;

		boolean usuarioValido = false;

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

//2. Luego confirmo que el string recibido NO sea null y que se haya encontrado con un boolean

			emailEncontrado = buscandoEmail != null && buscandoEmail.equals(emailRecibido);

//emailEncontrado = repositorioUsuario.findEmail(emailRecibido).equals(emailRecibido);    

			System.out.println("email encontrado: " + emailEncontrado);

			if (!emailEncontrado) {

				System.out.println("Hay que sacarle: el email no se ha localizado");

				mav.addObject("errorEmailNoEncontrado", true);

			} else {

				// como he encontrado el email, ahora me quedo con la ID del email

				idUsuario = repositorioUsuario.findIdByEmail(emailRecibido);

				System.out.println("El id del usuario es: " + idUsuario);

//busco que la id del email corresponda con la contraseña con un boolean

				contraseniaEncontrada = repositorioUsuario.findContraseniaById(idUsuario).equals(contraseniaRecibido);

				System.out
						.println("Tiene id de la contraseña tiene la misma contraseña en la BD que la que dice tener? "
								+ contraseniaEncontrada);

				if (!contraseniaEncontrada) {

					System.out.println("Hay que sacarle: datos introducidos no son correcto");

					mav.addObject("errorContraseniaNoEncontrada", true);

				} else {
					
					//guardamos la ID en SESSION
					session.setAttribute("idUsuario", idUsuario);
					
					if (repositorioUsuario.findContraseniaById(idUsuario).equals(contraseniaRecibido)
							&& idUsuario <= 4 && contraseniaEncontrada) {	
					
						System.out.println("Eres ADMIN");

						mav.addObject("exitoRegistro", true);

						return new ModelAndView("redirect:/areaPersonaAdmin");

					}else {
						
						System.out.println("Eres USUARIO");
 
						mav.addObject("exitoRegistro", true);

						return new ModelAndView("redirect:/areaPersonaUsuario");

					}

				}
					
			}
			// mav.addObject("usuarioValido", usuarioValido);     
		}

		return mav;	

	}
	
	//VISTA AREA PERSONA USUARIO
	
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
	public ModelAndView actualizarDatosPersonales(HttpSession session, 
			@ModelAttribute Usuario usuarioActualizado, 
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

		} else if(!validaciones.isValidPassword(usuarioActualizado.getContraseniaUsuario())) {
			
			mav.addObject("errorContraseniaUsuarioInvalido", true);
			
		}else if (!usuarioActualizado.getContraseniaUsuario().equals(verificarContrasenia)) {
		    
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
	    
	 // Si hay errores de validación, retorno el objeto ModelAndView con los mensajes de error
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
