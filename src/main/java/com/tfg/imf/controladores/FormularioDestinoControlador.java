package com.tfg.imf.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tfg.imf.entidades.Destino;
import com.tfg.imf.entidades.Usuario;
import com.tfg.imf.modelo.GestorDestino;
import com.tfg.imf.persistencia.IRepositorioDestino;

@Controller
public class FormularioDestinoControlador {
	
	@Autowired
	private GestorDestino gestorDestino;
	
	@Autowired
	private IRepositorioDestino repositorioDestino;

	public FormularioDestinoControlador() {
		super();
		System.out.println("Creando una instancia de FormularioDestinoControlador");
	}
	

	@GetMapping("/insertarDestinoAdmin")
	public ModelAndView gestionarDestinoAdmin() {

		System.out.println("FormularioDestinoControlador.insertarDestinosAdmin");

		List<Destino> destinos = gestorDestino.verTodosLosDestinos();

		ModelAndView mav = new ModelAndView("insertarDestinoAdmin");

		mav.addObject("destinos", destinos);
		
		mav.addObject("destino", new Destino()); 

		return mav;
	}
	

	@PostMapping("/insertarDestino")
	public ModelAndView insertarDestino(@ModelAttribute Destino destino) {

		System.out.println("FormularioDestinoControlador.insertarDestino: " + destino);

		try {
			// Crear una instancia de Usuario
			Destino nuevoDestino = new Destino();
			
			nuevoDestino.setCiudad(destino.getCiudad());


			// Llamar al método insertar del GestorUsuario
			gestorDestino.insertar(nuevoDestino);

			ModelAndView mav = new ModelAndView("redirect:insertarDestinoAdmin");

			// Agregar atributo al ModelAndView
			mav.addObject("exitoRegistroDestino", true);

			return mav;

		} catch (Exception e) {

			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");

			mav.addObject("mensaje", "Error al insertar el destino en la base de datos");

			mav.addObject("excepcion", e);

			return mav;
		}
	}
	
	
	
	@PostMapping("/borrarDestino")
	public ModelAndView borrarDestino(@RequestParam("idDestino") Integer idDestino) {

		System.out.println("FormularioClientesControlador.borrarDestino");

		Destino destino = repositorioDestino.findById(idDestino).orElse(null);

		if (destino != null) {
			gestorDestino.borrar(destino);

			ModelAndView mav = new ModelAndView("redirect:insertarDestinoAdmin");
			return mav;
		} else {
			// Si el usuario no se encuentra, redirigir a una página de error o manejarlo de
			// otra manera
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al borrar el destino: no se encontró el destino con el ID especificado");
			return mav;
		}
	}
	
	
	

}
