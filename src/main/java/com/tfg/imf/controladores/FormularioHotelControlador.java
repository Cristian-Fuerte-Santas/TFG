package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tfg.imf.entidades.Hotel;
import com.tfg.imf.entidades.Usuario;
import com.tfg.imf.modelo.GestorHotel;
import com.tfg.imf.entidades.ImagenesHotel;
import com.tfg.imf.persistencia.IRepositorioHotel;
import com.tfg.imf.persistencia.IRepositorioImagenesHotel;

import antlr.StringUtils;

import java.util.ArrayList;
import java.util.List;


import java.io.IOException;

//import org.springframework.util.StringUtils;




@Controller
public class FormularioHotelControlador {

	@Autowired
	GestorHotel gestorHotel;
	
	@Autowired
	IRepositorioHotel repositorioHotel;
	
	@Autowired
	IRepositorioImagenesHotel repositorioImagenesHotel;
	
	
	
	
	
	
	//VISTAS
	 @GetMapping("/insertarOfertasAdmin")
	    public ModelAndView mostrarFormularioInsertarHotel() {
	        ModelAndView mav = new ModelAndView("insertarOfertasAdmin");
	        mav.addObject("hotel", new Hotel());
	        return mav;
	    }
	
	
	
	
	//CRUD
	 
	/*
	@PostMapping("/insertarHotel")
	public ModelAndView insertarHotel(@ModelAttribute Hotel hotel) {

		System.out.println("FormularioOfertaCrontrolador.insertarHotel: " + hotel);

		try {
			// Crear una instancia de Usuario
			Hotel nuevoHotel = new Hotel();

			nuevoHotel.setNombreHotel(hotel.getNombreHotel());
			nuevoHotel.setCategoriaHotel(hotel.getCategoriaHotel());
			nuevoHotel.setAforoHotel(hotel.getAforoHotel());
			nuevoHotel.setDireccionHotel(hotel.getDireccionHotel());
			nuevoHotel.setPrecioHotel(hotel.getPrecioHotel());
			
			
			
			
			
			// Establecer atributos booleanos
			nuevoHotel.setPiscinaHotel(hotel.isPiscinaHotel());
			nuevoHotel.setGimnasioHotel(hotel.isGimnasioHotel());
			nuevoHotel.setTerrazaHotel(hotel.isTerrazaHotel());
			nuevoHotel.setSpaHotel(hotel.isSpaHotel());

			// Llamar al método insertar del GestorUsuario
			gestorHotel.insertar(nuevoHotel);

			ModelAndView mav = new ModelAndView("insertarOfertasAdmin");

			// Agregar atributo al ModelAndView
			mav.addObject("exitoRegistro", true);

			return mav;

		} catch (Exception e) {

			// Si algo falla, que muestre el error
			ModelAndView mav = new ModelAndView("error");

			mav.addObject("mensaje", "Error al insertar el hotel en la base de datos");

			mav.addObject("excepcion", e);

			return mav;
		}
	}
	*/
	 
	 private List<MultipartFile> multipartFiles = new ArrayList<>();

	 
	 @PostMapping("/insertarHotel")
	 public ModelAndView insertarHotel(@ModelAttribute Hotel hotel, @RequestParam("multipartFiles") List<MultipartFile> files) {
		 
	     System.out.println("FormularioOfertaCrontrolador.insertarHotel: " + hotel);

	     try {
	         // Crear una instancia de Hotel
	         Hotel nuevoHotel = new Hotel();

	         nuevoHotel.setNombreHotel(hotel.getNombreHotel());
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
	         List<ImagenesHotel> imagenes = new ArrayList<>();
	         for (MultipartFile file : files) {
	             if (!file.isEmpty()) {
	                 
	                 try {
	                     // Aquí guardarías la imagen en el sistema de archivos y obtendrías la URL donde se guarda
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
	         return mav;

	     } catch (Exception e) {
	         // Si algo falla, que muestre el error
	         ModelAndView mav = new ModelAndView("error");
	         mav.addObject("mensaje", "Error al insertar el hotel en la base de datos");
	         mav.addObject("excepcion", e);
	         return mav;
	     }
	 }

	
	
	
	
	
}
