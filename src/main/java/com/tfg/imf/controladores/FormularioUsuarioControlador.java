package com.tfg.imf.controladores;

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

import com.tfg.imf.entidades.Usuario;
import com.tfg.imf.modelo.GestorUsuario;
import com.tfg.imf.persistencia.IRepositorioUsuario;


import java.util.List;

import javax.validation.Valid;

@Controller
public class FormularioUsuarioControlador {

	// inyectando los modelos y creando la logica de negocio

	// llamamos a las persistencias

	@Autowired
	private GestorUsuario gestorUsuario;

	@Autowired
	private IRepositorioUsuario respositorioUsuario;

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

	@GetMapping("/areaPersonaUsuario")
	public ModelAndView verAreaPersonaUsuario() {

		System.out.println("FormularioUsuarioControlador.verAreaPersonaUsuario");

		// como el header de php, redirige a donde queramos
		ModelAndView mav = new ModelAndView("areaPersonaUsuario");

		return mav;
	}

	@GetMapping("/areaPersonaAdmin")
	public ModelAndView verAreaPersonaAdmin() {

		System.out.println("FormularioUsuarioControlador.verAreaPersonaAdmin");

		// como el header de php, redirige a donde queramos
		ModelAndView mav = new ModelAndView("areaPersonaAdmin");

		return mav;
	}

	@GetMapping("/faq")
	public ModelAndView verFaq() {

		System.out.println("FormularioUsuarioControlador.verFaq");

		// como el header de php, redirige a donde queramos
		ModelAndView mav = new ModelAndView("faq");

		return mav;
	}
	
	/*
	
	@GetMapping("/insertarOfertasAdmin")
	public ModelAndView verInsertarOfertasAdmin() {

		System.out.println("FormularioUsuarioControlador.verInsertarOfertasAdmin");

		// como el header de php, redirige a donde queramos
		ModelAndView mav = new ModelAndView("insertarOfertasAdmin");

		return mav;
	}
*/
	
	
	
	// PARA EL CRUD	
	
		
	@PostMapping("/insertarUsuario")
	public ModelAndView insertarUsuario(@Valid @ModelAttribute Usuario usuario, BindingResult result) {
		
	    //ModelAndView mav = new ModelAndView();
	   //mav.setViewName("loginYregistro");
	   ModelAndView mav = new ModelAndView("loginYregistro");
	    
	    
	    // Si no hay errores, intentamos insertar el usuario en la base de datos
	    if (!result.hasErrors()) { 
	    	
	    	Usuario nuevoUsuario = new Usuario();
	        
	        nuevoUsuario.setNombreEmpresa(usuario.getNombreEmpresa());
	        nuevoUsuario.setNifEmpresa(usuario.getNifEmpresa());
	        nuevoUsuario.setNombreUsuario(usuario.getNombreUsuario());
	        nuevoUsuario.setEmailUsuario(usuario.getEmailUsuario());
	        nuevoUsuario.setTelefonoUsuario(usuario.getTelefonoUsuario());
	        nuevoUsuario.setContraseniaUsuario(usuario.getContraseniaUsuario());
	        
	        try {
	        	
	            gestorUsuario.insertar(nuevoUsuario);
	            
	            
	            
	            // Si se inserta correctamente, agregamos un mensaje de éxito al ModelAndView	            
	            mav.addObject("exitoRegistro", true);
	            
	        } catch (Exception e) {
	            // Si algo falla, agregamos un mensaje de error al ModelAndView
	            mav.addObject("errorInsertar", "Error al insertar el usuario en la base de datos");
	        }
	    	
	       
	        
	    } else { 
	    	
	    	// Si se inserta correctamente, agregamos un mensaje de éxito al ModelAndView	            
            mav.addObject("errorFormulario", true);
	    	
	    	// Agregamos los mensajes de error al ModelAndView, esto analiza primero si es true o false, y en los true guarda el mensaje de error de la entidad 
	        mav.addObject("errorNombreEmpresa", result.getFieldError("nombreEmpresa"));
	        mav.addObject("errorNifEmpresa", result.getFieldError("nifEmpresa"));
	        mav.addObject("errorNombreUsuario", result.getFieldError("nombreUsuario"));
	        mav.addObject("errorEmailUsuario", result.getFieldError("emailUsuario"));
	        mav.addObject("errorTelefonoUsuario", result.getFieldError("telefonoUsuario"));
	        mav.addObject("errorContraseniaUsuario", result.getFieldError("contraseniaUsuario"));
	        
	        System.out.println("Valor de errorFormulario: " + mav.getModel().get("errorFormulario"));
	        
	    }
	    
	
	    return mav;
	}


	
	

	@GetMapping("/seleccionarUsuario")
	public ModelAndView seleccionarUsuario(@RequestParam("idUsuario") Integer idUsuario) {

		System.out.println("Seleccionar usuario: " + idUsuario);

		// buscar usuario por id, si no lo encuentra, crea un objeto de usuario vacio
		Usuario usuario = respositorioUsuario.findById(idUsuario).orElse(new Usuario());

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

		Usuario usuario = respositorioUsuario.findById(idUsuario).orElse(null);

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

	
	@GetMapping("/gestionarUsuariosAdmin")
	public ModelAndView gestionarUsuarios() {

		System.out.println("FormularioClientesControlador.gestionarUsuarios");

		List<Usuario> usuarios = gestorUsuario.verTodosLosUsuarios();

		ModelAndView mav = new ModelAndView("gestionarUsuariosAdmin");

		mav.addObject("usuarios", usuarios);

		return mav;
	}

}
