package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.tfg.imf.modelo.GestorRestaurante;
import com.tfg.imf.persistencia.IRepositorioDestino;
import com.tfg.imf.persistencia.IRepositorioHotel;
import com.tfg.imf.persistencia.IRepositorioImagenesHotel;
import com.tfg.imf.persistencia.IRepositorioRestaurante;

import java.util.ArrayList;
import java.util.List;

import java.io.IOException;

import java.util.HashSet;
import java.util.Set;

@Controller
public class FormularioHotelControlador {

	@Autowired
	GestorHotel gestorHotel;

	@Autowired
	IRepositorioHotel repositorioHotel;

	@Autowired
	IRepositorioImagenesHotel repositorioImagenesHotel;

	@Autowired
	IRepositorioDestino repositorioDestino;

	// private List<MultipartFile> multipartFiles = new ArrayList<>();

	// ESTE METODO CONTROLA TODOS LOS MAPEOS DE ESTA VISTA

	@GetMapping("/insertarOfertasAdmin")
	public ModelAndView mostrarFormularioInsertarOfertas() {
		ModelAndView mav = new ModelAndView("insertarOfertasAdmin");

		Hotel hotel = new Hotel();
		mav.addObject("hotel", hotel);

		Restaurante restaurante = new Restaurante();
		mav.addObject("restaurante", restaurante);

		Actividad actividad = new Actividad();
		mav.addObject("actividad", actividad);

		// Obtener la lista de destinos y agregarla al modelo
		List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
		mav.addObject("destinos", destinos);

		SalaHotel salaHotel = new SalaHotel(); // Asegúrate de agregar esta línea
		mav.addObject("salaHotel", salaHotel);

		Transporte transporte = new Transporte();
		mav.addObject("transporte", transporte);
		
		 List<Hotel> hoteles = obtenerHoteles();
		    mav.addObject("hoteles", hoteles);

		return mav;
	}

	@PostMapping("/insertarHotel")
	public ModelAndView insertarHotel(@ModelAttribute Hotel hotel,
			@RequestParam("multipartFiles") List<MultipartFile> files) {

		System.out.println("FormularioHotelCrontrolador.insertarHotel: " + hotel);

		try {
			// Crear una instancia de Hotel
			Hotel nuevoHotel = new Hotel();

			// Buscar el objeto Destino usando el destinoId y asignarlo al Hotel
			Destino destino = repositorioDestino.findById(hotel.getDestino().getIdDestino()).orElse(null);
			if (destino != null) {

				hotel.setDestino(destino);
			} else {
				System.out.println("no hay ese destino");
			}

			nuevoHotel.setNombreHotel(hotel.getNombreHotel());

			nuevoHotel.setDestino(hotel.getDestino());
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
						String imageUrl = gestorHotel.guardarImagen(file);

						ImagenesHotel imagen = new ImagenesHotel();
						imagen.setUrlImagenHotel(imageUrl);
						imagen.setHotel(nuevoHotel);
						imagenes.add(imagen);
					} catch (IOException e) {
						// Manejar excepción al guardar la imagen
					}
				}
			}

			// Asociar las imágenes al hotel
			nuevoHotel.setListadoImagenesHotel(imagenes);

			// Llamar al método insertar del GestorHotel
			gestorHotel.insertar(nuevoHotel);

			ModelAndView mav = new ModelAndView("insertarOfertasAdmin");
			mav.addObject("exitoRegistro", true);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud
			Restaurante restaurante = new Restaurante();
			mav.addObject("hotel", restaurante);

			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			Transporte transporte = new Transporte();
			mav.addObject("transporte", transporte);

			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

			return mav;

		} catch (Exception e) {
			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al insertar el hotel en la base de datos");
			mav.addObject("excepcion", e);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud
			Restaurante restaurante = new Restaurante();
			mav.addObject("hotel", restaurante);

			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			Transporte transporte = new Transporte();
			mav.addObject("transporte", transporte);

			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

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

}
