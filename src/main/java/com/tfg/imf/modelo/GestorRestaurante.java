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

import com.tfg.imf.entidades.Restaurante;
import com.tfg.imf.persistencia.IRepositorioImagenesRestaurante;
import com.tfg.imf.persistencia.IRepositorioRestaurante;

@Service
public class GestorRestaurante {

	@Autowired
	private IRepositorioRestaurante repositorioRestaurante;

	@Autowired
	private IRepositorioImagenesRestaurante repositorioImagenesRestaurante;

	private final String directorioImagenesRestaurantes = "src/main/resources/static/imagenes/imagenesRestaurantes/";

	public GestorRestaurante() {
		super();
		System.out.println("Creando instancia de GestorRestaurante");
	}

	@Transactional(propagation = Propagation.REQUIRED) // @Transactional: para cuando queramos modificar la BD
	public void insertar(Restaurante restaurante) {
		repositorioRestaurante.save(restaurante);
		repositorioRestaurante.flush();

		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}

	@Transactional
	public void modificar(Restaurante restaurante) {
		// para modificar tambien es save
		repositorioRestaurante.save(restaurante);
	}

	@Transactional
	public void borrar(Restaurante restaurante) {
		// para modificar tambien es save
		repositorioRestaurante.delete(restaurante);
	}

	@Transactional
	public String guardarImagenRestaurante(MultipartFile file) throws IOException {

		// Crear el directorio si no existe
		Path directorioPath = Paths.get(directorioImagenesRestaurantes);

		if (!Files.exists(directorioPath)) {

			Files.createDirectories(directorioPath);
		}

		// Guardar el archivo en el directorio
		Path imagePath = directorioPath.resolve(file.getOriginalFilename());

		Files.copy(file.getInputStream(), imagePath);

		// Devolver la URL donde se guarda la imagen
		return "/imagenes/imagenesRestaurantes/" + file.getOriginalFilename();
	}

}
