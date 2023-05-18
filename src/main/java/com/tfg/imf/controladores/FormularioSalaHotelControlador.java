package com.tfg.imf.controladores;

import java.util.List;

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
import com.tfg.imf.modelo.GestorImagenes;
import com.tfg.imf.modelo.GestorSalaHotel;
import com.tfg.imf.persistencia.IRepositorioDestino;
import com.tfg.imf.persistencia.IRepositorioHotel;
import com.tfg.imf.persistencia.IRepositorioImagenesSalaHotel;
import com.tfg.imf.persistencia.IRepositorioSalaHotel;

import java.io.IOException;
import java.nio.file.Paths;

import java.util.HashSet;
import java.util.Set;

@Controller
public class FormularioSalaHotelControlador {

	@Autowired
	private GestorSalaHotel gestorSalaHotel;

	@Autowired
	private IRepositorioHotel repositorioHotel;

	@Autowired
	private IRepositorioSalaHotel repositorioSalaHotel;

	@Autowired
	IRepositorioImagenesSalaHotel repositorioImagenesSalaHotel;

	@Autowired
	IRepositorioDestino repositorioDestino;

	@Autowired
	private GestorImagenes gestorImagenes;

	public FormularioSalaHotelControlador() {
		super();
		System.out.println("Creando una instancia de FormularioSalaHotelControlador");
	}

	@PostMapping("/insertarSalaHotel")
	public ModelAndView insertarSalaHotel(@ModelAttribute SalaHotel salaHotel,
			@RequestParam("multipartFiles") List<MultipartFile> files) {

		System.out.println("FormularioSalaHotelControlador.insertarSalaHotel: " + salaHotel);

		try {
			// Crear una instancia de SalaHotel
			SalaHotel nuevaSalaHotel = new SalaHotel();

			// Buscar el objeto Hotel usando el hotelId y asignarlo a la SalaHotel
			Hotel hotel = repositorioHotel.findById(salaHotel.getHotel().getIdHotel()).orElse(null);
			if (hotel != null) {
				salaHotel.setHotel(hotel);
			} else {
				System.out.println("No hay ese hotel");
			}

			// Establecer los atributos de la SalaHotel
			nuevaSalaHotel.setNombreSala(salaHotel.getNombreSala());
			nuevaSalaHotel.setAforoSala(salaHotel.getAforoSala());
			nuevaSalaHotel.setMetrosSala(salaHotel.getMetrosSala());
			nuevaSalaHotel.setEquipoSonidoSala(salaHotel.isEquipoSonidoSala());
			nuevaSalaHotel.setProyectorSala(salaHotel.isProyectorSala());
			nuevaSalaHotel.setPrecioSala(salaHotel.getPrecioSala());
			nuevaSalaHotel.setHotel(salaHotel.getHotel());

			// Guardar imágenes en el sistema de archivos y asociarlas a la SalaHotel
			Set<ImagenesSalaHotel> imagenes = new HashSet<>();

			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					try {
						// Aquí guardarías la imagen en el sistema de archivos y obtendrías la URL donde
						// se guarda
						String imageUrl = gestorSalaHotel.guardarImagenSalaHotel(file);

						ImagenesSalaHotel imagen = new ImagenesSalaHotel();
						imagen.setUrlImagenSalaHotel(imageUrl);
						imagen.setSalaHotel(nuevaSalaHotel);
						imagenes.add(imagen);
					} catch (IOException e) {
						// Manejar excepción al guardar la imagen
					}
				}
			}

			// Asociar las imágenes a la SalaHotel
			nuevaSalaHotel.setListadoImagenesSalaHotel(imagenes);

			// Llamar al método insertar del GestorSalaHotel
			gestorSalaHotel.insertar(nuevaSalaHotel);

			ModelAndView mav = new ModelAndView("insertarOfertasAdmin");
			mav.addObject("exitoRegistro", true);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud
			Hotel hotelParaVista = new Hotel();
			mav.addObject("hotel", hotelParaVista);

			Restaurante restaurante = new Restaurante();
			mav.addObject("restaurante", restaurante);

			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			// Obtener todos los hoteles
			List<Hotel> listaHoteles = repositorioHotel.verTodosLosHoteles();
			// Agregar la lista de hoteles al objeto ModelAndView
			mav.addObject("listaHoteles", listaHoteles);

			MenuRestaurante menuRestaurante = new MenuRestaurante();
			mav.addObject("menuRestaurante", menuRestaurante);

