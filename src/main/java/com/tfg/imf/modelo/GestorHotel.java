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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

@Service
public class GestorHotel {

	@Autowired
	private IRepositorioHotel repositorioHotel;

	@Autowired
	private IRepositorioImagenesHotel repositorioImagenesHotel;

	private final String directorioImagenes = "src/main/resources/static/imagenes/imagenesHoteles/";

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
		// para modificar tambien es save
		repositorioHotel.delete(hotel);
	}

	// PARA LAS IMAGENES DEL HOTEL

	@Transactional(propagation = Propagation.REQUIRED)
	public void insertarImagenHotel(ImagenesHotel imagenHotel) {
		repositorioImagenesHotel.save(imagenHotel);
		repositorioImagenesHotel.flush();

		System.out.println("Se ha insertado la imagen del hotel correctamente");
	}

	@Transactional
	public void borrarImagenHotel(ImagenesHotel imagenHotel) {
		// para modificar tambien es save
		repositorioImagenesHotel.delete(imagenHotel);
	}

	@Transactional
	public String guardarImagen(MultipartFile file) throws IOException {

		// Crear el directorio si no existe
		Path directorioPath = Paths.get(directorioImagenes);

		if (!Files.exists(directorioPath)) {

			Files.createDirectories(directorioPath);
		}

		// Guardar el archivo en el directorio
		Path imagePath = directorioPath.resolve(file.getOriginalFilename());

		Files.copy(file.getInputStream(), imagePath);

		// Devolver la URL donde se guarda la imagen
		return "/imagenes/imagenesHoteles/" + file.getOriginalFilename();
	}

}
