package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tfg.imf.modelo.GestorSalaHotel;
import com.tfg.imf.persistencia.IRepositorioSalaHotel;

@Controller
public class FormularioSalaHotelControlador {

	
	@Autowired
	private GestorSalaHotel gestorSalaHotel;
	
	@Autowired
	private IRepositorioSalaHotel repositorioSalaHotel;

	public FormularioSalaHotelControlador() {
		super();
		System.out.println("Creando una instancia de FormularioSalaHotelControlador");
	}
	
	
	
}
