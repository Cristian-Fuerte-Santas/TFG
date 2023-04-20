package com.tfg.imf.modelo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.Restaurante;

import com.tfg.imf.persistencia.IRepositorioRestaurante;

@Service
public class GestorRestaurante {

	@Autowired
	private IRepositorioRestaurante repositorioRestaurante;

	public GestorRestaurante() {
		super();
		System.out.println("Creando instancia de GestorRestaurante");
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(Restaurante restaurante) {
		repositorioRestaurante.save(restaurante);
		repositorioRestaurante.flush();
		
		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}
	
	@Transactional
	public void modificar(Restaurante restaurante) {
		//para modificar tambien es save
		repositorioRestaurante.save(restaurante);
	}
	
	@Transactional
	public void borrar(Restaurante restaurante) {
		//para modificar tambien es save
		repositorioRestaurante.delete(restaurante);
	}
	
	
	
	
}
