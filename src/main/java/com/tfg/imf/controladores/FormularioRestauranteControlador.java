package com.tfg.imf.controladores;

import java.util.List;

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

import com.tfg.imf.modelo.GestorRestaurante;

import com.tfg.imf.persistencia.IRepositorioDestino;
import com.tfg.imf.persistencia.IRepositorioImagenesRestaurante;
import com.tfg.imf.persistencia.IRepositorioRestaurante;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@Controller
public class FormularioRestauranteControlador {

	@Autowired
	private GestorRestaurante gestorRestaurante;

	@Autowired
	private IRepositorioRestaurante repositorioRestaurante;

	@Autowired
	IRepositorioImagenesRestaurante repositorioImagenesRestaurante;

	@Autowired
	private IRepositorioDestino repositorioDestino;

	public FormularioRestauranteControlador() {
		super();
		System.out.println("Creando una instancia de FormularioRestauranteControlador");
	}

	@PostMapping("/insertarRestaurante")
	public ModelAndView insertarRestaurante(@ModelAttribute Restaurante restaurante,
			@RequestParam("multipartFiles") List<MultipartFile> files) {

		System.out.println("FormularioRestauranteControlador.insertarRestaurante: " + restaurante);

		try {
			// Crear una instancia de Restaurante
			Restaurante nuevoRestaurante = new Restaurante();

			// Buscar el objeto Destino usando el destinoId y asignarlo al Restaurante
			Destino destino = repositorioDestino.findById(restaurante.getDestino().getIdDestino()).orElse(null);
			if (destino != null) {
				restaurante.setDestino(destino);
			} else {
				System.out.println("No hay ese destino");
			}

			// Establecer los atributos del Restaurante
			nuevoRestaurante.setNombreRestaurante(restaurante.getNombreRestaurante());
			nuevoRestaurante.setTipoRestaurante(restaurante.getTipoRestaurante());
			nuevoRestaurante.setDestino(restaurante.getDestino());
			nuevoRestaurante.setCategoriaRestaurante(restaurante.getCategoriaRestaurante());
			nuevoRestaurante.setAforoRestaurante(restaurante.getAforoRestaurante());
			nuevoRestaurante.setDireccionRestaurante(restaurante.getDireccionRestaurante());

			// Guardar imágenes en el sistema de archivos y asociarlas al restaurante
			Set<ImagenesRestaurante> imagenes = new HashSet<>();

			for (MultipartFile file : files) {
				if (!file.isEmpty()) {

					try {
						// Aquí guardarías la imagen en el sistema de archivos y obtendrías la URL donde
						// se guarda
						String imageUrl = gestorRestaurante.guardarImagenRestaurante(file);

						ImagenesRestaurante imagen = new ImagenesRestaurante();
						imagen.setUrlImagenRestaurante(imageUrl);
						imagen.setRestaurante(nuevoRestaurante);
						imagenes.add(imagen);
					} catch (IOException e) {
						// Manejar excepción al guardar la imagen
					}
				}
			}

			// Asociar las imágenes al restaurante
			nuevoRestaurante.setListadoImagenesRestaurante(imagenes);

			// Llamar al método save del GestorRestaurante
			gestorRestaurante.insertar(nuevoRestaurante);

			ModelAndView mav = new ModelAndView("insertarOfertasAdmin");
			mav.addObject("exitoRegistro", true);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud
			Hotel hotel = new Hotel();
			mav.addObject("hotel", hotel);

			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			Restaurante restauranteParaVista = new Restaurante();
			mav.addObject("restauranteParaVista", restauranteParaVista);

			Transporte transporte = new Transporte();
			mav.addObject("transporte", transporte);

			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

			MenuRestaurante menuRestaurante = new MenuRestaurante();
			mav.addObject("menuRestaurante", menuRestaurante);

			return mav;

		} catch (Exception e) {
			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al insertar el restaurante en la base de datos");
			mav.addObject("excepcion", e);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud
			Hotel hotel = new Hotel();
			mav.addObject("hotel", hotel);

			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			Transporte transporte = new Transporte();
			mav.addObject("transporte", transporte);

			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

			MenuRestaurante menuRestaurante = new MenuRestaurante();
			mav.addObject("menuRestaurante", menuRestaurante);

			Restaurante restauranteParaVista = new Restaurante();
			mav.addObject("restauranteParaVista", restauranteParaVista);

			return mav;
		}
	}

	// PARA MOSTRAR LOS RESTAURANTES
	@GetMapping("/obtenerRestaurantes")
	@ResponseBody
	public List<Restaurante> obtenerRestaurantes() {
		List<Restaurante> restaurantes = repositorioRestaurante.verTodosLosRestaurantes();
		System.out.println("Restaurantes devueltos: " + restaurantes);
		return restaurantes;
	}

}
