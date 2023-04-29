package com.tfg.imf.modelo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tfg.imf.entidades.ImagenesHotel;
import com.tfg.imf.entidades.ImagenesSalaHotel;
import com.tfg.imf.entidades.SalaHotel;
import com.tfg.imf.persistencia.IRepositorioImagenesSalaHotel;
import com.tfg.imf.persistencia.IRepositorioSalaHotel;

@Service
public class GestorSalaHotel {

	@Autowired
	private IRepositorioSalaHotel repositorioSalaHotel;

	@Autowired
	private IRepositorioImagenesSalaHotel repositorioImagenesSalaHotel;

	private final String directorioImagenesSalasHotel = "src/main/resources/static/imagenes/imagenesSalasHotel/";

	public GestorSalaHotel() {
		super();
		System.out.println("Creando instancia de GestorSalaHotel");
	}

	@Transactional(propagation = Propagation.REQUIRED) // @Transactional: para cuando queramos modificar la BD
	public void insertar(SalaHotel salaHotel) {
		repositorioSalaHotel.save(salaHotel);
		repositorioSalaHotel.flush();

		// Mostrar un mensaje de éxito
		System.out.println("Se ha insertado la sala hotel correctamente");

	}

	@Transactional
	public void modificar(SalaHotel salaHotel) {
		// para modificar tambien es save
		repositorioSalaHotel.save(salaHotel);
	}

	@Transactional
	public void borrar(SalaHotel salaHotel) {
		// para modificar tambien es save
		repositorioSalaHotel.delete(salaHotel);
	}

	// PARA LAS IMAGENES DE SALA HOTEL

	@Transactional(propagation = Propagation.REQUIRED)
	public void insertarImagenHotel(ImagenesSalaHotel imagenSalaHotel) {
		repositorioImagenesSalaHotel.save(imagenSalaHotel);
		repositorioImagenesSalaHotel.flush();

		System.out.println("Se ha insertado la imagen del hotel correctamente");
	}

	@Transactional
	public void borrarImagenHotel(ImagenesSalaHotel imagenSalaHotel) {
		// para modificar tambien es save
		repositorioImagenesSalaHotel.delete(imagenSalaHotel);
	}

	@Transactional
	public String guardarImagenSalaHotel(MultipartFile file) throws IOException {

		// Crear el directorio si no existe
		Path directorioPath = Paths.get(directorioImagenesSalasHotel);

		if (!Files.exists(directorioPath)) {

			Files.createDirectories(directorioPath);
		}

		// Guardar el archivo en el directorio
		Path imagePath = directorioPath.resolve(file.getOriginalFilename());

		Files.copy(file.getInputStream(), imagePath);

		// Devolver la URL donde se guarda la imagen
		return "/imagenes/imagenesSalasHotel/" + file.getOriginalFilename();
	}

}
