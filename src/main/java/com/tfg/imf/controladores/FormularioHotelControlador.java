package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tfg.imf.entidades.*;

import com.tfg.imf.modelo.GestorHotel;
import com.tfg.imf.modelo.GestorImagenes;
import com.tfg.imf.persistencia.IRepositorioDestino;
import com.tfg.imf.persistencia.IRepositorioHotel;
import com.tfg.imf.persistencia.IRepositorioImagenesHotel;
import com.tfg.imf.persistencia.IRepositorioRestaurante;


import java.util.List;
import java.util.NoSuchElementException;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;

@Controller
public class FormularioHotelControlador {

	@Autowired
	private GestorHotel gestorHotel;

	@Autowired
	private IRepositorioHotel repositorioHotel;

	@Autowired
	private IRepositorioImagenesHotel repositorioImagenesHotel;

	@Autowired
	private IRepositorioDestino repositorioDestino;

	@Autowired
	private IRepositorioRestaurante repositorioRestaurante;

	@Autowired
	private GestorImagenes gestorImagenes;
	// private List<MultipartFile> multipartFiles = new ArrayList<>();

	// ESTE METODO CONTROLA TODOS LOS MAPEOS DE ESTA VISTA

	@GetMapping("/insertarOfertasAdmin")
	public ModelAndView mostrarFormularioInsertarOfertas() {
		ModelAndView mav = new ModelAndView("insertarOfertasAdmin");

		Hotel hotel = new Hotel();
		mav.addObject("hotel", hotel);

		Restaurante restaurante = new Restaurante();
		mav.addObject("restaurante", restaurante);

		List<Restaurante> restaurantes = repositorioRestaurante.verTodosLosRestaurantes();
		mav.addObject("restaurantes", restaurantes);

		MenuRestaurante menuRestaurante = new MenuRestaurante();
		mav.addObject("menuRestaurante", menuRestaurante);

		Actividad actividad = new Actividad();
		mav.addObject("actividad", actividad);

		
		List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
		mav.addObject("destinos", destinos);

		SalaHotel salaHotel = new SalaHotel(); 
		mav.addObject("salaHotel", salaHotel);

	

		List<Hotel> hoteles = obtenerHoteles();
		mav.addObject("hoteles", hoteles);

		return mav;
	}

