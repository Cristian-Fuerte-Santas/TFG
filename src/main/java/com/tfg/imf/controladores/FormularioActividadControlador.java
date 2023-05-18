package com.tfg.imf.controladores;

import java.util.List;
import java.util.NoSuchElementException;

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

import com.tfg.imf.modelo.GestorActividad;
import com.tfg.imf.modelo.GestorImagenes;
import com.tfg.imf.persistencia.IRepositorioActividad;
import com.tfg.imf.persistencia.IRepositorioDestino;
import com.tfg.imf.persistencia.IRepositorioImagenesActividad;
import com.tfg.imf.persistencia.IRepositorioRestaurante;
import com.tfg.imf.entidades.*;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;

@Controller
public class FormularioActividadControlador {

	@Autowired
	private GestorActividad gestorActividad;

	@Autowired
	private IRepositorioActividad repositorioActividad;

	@Autowired
	private IRepositorioImagenesActividad repositorioImagenesActividad;

	@Autowired
	IRepositorioRestaurante repositorioRestaurante;

	@Autowired
	IRepositorioDestino repositorioDestino;

	@Autowired
	GestorImagenes gestorImagenes;

	public FormularioActividadControlador() {
		super();
		System.out.println("Creando una instancia de FormularioActividadControlador");
	}

	@PostMapping("/insertarActividad")
	public ModelAndView insertarActividad(@ModelAttribute Actividad actividad,
			@RequestParam("multipartFiles") List<MultipartFile> files) {

		System.out.println("FormularioActividadControlador.insertarActividad: " + actividad);

		try {
			// Crear una instancia de Actividad
			Actividad nuevaActividad = new Actividad();

			// Buscar el objeto Destino usando el destinoId y asignarlo a la Actividad
			Destino destino = repositorioDestino.findById(actividad.getDestino().getIdDestino()).orElse(null);
			if (destino != null) {
				actividad.setDestino(destino);
			} else {
				System.out.println("no hay ese destino");
			}

			nuevaActividad.setNombreActividad(actividad.getNombreActividad());
			nuevaActividad.setDestino(actividad.getDestino());
			nuevaActividad.setTipoActividad(actividad.getTipoActividad());
			nuevaActividad.setDireccionActividad(actividad.getDireccionActividad());
			nuevaActividad.setAforoActividad(actividad.getAforoActividad());
			nuevaActividad.setPrecioActividad(actividad.getPrecioActividad());

			// Guardar imágenes en el sistema de archivos y asociarlas a la actividad
			// Suponiendo que tienes un gestorActividad similar a tu gestorHotel

			Set<ImagenesActividad> imagenes = new HashSet<>();

			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					try {
						String imageUrl = gestorActividad.guardarImagenActividad(file);
						ImagenesActividad imagen = new ImagenesActividad();
						imagen.setUrlImagenActividad(imageUrl);
						imagen.setActividad(nuevaActividad);
						imagenes.add(imagen);
					} catch (IOException e) {
						System.out.println("Error al guardar la imagen en FormularioActividadControlador");
					}
				}
			}

			// Asociar las imágenes a la actividad
			nuevaActividad.setListadoImagenesActividad(imagenes);

			// Llamar al método insertar del GestorActividad
			gestorActividad.insertar(nuevaActividad);

			ModelAndView mav = new ModelAndView("insertarOfertasAdmin");
			mav.addObject("exitoRegistro", true);

			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

			Destino destinoParaLaVista = new Destino();
			mav.addObject("destino", destinoParaLaVista);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			Actividad actividadParaLaVista = new Actividad();
			mav.addObject("actividad", actividadParaLaVista);

			Restaurante restaurante = new Restaurante();
			mav.addObject("restaurante", restaurante);

			List<Restaurante> restaurantes = repositorioRestaurante.verTodosLosRestaurantes();
			mav.addObject("restaurantes", restaurantes);

			MenuRestaurante menuRestaurante = new MenuRestaurante();
			mav.addObject("menuRestaurante", menuRestaurante);

			Hotel hotel = new Hotel();
			mav.addObject("hotel", hotel);

