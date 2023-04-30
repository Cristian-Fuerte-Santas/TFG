package com.tfg.imf.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.tfg.imf.modelo.GestorMenuRestaurante;
import com.tfg.imf.persistencia.IRepositorioDestino;
import com.tfg.imf.persistencia.IRepositorioImagenesMenuRestaurante;
import com.tfg.imf.persistencia.IRepositorioMenuRestaurante;
import com.tfg.imf.persistencia.IRepositorioRestaurante;
import com.tfg.imf.entidades.*;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@Controller
public class FormularioMenuRestauranteControlador {

	@Autowired
	private GestorMenuRestaurante gestorMenuRestaurante;

	@Autowired
	private IRepositorioMenuRestaurante repositorioMenuRestaurante;

	@Autowired
	private IRepositorioImagenesMenuRestaurante repositorioImagenesMenuRestaurante;

	@Autowired
	private IRepositorioRestaurante repositorioRestaurante;

	@Autowired
	IRepositorioDestino repositorioDestino;

	public FormularioMenuRestauranteControlador() {
		super();
		System.out.println("Creando una instancia de FormularioMenuRestauranteControlador");
	}

	@PostMapping("/insertarMenuRestaurante")
	public ModelAndView insertarMenuRestaurante(@ModelAttribute MenuRestaurante menuRestaurante,
			@RequestParam("multipartFiles") List<MultipartFile> files) {

		System.out.println("MenuRestauranteController.insertarMenuRestaurante: " + menuRestaurante);

		try {
			// Crear una instancia de MenuRestaurante
			MenuRestaurante nuevoMenuRestaurante = new MenuRestaurante();

			// Buscar el objeto Restaurante usando el restauranteId y asignarlo al
			// MenuRestaurante
			Restaurante restaurante = repositorioRestaurante
					.findById(menuRestaurante.getRestaurante().getIdRestaurante()).orElse(null);
			if (restaurante != null) {
				menuRestaurante.setRestaurante(restaurante);
			} else {
				System.out.println("No se encuentra el restaurante");
			}

			nuevoMenuRestaurante.setPrecioMenuNormal(menuRestaurante.getPrecioMenuNormal());
			nuevoMenuRestaurante.setPrecioMenuVegetariano(menuRestaurante.getPrecioMenuVegetariano());
			nuevoMenuRestaurante.setPrecioMenuVegano(menuRestaurante.getPrecioMenuVegano());
			nuevoMenuRestaurante.setPrecioMenuCeliaco(menuRestaurante.getPrecioMenuCeliaco());
			nuevoMenuRestaurante.setRestaurante(menuRestaurante.getRestaurante());

			// Guardar imágenes en el sistema de archivos y asociarlas al MenuRestaurante
			Set<ImagenesMenuRestaurante> imagenes = new HashSet<>();

			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					try {

						String imageUrl = gestorMenuRestaurante.guardarImagen(file);

						ImagenesMenuRestaurante imagen = new ImagenesMenuRestaurante();
						imagen.setUrlImagenMenuRestaurante(imageUrl);
						imagen.setMenuRestaurante(nuevoMenuRestaurante);
						imagenes.add(imagen);
					} catch (IOException e) {
						System.out.println("Error al guardar la imagen en FormularioMenuRestaurante");
					}
				}
			}

			// Asociar las imágenes al MenuRestaurante
			nuevoMenuRestaurante.setListadoImagenesMenuRestaurante(imagenes);

			// Llamar al método insertar del GestorMenuRestaurante
			gestorMenuRestaurante.insertar(nuevoMenuRestaurante);

			ModelAndView mav = new ModelAndView("insertarOfertasAdmin");
			mav.addObject("exitoRegistro", true);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud

		

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud

			// Lista de todos los restaurantes, necesario para seleccionar uno en el formulario
			List<Restaurante> restaurantes = repositorioRestaurante.verTodosLosRestaurantes();
			mav.addObject("restaurantes", restaurantes);

