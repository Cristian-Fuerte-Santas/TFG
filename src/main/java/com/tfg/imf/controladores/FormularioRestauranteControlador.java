package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tfg.imf.modelo.GestorRestaurante;
import com.tfg.imf.persistencia.IRepositorioRestaurante;

@Controller
public class FormularioRestauranteControlador {

	@Autowired
	private GestorRestaurante gestorRestaurante;
	
	@Autowired
	private IRepositorioRestaurante repositorioRestaurante;

	public FormularioRestauranteControlador() {
		super();
		System.out.println("Creando una instancia de FormularioRestauranteControlador");
	}
	
	
}