			return mav;

		} catch (Exception e) {
			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al insertar la sala hotel en la base de datos");
			mav.addObject("excepcion", e);

			// Agregar objetos necesarios para el formulario, incluso si no se están
			// utilizando en esta solicitud
			Hotel hotelParaVista = new Hotel();
			mav.addObject("hotel", hotelParaVista);

			Restaurante restaurante = new Restaurante();
			mav.addObject("restaurante", restaurante);

			Actividad actividad = new Actividad();
			mav.addObject("actividad", actividad);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			// Obtener todos los hoteles
			List<Hotel> listaHoteles = repositorioHotel.verTodosLosHoteles();
			// Agregar la lista de hoteles al objeto ModelAndView
			mav.addObject("listaHoteles", listaHoteles);
			MenuRestaurante menuRestaurante = new MenuRestaurante();
			mav.addObject("menuRestaurante", menuRestaurante);

			return mav;

		}
	}

	// PARA MOSTRAR LAS SALAS HOTEL
	@GetMapping("/obtenerSalaHotel")
	@ResponseBody
	public List<SalaHotel> obtenerSalasHotel() {
		List<SalaHotel> salasHoteles = repositorioSalaHotel.verTodasLasSalasHotel();
		System.out.println("Salas Hoteles devueltas: " + salasHoteles);
		return salasHoteles;
	}

	@PostMapping("/borrarSalaHotel")
	public ModelAndView borrarSalaHotel(@RequestParam("idSala") Integer idSala) {
		System.out.println("FormularioOfertasControlador.borrarSalaHotel");

		SalaHotel sala = repositorioSalaHotel.findById(idSala).orElse(null);

		if (sala != null) {
			gestorSalaHotel.borrar(sala);

			ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
			return mav;
		} else {
			// Si la sala no se encuentra, redirigir a una página de error o manejarlo de
			// otra manera
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al borrar la sala: no se encontró la sala con el ID especificado");
			return mav;
		}
	}

	@GetMapping("/obtenerSalaHotelPorId")
	public ResponseEntity<SalaHotel> obtenerSalaHotelPorId(@RequestParam("idSalaHotel") Integer idSalaHotel) {
		SalaHotel salaHotel = gestorSalaHotel.obtenerSalaHotelPorId(idSalaHotel);
		return ResponseEntity.ok(salaHotel);
	}

	@PostMapping("/eliminarUnaImagenSalaHotel")
	public @ResponseBody String eliminarUnaImagenSalaHotel(@RequestParam("idImagen") Integer idImagen) {
		try {
			// Obtener la imagen de la base de datos
			ImagenesSalaHotel imagen = repositorioImagenesSalaHotel.findById(idImagen).orElseThrow(null);

			// Eliminar la imagen del servidor
			String nombreArchivo = Paths.get(imagen.getUrlImagenSalaHotel()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);

			// Eliminar la imagen de la base de datos
			repositorioImagenesSalaHotel.delete(imagen);

			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error al eliminar la imagen";
		}
	}

	// PARA que muestre el formulario del restaurante correspondiente
	@GetMapping("/modificarSalaHotelFormulario")
	public ModelAndView modificarSalaHotelFormulario(@RequestParam("idSalaHotel") Integer idSalaHotel) {

		System.out.println("FormularioSalaHotelControlador.modificarSalaHotelFormulario");

		SalaHotel salaHotel = repositorioSalaHotel.findById(idSalaHotel).orElse(null);

		if (salaHotel != null) {
			ModelAndView mav = new ModelAndView("modificarRestauranteFormulario");
			mav.addObject("salahotel", salaHotel);
			mav.addObject("destinos", repositorioDestino.verTodosLosDestinos());
			mav.addObject("hoteles", repositorioHotel.verTodosLosHoteles());
			return mav;
		} else {

			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje",
					"Error al mostrar el formulario de modificación: no se encontró la Sala Hotel con el ID especificado");
			return mav;
		}
	}

	@PostMapping(value = "/modificarSalaHotel", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
	public ModelAndView modificarSalaHotel(@ModelAttribute SalaHotel salaHotel,

			@RequestParam(value = "nuevasImagenes", required = false) MultipartFile[] nuevasImagenes) {

		System.out.println("FormularioOfertasControlador.modificarSalaHotel");

		try {
			SalaHotel salaHotelParaModificar = repositorioSalaHotel.findById(salaHotel.getIdSalaHotel()).orElse(null);

			if (salaHotelParaModificar != null) {

				salaHotelParaModificar.setNombreSala(salaHotel.getNombreSala());
				salaHotelParaModificar.setAforoSala(salaHotel.getAforoSala());
				salaHotelParaModificar.setMetrosSala(salaHotel.getMetrosSala());
				salaHotelParaModificar.setEquipoSonidoSala(salaHotel.isEquipoSonidoSala());
				salaHotelParaModificar.setProyectorSala(salaHotel.isProyectorSala());
				salaHotelParaModificar.setPrecioSala(salaHotel.getPrecioSala());

				// Obtener las imágenes existentes del restaurante
				Set<ImagenesSalaHotel> imagenes = salaHotelParaModificar.getListadoImagenesSalaHotel();

				// Para cada nueva imagen, guardarla y agregar una nueva entrada a las imágenes
				// del restaurante
				if (nuevasImagenes != null) {
					for (MultipartFile file : nuevasImagenes) {
						if (!file.isEmpty()) {
							try {
								// Guardar la nueva imagen en el sistema de archivos y obtener la URL donde se
								// guarda
								String imageUrl = gestorSalaHotel.guardarImagenSalaHotel(file);

								// Crear una nueva instancia de ImagenesRestaurante para la nueva imagen
								ImagenesSalaHotel nuevaImagen = new ImagenesSalaHotel();
								nuevaImagen.setUrlImagenSalaHotel(imageUrl);
								nuevaImagen.setSalaHotel(salaHotelParaModificar);

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

				salaHotelParaModificar.setListadoImagenesSalaHotel(imagenes);

				gestorSalaHotel.modificar(salaHotelParaModificar);

				ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
				// Obtener todos los hoteles
				List<Hotel> listaHoteles = repositorioHotel.verTodosLosHoteles();
				// Agregar la lista de hoteles al objeto ModelAndView
				mav.addObject("listaHoteles", listaHoteles);

				return mav;
			} else {

				ModelAndView mav = new ModelAndView("error");
				// Obtener todos los hoteles
				List<Hotel> listaHoteles = repositorioHotel.verTodosLosHoteles();
				// Agregar la lista de hoteles al objeto ModelAndView
				mav.addObject("listaHoteles", listaHoteles);

				mav.addObject("mensaje",
						"Error al modificar la sala hotel: no se encontró la sala hotel con el ID especificado");

				return mav;
			}
		} catch (Exception e) {

			// Si algo falla, que muestre el error
			System.err.println("Error al modificar la sala hotel en la base de datos:");
			System.err.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
