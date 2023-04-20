package com.tfg.imf.modelo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.MenuHotel;
import com.tfg.imf.persistencia.IRepositorioMenuHotel;


@Service
public class GestorMenuHotel {
	
	
	@Autowired
	private IRepositorioMenuHotel repositorioMenuHotel;

	public GestorMenuHotel() {
		super();
		System.out.println("Creando instancia de GestorMenuHotel");
	}
	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(MenuHotel menuHotel) {
		repositorioMenuHotel.save(menuHotel);
		repositorioMenuHotel.flush();
		
		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}
	
	@Transactional
	public void modificar(MenuHotel menuHotel) {
		//para modificar tambien es save
		repositorioMenuHotel.save(menuHotel);
	}
	
	@Transactional
	public void borrar(MenuHotel menuHotel) {
		//para modificar tambien es save
		repositorioMenuHotel.delete(menuHotel);
	}
	
	

}
