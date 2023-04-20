package com.tfg.imf.modelo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.MenuRestaurante;

import com.tfg.imf.persistencia.IRepositorioMenuRestaurante;

@Service
public class GestorMenuRestaurante {
	
	@Autowired
	private IRepositorioMenuRestaurante repositorioMenuRestaurante;

	public GestorMenuRestaurante() {
		super();
		System.out.println("Creando instancia de GestorMenuRestaurante");
	}
	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(MenuRestaurante menuRestaurante) {
		repositorioMenuRestaurante.save(menuRestaurante);
		repositorioMenuRestaurante.flush();
		
		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}
	
	@Transactional
	public void modificar(MenuRestaurante menuRestaurante) {
		//para modificar tambien es save
		repositorioMenuRestaurante.save(menuRestaurante);
	}
	
	@Transactional
	public void borrar(MenuRestaurante menuRestaurante) {
		//para modificar tambien es save
		repositorioMenuRestaurante.delete(menuRestaurante);
	}

}
