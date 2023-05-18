package com.tfg.imf.modelo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.Hotel;
import com.tfg.imf.entidades.ImagenesHotel;

import com.tfg.imf.persistencia.IRepositorioHotel;
import com.tfg.imf.persistencia.IRepositorioImagenesHotel;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.web.multipart.MultipartFile;

@Service
public class GestorHotel {

	@Autowired
	private IRepositorioHotel repositorioHotel;

	@Autowired
	private IRepositorioImagenesHotel repositorioImagenesHotel;

	@Autowired
	private GestorImagenes gestorImagenes;

	public GestorHotel() {
		super();
		System.out.println("Creando instancia de GestorHotel");
	}

	@Transactional(propagation = Propagation.REQUIRED) // @Transactional: para cuando queramos modificar la BD
	public void insertar(Hotel hotel) {
		repositorioHotel.save(hotel);
		repositorioHotel.flush();

		System.out.println("Se ha insertado el hotel correctamente");

	}

	@Transactional
	public void modificar(Hotel hotel) {
		// para modificar tambien es save
		repositorioHotel.save(hotel);
	}

	@Transactional
	public void borrar(Hotel hotel) {

		// Antes de eliminar el hotel, primero elimina sus imágenes
		for (ImagenesHotel imagen : hotel.getListadoImagenesHotel()) {
			String nombreArchivo = Paths.get(imagen.getUrlImagenHotel()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);
		}

		repositorioHotel.delete(hotel);
	}

	// PARA LAS IMAGENES DEL HOTEL

	// Para insertarlas en la base de datos
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertarImagenHotel(ImagenesHotel imagenHotel) {
		repositorioImagenesHotel.save(imagenHotel);
		repositorioImagenesHotel.flush();

		System.out.println("Se ha insertado la imagen del hotel correctamente");
	}

	// Para insertarlas en el ordenador localmente, en el sistema de archivos
	@Transactional
	public String guardarImagenHotel(MultipartFile file) throws IOException {
		return gestorImagenes.guardarImagen(file);
	}

	@Transactional(readOnly = true) // Especifica que esta transacción es solo de lectura
	public List<Hotel> verTodosLosHoteles() {
		return repositorioHotel.verTodosLosHoteles();
	}

	// Para seleccionar el hotel el boton de modificar correspondiente
	@Transactional(readOnly = true)
	public Hotel obtenerHotelPorId(Integer idHotel) {
		try {
			return repositorioHotel.findById(idHotel).orElse(null);
		} catch (NoSuchElementException e) {
			System.out.println("No se encontró el hotel con el id: " + idHotel);

			return null;
		}
	}

}
