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




import com.tfg.imf.modelo.GestorSalaHotel;
import com.tfg.imf.persistencia.IRepositorioDestino;
import com.tfg.imf.persistencia.IRepositorioHotel;
import com.tfg.imf.persistencia.IRepositorioImagenesSalaHotel;
import com.tfg.imf.persistencia.IRepositorioSalaHotel;

import java.io.IOException;
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

	        // Agregar objetos necesarios para el formulario, incluso si no se están utilizando en esta solicitud
	        Hotel hotelParaVista = new Hotel();
	        mav.addObject("hotel", hotelParaVista);

	        Restaurante restaurante = new Restaurante();
	        mav.addObject("restaurante", restaurante);

	        Actividad actividad = new Actividad();
	        mav.addObject("actividad", actividad);

	        List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
	        mav.addObject("destinos", destinos);

	        Transporte transporte = new Transporte();
	        mav.addObject("transporte", transporte);

	      

	        return mav;

	    } catch (Exception e) {
	        // Si algo falla, que muestre el error
	    	ModelAndView mav = new ModelAndView("error");
			mav.addObject("mensaje", "Error al insertar la sala hotel en la base de datos");
			mav.addObject("excepcion", e);

	
			  // Agregar objetos necesarios para el formulario, incluso si no se están utilizando en esta solicitud
	        Hotel hotelParaVista = new Hotel();
	        mav.addObject("hotel", hotelParaVista);

	        Restaurante restaurante = new Restaurante();
	        mav.addObject("restaurante", restaurante);

	        Actividad actividad = new Actividad();
	        mav.addObject("actividad", actividad);

	        List<Destino> destinos = repositorioDestino.verTodosLosDestinos();
	        mav.addObject("destinos", destinos);

	        Transporte transporte = new Transporte();
	        mav.addObject("transporte", transporte);
	        
	        return mav;
	        
	    }
	}
	
	
	
	//PARA MOSTRAR LAS SALAS HOTEL
		@GetMapping("/obtenerSalaHotel")
		@ResponseBody
		public List<SalaHotel> obtenerSalasHotel() {
			List<SalaHotel> salasHoteles = repositorioSalaHotel.verTodasLasSalasHotel();
			System.out.println("Salas Hoteles devueltas: " + salasHoteles);
			return salasHoteles;
		}
		
		
		
}
