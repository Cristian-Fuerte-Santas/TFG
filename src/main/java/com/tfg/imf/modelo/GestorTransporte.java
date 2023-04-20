package com.tfg.imf.modelo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.Transporte;

import com.tfg.imf.persistencia.IRepositorioTransporte;

@Service
public class GestorTransporte {

	@Autowired
	private IRepositorioTransporte repositorioTransporte;

	@Transactional(propagation = Propagation.REQUIRED) // @Transactional: para cuando queramos modificar la BD
	public void insertar(Transporte transporte) {
		repositorioTransporte.save(transporte);
		repositorioTransporte.flush();

		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}

	@Transactional
	public void modificar(Transporte transporte) {
		// para modificar tambien es save
		repositorioTransporte.save(transporte);
	}

	@Transactional
	public void borrar(Transporte transporte) {
		// para modificar tambien es save
		repositorioTransporte.delete(transporte);
	}

}