			// Restaurante para el formulario, no es necesario mantenerlo como "restauranteParaVista"
			Restaurante restauranteVista = new Restaurante();
			mav.addObject("restaurante", restauranteVista);
			
			
			// MenuRestaurante para el formulario, necesario para el formulario de MenuRestaurante
			MenuRestaurante menuRestauranteVista = new MenuRestaurante();
			mav.addObject("menuRestauranteVista", menuRestauranteVista);


			// Hotel para el formulario, necesario para el formulario de Hotel
			Hotel hotel = new Hotel();
			mav.addObject("hotel", hotel);

			// Destino para el formulario, necesario para el formulario de Hotel
			Destino destino = new Destino();
			mav.addObject("destino", destino);

			// Actividad para el formulario, necesario para el formulario de Actividad
			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			// Lista de todos los destinos, necesario para seleccionar uno en el formulario
			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			// Transporte para el formulario, necesario para el formulario de Transporte
			Transporte transporte = new Transporte();
			mav.addObject("transporte", transporte);

			// SalaHotel para el formulario, necesario para el formulario de SalaHotel
			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

		
			
			
	
			return mav;

		} catch (Exception e) {
			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al insertar el menú del restaurante en la base de datos");
			mav.addObject("excepcion", e);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// Lista de todos los restaurantes, necesario para seleccionar uno en el formulario
			List<Restaurante> restaurantes = repositorioRestaurante.verTodosLosRestaurantes();
			mav.addObject("restaurantes", restaurantes);

			// Restaurante para el formulario, no es necesario mantenerlo como "restauranteParaVista"
			Restaurante restauranteVista = new Restaurante();
			mav.addObject("restaurante", restauranteVista);
			
			
			// MenuRestaurante para el formulario, necesario para el formulario de MenuRestaurante
			MenuRestaurante menuRestauranteVista = new MenuRestaurante();
			mav.addObject("menuRestauranteVista", menuRestauranteVista);


			// Hotel para el formulario, necesario para el formulario de Hotel
			Hotel hotel = new Hotel();
			mav.addObject("hotel", hotel);

			// Destino para el formulario, necesario para el formulario de Hotel
			Destino destino = new Destino();
			mav.addObject("destino", destino);

			// Actividad para el formulario, necesario para el formulario de Actividad
			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			// Lista de todos los destinos, necesario para seleccionar uno en el formulario
			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			// Transporte para el formulario, necesario para el formulario de Transporte
			Transporte transporte = new Transporte();
			mav.addObject("transporte", transporte);

			// SalaHotel para el formulario, necesario para el formulario de SalaHotel
			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

			
			
			return mav;
		}
	}
	
	 
	  // PARA MOSTRAR LOS MENUS RESTAURANTES
	  
	  @GetMapping("/obtenerMenuRestaurantes")
	  
	  @ResponseBody public List<MenuRestaurante> obtenerMenuRestaurantes() {
	  List<MenuRestaurante> menuRestaurantes =
	  repositorioMenuRestaurante.verTodosLosMenusRestaurantes();
	  System.out.println("Menu Restaurantes devueltos: " + menuRestaurantes);
	  return menuRestaurantes; }
	  
	  
	  @PostMapping("/borrarMenuRestaurante")
	  public ModelAndView borrarMenuRestaurante(@RequestParam("idMenu") Integer idMenu) {
	      System.out.println("FormularioOfertasControlador.borrarMenuRestaurante");

	      MenuRestaurante menu = repositorioMenuRestaurante.findById(idMenu).orElse(null);

	      if (menu != null) {
	          gestorMenuRestaurante.borrar(menu);

	          ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
	          return mav;
	      } else {
	          // Si el menu no se encuentra, redirigir a una página de error o manejarlo de
	          // otra manera
	          ModelAndView mav = new ModelAndView("error");
	          mav.addObject("mensaje", "Error al borrar el menú: no se encontró el menú con el ID especificado");
	          return mav;
	      }
	  }

	  
	  
	 
	 

}
