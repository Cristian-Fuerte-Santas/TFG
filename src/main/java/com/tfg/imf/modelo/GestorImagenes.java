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
	private final String directorioImagenesSalaHotel = "C:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBD/imagenesSalaHotel/";
	private final String directorioImagenesRestaurantes = "C:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBD/imagenesRestaurantes/";
	private final String directorioImagenesMenuRestaurante = "C:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBD/imagenesMenuRestaurante/";
	private final String directorioImagenesHoteles = "C:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBD/imagenesHoteles/";

	@Transactional
	public String guardarImagen(MultipartFile file, String tipoImagen) throws IOException {
	    // Seleccione el directorio en función del tipo de imagen
	    String directorioImagenes;
	    switch (tipoImagen) {
	        case "SalaHotel":
	            directorioImagenes = directorioImagenesSalaHotel;
	            break;
	        case "Restaurantes":
	            directorioImagenes = directorioImagenesRestaurantes;
	            break;
	        case "MenuRestaurante":
	            directorioImagenes = directorioImagenesMenuRestaurante;
	            break;
	        case "Hoteles":
	            directorioImagenes = directorioImagenesHoteles;
	            break;
	        default:
	            throw new IllegalArgumentException("Tipo de imagen desconocido: " + tipoImagen);
	    }
	    
	    // Aquí continúa tu método guardarImagen existente
        String nombreArchivo = StringUtils.cleanPath(file.getOriginalFilename());
        Path rutaArchivo = Paths.get(directorioImagenes + nombreArchivo);
        Files.copy(file.getInputStream(), rutaArchivo, StandardCopyOption.REPLACE_EXISTING);
    
        // Devuelve la ruta a la imagen para que puedas guardarla en la base de datos
        return directorioImagenes + nombreArchivo;
	}
}
