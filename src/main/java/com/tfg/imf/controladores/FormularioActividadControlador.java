package com.tfg.imf.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tfg.imf.modelo.GestorActividad;
import com.tfg.imf.persistencia.IRepositorioActividad;

@Controller
public class FormularioActividadControlador {

	
	
	@Autowired
	private GestorActividad gestorActividad;
	
	@Autowired
	private IRepositorioActividad repositorioActividad;

	public FormularioActividadControlador() {
		super();
		System.out.println("Creando una instancia de FormularioActividadControlador");
	}
	
	
	
}
