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

import com.tfg.imf.entidades.Actividad;

import com.tfg.imf.entidades.ImagenesActividad;

import com.tfg.imf.persistencia.IRepositorioActividad;
import com.tfg.imf.persistencia.IRepositorioImagenesActividad;

@Service
public class GestorActividad {

	@Autowired
	private IRepositorioActividad repositorioActividad;

	@Autowired
	private IRepositorioImagenesActividad repositorioImagenesActividad;

	@Autowired
	private GestorImagenes gestorImagenes;

	public GestorActividad() {

		super();
		System.out.println("Creando instancia de GestorActividad");
	}

	@Transactional(propagation = Propagation.REQUIRED) // @Transactional: para cuando queramos modificar la BD
	public void insertar(Actividad actividad) {
		repositorioActividad.save(actividad);
		repositorioActividad.flush();

		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}

	@Transactional
	public void modificar(Actividad actividad) {
		// para modificar tambien es save
		repositorioActividad.save(actividad);
	}

	@Transactional
	public void borrar(Actividad actividad) {

		for (ImagenesActividad imagen : actividad.getListadoImagenesActividad()) {
			String nombreArchivo = Paths.get(imagen.getUrlImagenActividad()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);
		}

		repositorioActividad.delete(actividad);
	}

	// PARA LAS IMAGENES DE LA ACTIVIDAD

	// Para insertarlas en la base de datos
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertarImagenHotel(ImagenesActividad imagenesActividad) {
		repositorioImagenesActividad.save(imagenesActividad);
		repositorioImagenesActividad.flush();

		System.out.println("Se ha insertado la imagen de la actividad correctamente");
	}

	// Para insertarlas en el ordenador localmente, en el sistema de archivos
	@Transactional
	public String guardarImagenActividad(MultipartFile file) throws IOException {
		return gestorImagenes.guardarImagen(file);
	}

	@Transactional(readOnly = true)
	public List<Actividad> verTodasLasActividades() {
		return repositorioActividad.verTodasLasActividades();
	}

	// Para seleccionar la actividad el boton de modificar correspondiente
	@Transactional(readOnly = true)
	public Actividad obtenerActividadPorId(Integer idActividad) {
		try {
			return repositorioActividad.findById(idActividad).orElse(null);
		} catch (NoSuchElementException e) {
			System.out.println("No se encontró la actividad con el id: " + idActividad);

			return null;
		}
	}

}
