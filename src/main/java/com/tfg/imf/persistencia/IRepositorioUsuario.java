package com.tfg.imf.persistencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tfg.imf.entidades.Usuario;

public interface IRepositorioUsuario extends JpaRepository<Usuario, Integer> {

	@Query(value = "SELECT * FROM usuario", nativeQuery = true)
	List<Usuario> verTodosLosUsuarios();
	
	//Usuario findByEmailUsuarioAndContraseniaUsuario(String emailUsuario, String contraseniaUsuario);

	

	@Query

	("SELECT u.emailUsuario FROM Usuario u WHERE u.emailUsuario = :email")

	String findEmail(@Param("email") String email);

	

	@Query("SELECT u.idUsuario FROM Usuario u WHERE u.emailUsuario = :email")

	 Integer findIdByEmail(@Param("email") String email);

	


	@Query("SELECT u.contraseniaUsuario FROM Usuario u WHERE u.idUsuario = :id")

	String findContraseniaById(@Param("id") Integer idUsuario);
	
}
