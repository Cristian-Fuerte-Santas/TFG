package com.tfg.imf.modelo;

import java.io.IOException;

import java.nio.file.Paths;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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

	@Autowired
	private GestorImagenes gestorImagenes;

	public GestorMenuRestaurante() {
		super();
		System.out.println("Creando instancia de GestorMenuRestaurante");
	}

	@Transactional(propagation = Propagation.REQUIRED) // @Transactional: para cuando queramos modificar la BD
	public void insertar(MenuRestaurante menuRestaurante) {
		repositorioMenuRestaurante.save(menuRestaurante);
		repositorioMenuRestaurante.flush();

		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}

	@Transactional
	public void modificar(MenuRestaurante menuRestaurante) {
		// para modificar tambien es save
		repositorioMenuRestaurante.save(menuRestaurante);
	}

	@Transactional
	public void borrar(MenuRestaurante menuRestaurante) {

		for (ImagenesMenuRestaurante imagen : menuRestaurante.getListadoImagenesMenuRestaurante()) {
			String nombreArchivo = Paths.get(imagen.getUrlImagenMenuRestaurante()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);
		}

		repositorioMenuRestaurante.delete(menuRestaurante);
	}

	// PARA LAS IMAGGENES DEL MENU RESTAURANTE
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertarImagenMenuRestaurante(ImagenesMenuRestaurante imagenMenuRestaurante) {
		repositorioImagenesMenuRestaurante.save(imagenMenuRestaurante);
		repositorioImagenesMenuRestaurante.flush();

		System.out.println("Se ha insertado la imagen del hotel correctamente");
	}

	@Transactional
	public String guardarImagen(MultipartFile file) throws IOException {

		return gestorImagenes.guardarImagen(file);
	}

	@Transactional(readOnly = true) // Especifica que esta transacción es solo de lectura
	public List<MenuRestaurante> verTodosLosMenusRestaurantes() {
		return repositorioMenuRestaurante.verTodosLosMenusRestaurantes();
	}

	// Para seleccionar el hotel el boton de modificar correspondiente
	@Transactional(readOnly = true)
	public MenuRestaurante obtenerMenuRestaurantePorId(Integer idMenuRestaurante) {
		try {
			return repositorioMenuRestaurante.findById(idMenuRestaurante).orElse(null);
		} catch (NoSuchElementException e) {
			System.out.println("No se encontró el menu restaurante con el id: " + idMenuRestaurante);

			return null;
		}
	}

}