			return mav;

		} catch (Exception e) {
			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al insertar la actividad en la base de datos");
			mav.addObject("excepcion", e);

			SalaHotel salaHotel = new SalaHotel();
			mav.addObject("salaHotel", salaHotel);

			Destino destinoParaLaVista = new Destino();
			mav.addObject("destino", destinoParaLaVista);

			List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
			mav.addObject("destinos", destinos);

			Actividad actividadParaLaVista = new Actividad();
			mav.addObject("actividad", actividadParaLaVista);

			Restaurante restaurante = new Restaurante();
			mav.addObject("restaurante", restaurante);

			List<Restaurante> restaurantes = repositorioRestaurante.verTodosLosRestaurantes();
			mav.addObject("restaurantes", restaurantes);

			MenuRestaurante menuRestaurante = new MenuRestaurante();
			mav.addObject("menuRestaurante", menuRestaurante);

			Hotel hotel = new Hotel();
			mav.addObject("hotel", hotel);

			return mav;
		}

	}

	// PARA MOSTRAR LOS HOTELES
	@GetMapping("/obtenerActividades")
	@ResponseBody
	public List<Actividad> obtenerActividades() {
		List<Actividad> actividades = repositorioActividad.verTodasLasActividades();
		System.out.println("Actividades devueltas: " + actividades);
		return actividades;
	}

	@GetMapping("/verActividades")
	public ModelAndView verActividades() {
		System.out.println("FormularioActividadControlador.verActividades");

		List<Actividad> actividades = gestorActividad.verTodasLasActividades();

		ModelAndView mav = new ModelAndView("verActividades");
		mav.addObject("actividades", actividades);

		return mav;
	}

	@PostMapping("/borrarActividad")
	public ModelAndView borrarActividad(@RequestParam("idActividad") Integer idActividad) {

		System.out.println("FormularioActividadControlador.borrarActividad");

		Actividad actividad = repositorioActividad.findById(idActividad).orElse(null);

		if (actividad != null) {
			gestorActividad.borrar(actividad);

			ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
			return mav;
		} else {

			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al borrar la actividad: no se encontró el hotel con el ID especificado");
			return mav;
		}
	}

	@PostMapping("/eliminarUnaImagenActividad")
	public @ResponseBody String eliminarUnaImagenActividad(@RequestParam("idImagen") Integer idImagen) {
		try {
			// Obtener la imagen de la base de datos
			ImagenesActividad imagen = repositorioImagenesActividad.findById(idImagen).orElseThrow(null);

			// Eliminar la imagen del servidor
			String nombreArchivo = Paths.get(imagen.getUrlImagenActividad()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);

			// Eliminar la imagen de la base de datos
			repositorioImagenesActividad.delete(imagen);

			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error al eliminar la imagen";
		}
	}

	@GetMapping("/obtenerActividadPorId")
	public ResponseEntity<Actividad> obtenerActividad(@RequestParam("idActividad") Integer idActividad) {
		Actividad actividad = gestorActividad.obtenerActividadPorId(idActividad);
		return ResponseEntity.ok(actividad);
	}

	@PostMapping(value = "/modificarActividad", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
	public ModelAndView modificarActividad(@ModelAttribute Actividad actividad,
			@RequestParam("idDestino") Integer idDestino,
			@RequestParam(value = "nuevasImagenes", required = false) MultipartFile[] nuevasImagenes) {

		try {
			Actividad actividadParaModificar = repositorioActividad.findById(actividad.getIdActividad()).orElse(null);

			if (actividadParaModificar != null) {
				Destino destino = repositorioDestino.findById(idDestino).orElseThrow(() -> {
					System.out.println("No se encontró el destino con id " + idDestino);
					return new NoSuchElementException();
				});

				actividadParaModificar.setTipoActividad(actividad.getTipoActividad());

				actividadParaModificar.setNombreActividad(actividad.getNombreActividad());

				actividadParaModificar.setDireccionActividad(actividad.getDireccionActividad());

				actividadParaModificar.setAforoActividad(actividad.getAforoActividad());

				actividadParaModificar.setPrecioActividad(actividad.getPrecioActividad());

				actividadParaModificar.setDestino(destino);

				Set<ImagenesActividad> imagenes = actividadParaModificar.getListadoImagenesActividad();

				// Para cada nueva imagen, guardarla y agregar una nueva entrada a las imágenes
				// del restaurante
				if (nuevasImagenes != null) {
					for (MultipartFile file : nuevasImagenes) {
						if (!file.isEmpty()) {
							try {
								// Guardar la nueva imagen en el sistema de archivos y obtener la URL donde se
								// guarda
								String imageUrl = gestorActividad.guardarImagenActividad(file);

								// Crear una nueva instancia de ImagenesRestaurante para la nueva imagen
								ImagenesActividad nuevaImagen = new ImagenesActividad();
								nuevaImagen.setUrlImagenActividad(imageUrl);
								nuevaImagen.setActividad(actividadParaModificar);

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
				actividadParaModificar.setListadoImagenesActividad(imagenes);

				gestorActividad.modificar(actividadParaModificar);

				ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
				return mav;
			} else {
				// Si el restaurante no se encuentra, redirigir a una página de error o
				// manejarlo de otra manera
				ModelAndView mav = new ModelAndView("error");

				mav.addObject("mensaje",
						"Error al modificar la actividad: no se encontró el restaurante con el ID especificado");

				return mav;
			}
		} catch (Exception e) {

			// Si algo falla, que muestre el error
			System.err.println("Error al modificar la actividad en la base de datos:");
			System.err.println(e.getMessage());
			e.printStackTrace();
			return null;
		}

	}

}
