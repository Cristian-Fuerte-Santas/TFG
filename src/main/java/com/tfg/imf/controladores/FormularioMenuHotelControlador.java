package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tfg.imf.modelo.GestorMenuHotel;
import com.tfg.imf.persistencia.IRepositorioMenuHotel;

@Controller
public class FormularioMenuHotelControlador {

	
	@Autowired
	private GestorMenuHotel gestorMenuHotel;
	
	@Autowired
	private IRepositorioMenuHotel repositorioMenuHotel;

	public FormularioMenuHotelControlador() {
		super();
		System.out.println("Creando una instancia de FormularioMenuHotelControlador");
	}
	
	
	
	
}
