package com.tfg.imf.modelo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.Reserva;

import com.tfg.imf.persistencia.IRepositorioReserva;

@Service
public class GestorReserva {

	@Autowired
	private IRepositorioReserva repositorioReserva;

	public GestorReserva() {
		super();
		System.out.println("Creando instancia de GestorReserva");
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(Reserva reserva) {
		repositorioReserva.save(reserva);
		repositorioReserva.flush();
		
		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}
	
	@Transactional
	public void modificar(Reserva reserva) {
		//para modificar tambien es save
		repositorioReserva.save(reserva);
	}
	
	@Transactional
	public void borrar(Reserva reserva) {
		//para modificar tambien es save
		repositorioReserva.delete(reserva);
	}
}
