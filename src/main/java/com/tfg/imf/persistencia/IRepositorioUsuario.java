package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tfg.imf.entidades.Usuario;

public interface IRepositorioUsuario extends JpaRepository<Usuario, Integer> {

	@Query(value = "SELECT * FROM usuario", nativeQuery = true)
	List<Usuario> verTodosLosUsuarios();
	
	
	
}
