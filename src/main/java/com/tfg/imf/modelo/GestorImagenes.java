package com.tfg.imf.modelo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.util.StringUtils;

@Service
public class GestorImagenes {
	// Agrega una variable String para cada ruta de directorio
	private final String directorioImagenes = "/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBd/";


	@Transactional
	public String guardarImagen(MultipartFile file) throws IOException {
	    String nombreArchivo = StringUtils.cleanPath(file.getOriginalFilename());
	    Path rutaArchivo = Paths.get(directorioImagenes + nombreArchivo);
	    Files.copy(file.getInputStream(), rutaArchivo, StandardCopyOption.REPLACE_EXISTING);

	    // Devuelve sólo el nombre del archivo
	    return nombreArchivo;
	}

	@Transactional
	public void eliminarImagen(String nombreArchivo) {
	    try {
	        // Eliminando el archivo de imagen
	        Path rutaArchivo = Paths.get(directorioImagenes + nombreArchivo);
	        Files.deleteIfExists(rutaArchivo);
	    } catch (IOException e) {
	        // Aquí puedes manejar el error como mejor te parezca. Podrías lanzar la excepción,
	        // registrarla, o simplemente ignorarla, dependiendo de las necesidades de tu aplicación.
	        System.out.println("Error al eliminar el archivo de imagen: " + nombreArchivo);
	    }
	}


}
