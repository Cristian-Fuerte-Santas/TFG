package com.tfg.imf.modelo;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.tfg.imf.entidades.Usuario;
import com.tfg.imf.persistencia.IRepositorioUsuario;

@Service
public class GestorUsuario {

	
	//llamo a la interfaz
	
	
	@Autowired
	private IRepositorioUsuario repositorioUsuario;
	
	public GestorUsuario() {
		super();
		System.out.println("Creando instancia de GestorUsuario");
	}

	
	@Transactional(propagation=Propagation.REQUIRED) //@Transactional: para cuando queramos modificar la BD 	
	public void insertar(Usuario usuario) {
		
		System.out.println("Ha entrado detro de insertar de Gestor Usuario");
		
		System.out.println(usuario.toString());
		repositorioUsuario.save(usuario);
		repositorioUsuario.flush();
		
		// Mostrar un mensaje de éxito
		System.out.println("El registro se ha realizado correctamente");

	}
	
	@Transactional
	public void modificar(Usuario usuario) {
		//para modificar tambien es save
		repositorioUsuario.save(usuario);
	}
	
	@Transactional
	public void borrar(Usuario usuario) {
		//para modificar tambien es save
		repositorioUsuario.delete(usuario);
	}
	
	public List<Usuario> verTodosLosUsuarios() {
		
		return repositorioUsuario.verTodosLosUsuarios();
	}
	
	
	
	
	

}