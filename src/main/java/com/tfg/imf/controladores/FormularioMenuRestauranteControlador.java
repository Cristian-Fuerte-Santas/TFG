package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tfg.imf.modelo.GestorMenuRestaurante;
import com.tfg.imf.persistencia.IRepositorioMenuRestaurante;

@Controller
public class FormularioMenuRestauranteControlador {

	
	@Autowired
	private GestorMenuRestaurante gestorMenuRestaurante;
	
	@Autowired
	private IRepositorioMenuRestaurante repositorioMenuRestaurante;

	public FormularioMenuRestauranteControlador() {
		super();
		System.out.println("Creando una instancia de FormularioMenuRestauranteControlador");
	}
	
	
	
}
