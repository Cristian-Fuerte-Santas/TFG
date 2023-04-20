package com.tfg.imf.modelo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.SalaHotel;

import com.tfg.imf.persistencia.IRepositorioSalaHotel;

@Service
public class GestorSalaHotel {

	@Autowired
	private IRepositorioSalaHotel repositorioSalaHotel;

	public GestorSalaHotel() {
		super();
		System.out.println("Creando instancia de GestorSalaHotel");
	}
	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(SalaHotel salaHotel) {
		repositorioSalaHotel.save(salaHotel);
		repositorioSalaHotel.flush();
		
		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}
	
	@Transactional
	public void modificar(SalaHotel salaHotel) {
		//para modificar tambien es save
		repositorioSalaHotel.save(salaHotel);
	}
	
	@Transactional
	public void borrar(SalaHotel salaHotel) {
		//para modificar tambien es save
		repositorioSalaHotel.delete(salaHotel);
	}
	
	
}