	@PostMapping("/insertarHotel")
	public ModelAndView insertarHotel(@ModelAttribute Hotel hotel,
			@RequestParam("multipartFiles") List<MultipartFile> files) {

		System.out.println("FormularioHotelCrontrolador.insertarHotel: " + hotel);
		
		System.out.println("Destino id from form: " + hotel.getDestino().getIdDestino());


		try {
			// Crear una instancia de Hotel
			Hotel nuevoHotel = new Hotel();

			// Buscar el objeto Destino usando el destinoId y asignarlo al Hotel
			Destino destino = repositorioDestino.findById(hotel.getDestino().getIdDestino()).orElse(null);
			if (destino != null) {
				
				System.out.println("Soy destino antes: " + hotel.getDestino());
				nuevoHotel.setDestino(destino);
				System.out.println("Soy destino despues: " + nuevoHotel.getDestino());
			} else {
				System.out.println("no hay ese destino");
			}
			
			
			nuevoHotel.setNombreHotel(hotel.getNombreHotel());

		//	nuevoHotel.setDestino(hotel.getDestino());
			nuevoHotel.setCategoriaHotel(hotel.getCategoriaHotel());
			nuevoHotel.setAforoHotel(hotel.getAforoHotel());
			nuevoHotel.setDireccionHotel(hotel.getDireccionHotel());
			nuevoHotel.setPrecioHotel(hotel.getPrecioHotel());

			// Establecer atributos booleanos
			nuevoHotel.setPiscinaHotel(hotel.isPiscinaHotel());
			nuevoHotel.setGimnasioHotel(hotel.isGimnasioHotel());
			nuevoHotel.setTerrazaHotel(hotel.isTerrazaHotel());
			nuevoHotel.setSpaHotel(hotel.isSpaHotel());

			// Guardar imágenes en el sistema de archivos y asociarlas al hotel
			// fuente chat gpt

			Set<ImagenesHotel> imagenes = new HashSet<>();

			for (MultipartFile file : files) {
				if (!file.isEmpty()) {

					try {
						// Aquí guardarías la imagen en el sistema de archivos y obtendrías la URL donde
						// se guarda
						
						
						
						String imageUrl = gestorHotel.guardarImagenHotel(file);

						ImagenesHotel imagen = new ImagenesHotel();
						imagen.setUrlImagenHotel(imageUrl);
						imagen.setHotel(nuevoHotel);
						imagenes.add(imagen);
						
						
						
					} catch (IOException e) {
						System.out.println("Error al guardar la imgen en FormularioHotelControlador");
					}
				}
			}
			
			
			

			// Asociar las imágenes al hotel
			nuevoHotel.setListadoImagenesHotel(imagenes);

			
			// Llamar al método insertar del GestorHotel
			gestorHotel.insertar(nuevoHotel);

			ModelAndView mav = new ModelAndView("insertarOfertasAdmin");
			mav.addObject("exitoRegistro", true);

			Destino destinoParaLaVista = new Destino();
			mav.addObject("destino", destinoParaLaVista);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud
			Restaurante restaurante = new Restaurante();
			mav.addObject("restaurante", restaurante);

			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			

			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

			MenuRestaurante menuRestaurante = new MenuRestaurante();
			mav.addObject("menuRestaurante", menuRestaurante);

			return mav;

		} catch (Exception e) {
			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al insertar el hotel en la base de datos");
			mav.addObject("excepcion", e);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud
			Restaurante restaurante = new Restaurante();
			mav.addObject("restaurante", restaurante);

			Destino destinoParaLaVista = new Destino();
			mav.addObject("destino", destinoParaLaVista);

			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			
			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

			MenuRestaurante menuRestaurante = new MenuRestaurante();
			mav.addObject("menuRestaurante", menuRestaurante);

			return mav;
		}
	}

	// PARA MOSTRAR LOS HOTELES
	@GetMapping("/obtenerHoteles")
	@ResponseBody
	public List<Hotel> obtenerHoteles() {
		List<Hotel> hoteles = repositorioHotel.verTodosLosHoteles();
		System.out.println("Hoteles devueltos: " + hoteles);
		return hoteles;
	}
	
	@GetMapping("/verHoteles")
	public ModelAndView verHoteles() {
	    System.out.println("FormularioHotelControlador.verHoteles");

	    List<Hotel> hoteles = gestorHotel.verTodosLosHoteles();

	    ModelAndView mav = new ModelAndView("verHoteles");
	    mav.addObject("hoteles", hoteles);

	    return mav;
	}
	
	
	
