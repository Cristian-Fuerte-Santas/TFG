package com.tfg.imf.modelo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.Actividad;

import com.tfg.imf.persistencia.IRepositorioActividad;

@Service
public class GestorActividad {
	
	
	@Autowired
	private IRepositorioActividad repositorioActividad;

	public GestorActividad() {
		
		super();
		System.out.println("Creando instancia de GestorActividad");	}
	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(Actividad actividad) {
		repositorioActividad.save(actividad);
		repositorioActividad.flush();
		
		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}
	
	@Transactional
	public void modificar(Actividad actividad) {
		//para modificar tambien es save
		repositorioActividad.save(actividad);
	}
	
	@Transactional
	public void borrar(Actividad actividad) {
		//para modificar tambien es save
		repositorioActividad.delete(actividad);
	}

}
