package com.tfg.imf.modelo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tfg.imf.entidades.Destino;
import com.tfg.imf.persistencia.IRepositorioDestino;

@Service
public class GestorDestino {
	
	@Autowired
	private IRepositorioDestino repositorioDestino;

	public GestorDestino() {
		super();
		System.out.println("Creando instancia de GestorDestino");
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(Destino destino) {
		repositorioDestino.save(destino);
		repositorioDestino.flush();
		
		System.out.println("Se ha insertado el destino correctamente");

	}
	
	
	@Transactional
	public void modificar(Destino destino) {
		//para modificar tambien es save
		repositorioDestino.save(destino);
	}
	
	@Transactional
	public void borrar(Destino destino) {
		//para modificar tambien es save
		repositorioDestino.delete(destino);
	}
	
	public List<Destino> verTodosLosDestinos() {
		
		return repositorioDestino.verTodosLosDestinos();
	}
	

}
