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
import com.tfg.imf.entidades.ImagenesMenuRestaurante;
import com.tfg.imf.entidades.MenuRestaurante;
import com.tfg.imf.persistencia.IRepositorioImagenesMenuRestaurante;
import com.tfg.imf.persistencia.IRepositorioMenuRestaurante;

@Service
public class GestorMenuRestaurante {
	
	@Autowired
	private IRepositorioMenuRestaurante repositorioMenuRestaurante;
	
	@Autowired
	private IRepositorioImagenesMenuRestaurante repositorioImagenesMenuRestaurante;
	
	private final String directorioImagenesMenuRestaurante = "src/main/resources/static/imagenes/imagenesHoteles/";

	public GestorMenuRestaurante() {
		super();
		System.out.println("Creando instancia de GestorMenuRestaurante");
	}
	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(MenuRestaurante menuRestaurante) {
		repositorioMenuRestaurante.save(menuRestaurante);
		repositorioMenuRestaurante.flush();
		
		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}
	
	@Transactional
	public void modificar(MenuRestaurante menuRestaurante) {
		//para modificar tambien es save
		repositorioMenuRestaurante.save(menuRestaurante);
	}
	
	@Transactional
	public void borrar(MenuRestaurante menuRestaurante) {
		//para modificar tambien es save
		repositorioMenuRestaurante.delete(menuRestaurante);
	}
	
	//PARA LAS IMAGGENES DEL MENU RESTAURANTE
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertarImagenHotel(ImagenesMenuRestaurante imagenMenuRestaurante) {
		repositorioImagenesMenuRestaurante.save(imagenMenuRestaurante);
		repositorioImagenesMenuRestaurante.flush();

		System.out.println("Se ha insertado la imagen del hotel correctamente");
	}

	@Transactional
	public void borrarImagenHotel(ImagenesMenuRestaurante imagenMenuRestaurante) {
		// para modificar tambien es save
		repositorioImagenesMenuRestaurante.delete(imagenMenuRestaurante);
	}
	
	
	@Transactional
	public String guardarImagen(MultipartFile file) throws IOException {

		// Crear el directorio si no existe
		Path directorioPath = Paths.get(directorioImagenesMenuRestaurante);

		if (!Files.exists(directorioPath)) {

			Files.createDirectories(directorioPath);
		}

		// Guardar el archivo en el directorio
		Path imagePath = directorioPath.resolve(file.getOriginalFilename());

		Files.copy(file.getInputStream(), imagePath);

		// Devolver la URL donde se guarda la imagen
		return "/imagenes/imagenesMenuRestaurante/" + file.getOriginalFilename();
	}

}
