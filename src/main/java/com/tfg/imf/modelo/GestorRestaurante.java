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

import com.tfg.imf.entidades.ImagenesRestaurante;
import com.tfg.imf.entidades.Restaurante;
import com.tfg.imf.persistencia.IRepositorioImagenesRestaurante;
import com.tfg.imf.persistencia.IRepositorioRestaurante;

@Service
public class GestorRestaurante {

	@Autowired
	private IRepositorioRestaurante repositorioRestaurante;

	@Autowired
	private IRepositorioImagenesRestaurante repositorioImagenesRestaurante;

	@Autowired
	private GestorImagenes gestorImagenes;

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

		// Antes de eliminar el restaurante, primero elimina sus imágenes
		for (ImagenesRestaurante imagen : restaurante.getListadoImagenesRestaurante()) {
			String nombreArchivo = Paths.get(imagen.getUrlImagenRestaurante()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);
		}

		repositorioRestaurante.delete(restaurante);
	}

	// Para insertarlas en la base de datos
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertarImagenRestaurante(ImagenesRestaurante imagenesRestaurante) {
		repositorioImagenesRestaurante.save(imagenesRestaurante);
		repositorioImagenesRestaurante.flush();

		System.out.println("Se ha insertado la imagen del restaurante correctamente");
	}

	// Para insertarlas en el ordenador localmente, en el sistema de archivos
	@Transactional
	public String guardarImagenRestaurante(MultipartFile file) throws IOException {

		return gestorImagenes.guardarImagen(file);
	}

	@Transactional(readOnly = true) // Especifica que esta transacción es solo de lectura
	public List<Restaurante> verTodosLosRestaurantes() {
		return repositorioRestaurante.verTodosLosRestaurantes();
	}

	// Para seleccionar el restaurante el boton de modificar correspondiente
	@Transactional(readOnly = true)
	public Restaurante obtenerRestaurantePorId(Integer idRestaurante) {
		try {
			return repositorioRestaurante.findById(idRestaurante).orElse(null);
		} catch (NoSuchElementException e) {
			System.out.println("No se encontró el restaurante con el id: " + idRestaurante);

			return null;
		}
	}

}
