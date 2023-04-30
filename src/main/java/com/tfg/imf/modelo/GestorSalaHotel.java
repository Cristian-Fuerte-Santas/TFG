package com.tfg.imf.modelo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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

	@Autowired
	private GestorImagenes gestorImagenes;

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

		for (ImagenesSalaHotel imagen : salaHotel.getListadoImagenesSalaHotel()) {
			String nombreArchivo = Paths.get(imagen.getUrlImagenSalaHotel()).getFileName().toString();
			gestorImagenes.eliminarImagen(nombreArchivo);
		}

		repositorioSalaHotel.delete(salaHotel);
	}

	// PARA LAS IMAGENES DE SALA HOTEL
	
	// Para insertarlas en la base de datos
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertarImagenHotel(ImagenesSalaHotel imagenSalaHotel) {
		repositorioImagenesSalaHotel.save(imagenSalaHotel);
		repositorioImagenesSalaHotel.flush();

		System.out.println("Se ha insertado la imagen de la sala hotel correctamente");
	}
	
	// Para insertarlas en el ordenador localmente, en el sistema de archivos
	@Transactional
	public String guardarImagenSalaHotel(MultipartFile file) throws IOException {

		return gestorImagenes.guardarImagen(file);
	}

	@Transactional(readOnly = true) // Especifica que esta transacción es solo de lectura
	public List<SalaHotel> verTodasLasSalasHotel() {
		return repositorioSalaHotel.verTodasLasSalasHotel();
	}

}
