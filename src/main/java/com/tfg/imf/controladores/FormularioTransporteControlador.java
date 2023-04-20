package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tfg.imf.modelo.GestorTransporte;
import com.tfg.imf.persistencia.IRepositorioTransporte;

@Controller
public class FormularioTransporteControlador {
	
	@Autowired
	private GestorTransporte gestorTransporte;
	
	@Autowired
	private IRepositorioTransporte repositorioTransporte;

	public FormularioTransporteControlador() {
		super();
		System.out.println("Creando una instancia de FormularioTransporteControlador");
	}
	
	
	

}