	@PostMapping("/borrarHotel")
	public ModelAndView borrarHotel(@RequestParam("idHotel") Integer idHotel) {
	    System.out.println("FormularioOfertasControlador.borrarHotel");

	    Hotel hotel = repositorioHotel.findById(idHotel).orElse(null);

	    if (hotel != null) {
	        gestorHotel.borrar(hotel);

	        ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
	        return mav;
	    } else {
	        // Si el hotel no se encuentra, redirigir a una página de error o manejarlo de
	        // otra manera
	        ModelAndView mav = new ModelAndView("error");
	        mav.addObject("mensaje", "Error al borrar el hotel: no se encontró el hotel con el ID especificado");
	        return mav;
	    }
	}
	
	
	@PostMapping("/eliminarUnaImagenHotel")
	public @ResponseBody String eliminarUnaImagenHotel(@RequestParam("idImagen") Integer idImagen) {
		try {
			// Obtener la imagen de la base de datos
			ImagenesHotel imagen = repositorioImagenesHotel.findById(idImagen).orElseThrow(null);

			// Eliminar la imagen del servidor
			String nombreArchivo = Paths.get(imagen.getUrlImagenHotel()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);

			// Eliminar la imagen de la base de datos
			repositorioImagenesHotel.delete(imagen);

			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error al eliminar la imagen";
		}
	}

	
	// PARA SELECCIONAR EL BOTON DE MODIFICAR CORRESPONDIENTE
	@GetMapping("/obtenerHotelPorId")
	public ResponseEntity<Hotel> obtenerHotel(@RequestParam("idHotel") Integer idHotel) {
		Hotel hotel = gestorHotel.obtenerHotelPorId(idHotel);
		return ResponseEntity.ok(hotel);
	}
	
	
	@PostMapping(value = "/modificarHotel", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
	public ModelAndView modificarHotel(@ModelAttribute Hotel hotel,
	        @RequestParam("idDestino") Integer idDestino,
	        @RequestParam(value = "nuevasImagenes", required = false) MultipartFile[] nuevasImagenes) {
		
		System.out.println("Hotel recibido" + hotel.toString());
		try {
			Hotel hotelParaModificar = repositorioHotel.findById(hotel.getIdHotel()).orElse(null);
			
			
			
			if (hotelParaModificar != null) {
				Destino destino = repositorioDestino.findById(idDestino).orElseThrow(() -> {
					System.out.println("No se encontró el destino con id " + idDestino);
					return new NoSuchElementException();
				});
				
				
				hotelParaModificar.setNombreHotel(hotel.getNombreHotel());
				hotelParaModificar.setCategoriaHotel(hotel.getCategoriaHotel());
				hotelParaModificar.setPiscinaHotel(hotel.isPiscinaHotel());
				hotelParaModificar.setGimnasioHotel(hotel.isGimnasioHotel());
				hotelParaModificar.setTerrazaHotel(hotel.isTerrazaHotel());
				hotelParaModificar.setSpaHotel(hotel.isSpaHotel());
				hotelParaModificar.setAforoHotel(hotel.getAforoHotel());
				hotelParaModificar.setDireccionHotel(hotel.getDireccionHotel());
				hotelParaModificar.setPrecioHotel(hotel.getPrecioHotel());
				hotelParaModificar.setDestino(destino);
				
				Set<ImagenesHotel> imagenes = hotelParaModificar.getListadoImagenesHotel();				
				
				
				
				// Para cada nueva imagen, guardarla y agregar una nueva entrada a las imágenes del restaurante
				if (nuevasImagenes != null) {
				    for (MultipartFile file : nuevasImagenes) {
				        if (!file.isEmpty()) {
				            try {
				                // Guardar la nueva imagen en el sistema de archivos y obtener la URL donde se guarda
				                String imageUrl = gestorHotel.guardarImagenHotel(file);

				                // Crear una nueva instancia de ImagenesRestaurante para la nueva imagen
				                ImagenesHotel nuevaImagen = new ImagenesHotel();
				                nuevaImagen.setUrlImagenHotel(imageUrl);
				                nuevaImagen.setHotel(hotelParaModificar);

				                // Añadir la nueva imagen a las imágenes del restaurante
				                imagenes.add(nuevaImagen);
				            } catch (IOException e) {
				                // Manejar excepción al guardar la imagen
				            	System.out.println("No se ha podido guardar la nueva imagen");
				                e.printStackTrace();
				            }
				        }
				    }
				}
				
				
				

				// Actualizar las imágenes del restaurante en la base de datos
				hotelParaModificar.setListadoImagenesHotel(imagenes);
				
				gestorHotel.modificar(hotelParaModificar);

				ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
				return mav;
			} else {
				// Si el restaurante no se encuentra, redirigir a una página de error o
				// manejarlo de otra manera
				ModelAndView mav = new ModelAndView("error");
				
				mav.addObject("mensaje",
						"Error al modificar el hotel: no se encontró el restaurante con el ID especificado");

				return mav;
			}
		} catch (Exception e) {

			// Si algo falla, que muestre el error
			System.err.println("Error al modificar el hotel en la base de datos:");
			System.err.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
		
		
		
	}
	

	
	
	
	
	


}
