package com.tfg.imf;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ConfiguracionRutaImagenes implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/imagenes/imagenesSalaHotel/**")
                .addResourceLocations("file:///C:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBD/imagenesSalaHotel/");
        
        registry.addResourceHandler("/imagenes/imagenesRestaurantes/**")
                .addResourceLocations("file:///C:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBD/imagenesRestaurantes/");
                
        registry.addResourceHandler("/imagenes/imagenesMenuRestaurante/**")
                .addResourceLocations("file:///C:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBD/imagenesMenuRestaurante/");
                
        registry.addResourceHandler("/imagenes/imagenesHoteles/**")
                .addResourceLocations("file:///C:/Users/cristianfuertesantas/Pictures/ImagenesInsertadasDesdeBD/imagenesHoteles/");
    }
}
