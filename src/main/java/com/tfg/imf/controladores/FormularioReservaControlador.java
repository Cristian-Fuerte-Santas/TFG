package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tfg.imf.modelo.GestorReserva;
import com.tfg.imf.persistencia.IRepositorioReserva;

@Controller
public class FormularioReservaControlador {

	@Autowired
	private GestorReserva gestorReserva;
	
	@Autowired
	private IRepositorioReserva repositorioReserva;

	public FormularioReservaControlador() {
		super();
		System.out.println("Creando una instancia de FormularioReservaControlador");
	}
	
	
}
