package com.tfg.imf.controladores;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tfg.imf.entidades.*;
import com.tfg.imf.modelo.GestorDestino;
import com.tfg.imf.modelo.GestorImagenes;
import com.tfg.imf.modelo.GestorRestaurante;

import com.tfg.imf.persistencia.IRepositorioDestino;
import com.tfg.imf.persistencia.IRepositorioImagenesRestaurante;
import com.tfg.imf.persistencia.IRepositorioRestaurante;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;

import java.util.Optional;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;

import java.util.NoSuchElementException;

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

	@Autowired
	private GestorImagenes gestorImagenes;
	
	@Autowired
	private GestorDestino gestorDestino;

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

	// PARA BORRAR
	@PostMapping("/borrarRestaurante")
	public ModelAndView borrarRestaurante(@RequestParam("idRestaurante") Integer idRestaurante) {
		System.out.println("FormularioOfertasControlador.borrarRestaurante");

		Restaurante restaurante = repositorioRestaurante.findById(idRestaurante).orElse(null);

		if (restaurante != null) {
			gestorRestaurante.borrar(restaurante);

			ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
			return mav;
		} else {
			// Si el restaurante no se encuentra, redirigir a una página de error o
			// manejarlo de
			// otra manera
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje",
					"Error al borrar el restaurante: no se encontró el restaurante con el ID especificado");
			return mav;
		}
	}

	// PARA SELECCIONAR EL BOTON DE MODIFICAR CORRESPONDIENTE
	@GetMapping("/obtenerRestaurantePorId")
	public ResponseEntity<Restaurante> obtenerRestaurante(@RequestParam("idRestaurante") Integer idRestaurante) {
		Restaurante restaurante = gestorRestaurante.obtenerRestaurantePorId(idRestaurante);
		return ResponseEntity.ok(restaurante);
	}

	// PARA que muestre el formulario del restaurante correspondiente
	@GetMapping("/modificarRestauranteFormulario")
	public ModelAndView modificarRestauranteFormulario(@RequestParam("idRestaurante") Integer idRestaurante) {
		System.out.println("FormularioOfertasControlador.modificarRestauranteFormulario");

		Restaurante restaurante = repositorioRestaurante.findById(idRestaurante).orElse(null);

		if (restaurante != null) {
			ModelAndView mav = new ModelAndView("modificarRestauranteFormulario");
			mav.addObject("restaurante", restaurante);
			mav.addObject("destinos", repositorioDestino.verTodosLosDestinos());
			return mav;
		} else {
			// Si el restaurante no se encuentra, redirigir a una página de error o
			// manejarlo de
			// otra manera
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje",
					"Error al mostrar el formulario de modificación: no se encontró el restaurante con el ID especificado");
			return mav;
		}
	}

	@PostMapping("/eliminarUnaImagenRestaurante")
	public @ResponseBody String eliminarUnaImagenRestaurante(@RequestParam("idImagen") Integer idImagen) {
		try {
			// Obtener la imagen de la base de datos
			ImagenesRestaurante imagen = repositorioImagenesRestaurante.findById(idImagen).orElseThrow(null);

			// Eliminar la imagen del servidor
			String nombreArchivo = Paths.get(imagen.getUrlImagenRestaurante()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);

			// Eliminar la imagen de la base de datos
			repositorioImagenesRestaurante.delete(imagen);

			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error al eliminar la imagen";
		}
	}

	
	
	
	
	
	
	
	
	
	/*
	
	@PostMapping(value = "/modificarRestaurante", consumes = { "multipart/form-data" })
	public ModelAndView modificarRestaurante(
	    @ModelAttribute Restaurante restaurante,
	    @RequestParam(value = "nuevasImagenes", required = false) MultipartFile[] nuevasImagenes,
	    @RequestParam(value = "imagenesReemplazo", required = false) List<MultipartFile> imagenesReemplazo,
	    @RequestParam(value = "idImagenesReemplazo", required = false) List<Integer> idImagenesReemplazo) {
		System.out.println("FormularioOfertasControlador.modificarRestaurante");

		try {
			Restaurante restauranteParaModificar = repositorioRestaurante.findById(restaurante.getIdRestaurante())
					.orElse(null);

			if (restauranteParaModificar != null) {
				// Actualizar las propiedades de restauranteParaModificar con los valores
				// que vienen en el objeto restaurante que es el parámetro del método
				restauranteParaModificar.setNombreRestaurante(restaurante.getNombreRestaurante());
				restauranteParaModificar.setTipoRestaurante(restaurante.getTipoRestaurante());
				
				
			//	restauranteParaModificar.setDestino(restaurante.getDestino());
				
				Destino destino = repositorioDestino.findById(restaurante.getDestino().getIdDestino()).orElse(null);
				if (destino != null) {
				    restauranteParaModificar.setDestino(destino);
				} else {
				    // Manejar el caso donde el destino no se encuentra
				}

				
				
				restauranteParaModificar.setCategoriaRestaurante(restaurante.getCategoriaRestaurante());
				restauranteParaModificar.setAforoRestaurante(restaurante.getAforoRestaurante());
				restauranteParaModificar.setDireccionRestaurante(restaurante.getDireccionRestaurante());

				// Obtener las imágenes existentes del restaurante
				Set<ImagenesRestaurante> imagenes = restauranteParaModificar.getListadoImagenesRestaurante();

				// Para cada nueva imagen, guardarla y agregar una nueva entrada a las imágenes del restaurante
				if (nuevasImagenes != null) {
				    for (MultipartFile file : nuevasImagenes) {
				        if (!file.isEmpty()) {
				            try {
				                // Guardar la nueva imagen en el sistema de archivos y obtener la URL donde se guarda
				                String imageUrl = gestorRestaurante.guardarImagenRestaurante(file);

				                // Crear una nueva instancia de ImagenesRestaurante para la nueva imagen
				                ImagenesRestaurante nuevaImagen = new ImagenesRestaurante();
				                nuevaImagen.setUrlImagenRestaurante(imageUrl);
				                nuevaImagen.setRestaurante(restauranteParaModificar);

				                // Añadir la nueva imagen a las imágenes del restaurante
				                imagenes.add(nuevaImagen);
				            } catch (IOException e) {
				                // Manejar excepción al guardar la imagen
				                e.printStackTrace();
				            }
				        }
				    }
				}

				// Para cada imagen de reemplazo, buscar la imagen existente y reemplazarla
				if (imagenesReemplazo != null && idImagenesReemplazo != null) {
				    for (int i = 0; i < imagenesReemplazo.size(); i++) {
				        MultipartFile file = imagenesReemplazo.get(i);
				        Integer idImagen = idImagenesReemplazo.get(i);

				        if (idImagen == null) {
				            // Si idImagen es null, puedes continuar con la próxima iteración del bucle,
				            // o hacer algo más si es necesario.
				            continue;
				        }

				        // Encontrar la imagen existente en el conjunto de imágenes
				        ImagenesRestaurante imagenExistente = imagenes.stream()
				                .filter(imagen -> imagen.getIdImagenRestaurante().equals(idImagen)).findFirst()
				                .orElse(null);

				        if (imagenExistente != null) {
				            try {
				                // Reemplazar la imagen existente en el sistema de archivos y obtener la URL
				                // donde se guarda
				                String imageUrl = gestorRestaurante.guardarImagenRestaurante(file);

				                // Actualizar la URL de la imagen existente
				                imagenExistente.setUrlImagenRestaurante(imageUrl);
				            } catch (IOException e) {
				                // Manejar excepción al guardar la imagen
				                e.printStackTrace();
				            }
				        }
				    }
				}


				// Actualizar las imágenes del restaurante en la base de datos
				restauranteParaModificar.setListadoImagenesRestaurante(imagenes);
				gestorRestaurante.modificar(restauranteParaModificar);

				ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
				return mav;
			} else {
				// Si el restaurante no se encuentra, redirigir a una página de error o
				// manejarlo de otra manera
				ModelAndView mav = new ModelAndView("error");
				mav.addObject("mensaje",
						"Error al modificar el restaurante: no se encontró el restaurante con el ID especificado");
				return mav;
			}
		} catch (Exception e) {
			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al modificar el restaurante en la base de datos");
			mav.addObject("excepcion", e);
			return mav;
		}
	}
	
	
	
	
	*/
	
	
	
	@PostMapping(value = "/modificarRestaurante", consumes = { "multipart/form-data" })
	public ModelAndView modificarRestaurante(
	    @ModelAttribute Restaurante restaurante,
	    @RequestParam("idDestino") Integer idDestino, 
	    @RequestParam(value = "nuevasImagenes", required = false) MultipartFile[] nuevasImagenes
	    ) {
	    System.out.println("FormularioOfertasControlador.modificarRestaurante");

	    System.out.println("HOLAAAA: " + restaurante.toString());
	    System.out.println("HOLAAAA 2: " + restaurante);
	    System.out.println("HOLAAAA 2: "+ restaurante.getDestino());
	    
	    try {
	        Restaurante restauranteParaModificar = repositorioRestaurante.findById(restaurante.getIdRestaurante())
	            .orElse(null);

	        if (restauranteParaModificar != null) {
	            // Aquí obtienes el Destino a partir del ID que se envió
	        	Destino destino = repositorioDestino.findById(idDestino)
	        		    .orElseThrow(() -> {
	        		        System.out.println("No se encontró el destino con id " + idDestino);
	        		        return new NoSuchElementException();
	        		    });
	            restauranteParaModificar.setNombreRestaurante(restaurante.getNombreRestaurante());
	            restauranteParaModificar.setTipoRestaurante(restaurante.getTipoRestaurante());
	            restauranteParaModificar.setDestino(destino);

				
				
				restauranteParaModificar.setCategoriaRestaurante(restaurante.getCategoriaRestaurante());
				restauranteParaModificar.setAforoRestaurante(restaurante.getAforoRestaurante());
				restauranteParaModificar.setDireccionRestaurante(restaurante.getDireccionRestaurante());

				// Obtener las imágenes existentes del restaurante
				Set<ImagenesRestaurante> imagenes = restauranteParaModificar.getListadoImagenesRestaurante();

				// Para cada nueva imagen, guardarla y agregar una nueva entrada a las imágenes del restaurante
				if (nuevasImagenes != null) {
				    for (MultipartFile file : nuevasImagenes) {
				        if (!file.isEmpty()) {
				            try {
				                // Guardar la nueva imagen en el sistema de archivos y obtener la URL donde se guarda
				                String imageUrl = gestorRestaurante.guardarImagenRestaurante(file);

				                // Crear una nueva instancia de ImagenesRestaurante para la nueva imagen
				                ImagenesRestaurante nuevaImagen = new ImagenesRestaurante();
				                nuevaImagen.setUrlImagenRestaurante(imageUrl);
				                nuevaImagen.setRestaurante(restauranteParaModificar);

				                // Añadir la nueva imagen a las imágenes del restaurante
				                imagenes.add(nuevaImagen);
				            } catch (IOException e) {
				                // Manejar excepción al guardar la imagen
				                e.printStackTrace();
				            }
				        }
				    }
				}

		


				// Actualizar las imágenes del restaurante en la base de datos
				restauranteParaModificar.setListadoImagenesRestaurante(imagenes);
				gestorRestaurante.modificar(restauranteParaModificar);

				ModelAndView mav = new ModelAndView("redirect:gestionarOfertasAdmin");
				return mav;
			} else {
				// Si el restaurante no se encuentra, redirigir a una página de error o
				// manejarlo de otra manera
				ModelAndView mav = new ModelAndView("error");
				System.out.println("Puta mierda");
				mav.addObject("mensaje",
						"Error al modificar el restaurante: no se encontró el restaurante con el ID especificado");
				
				
				return mav;
			}
		} catch (Exception e) {
			
			
			
			
			
			 // Si algo falla, que muestre el error
		    System.err.println("Error al modificar el restaurante en la base de datos:");
		    System.err.println(e.getMessage());
		    e.printStackTrace();
		    return null;
		}
	}
	                    	
	                    	
	                   
	
	
	
	
	
	
	
	
	
	
	

}
